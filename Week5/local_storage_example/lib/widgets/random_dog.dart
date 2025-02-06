import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  final String endpoint = 'https://dog.ceo/api/breeds/image/random';

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String dogImageUrl = '';
  int likes = 0;
  int dislikes = 0;

  Future<String> getRandomDogURL() async {
    var endpointURI = Uri.parse(widget.endpoint);
    var response = await http.get(endpointURI);
    return jsonDecode(response.body)['message'];
  }

  @override
  void initState() {
    super.initState();

    // Open the dog file directory
    getTemporaryDirectory().then((dir) {
      final file = File('${dir.path}/dog.jpg');

      // If there is a saved dog use that image
      if (file.existsSync()) {
        setState(() {
          dogImageUrl = '${dir.path}/dog.jpg';
        });
      } else {
        // If there isn't load a dog from the internet
        getRandomDogURL().then((url) {
          setState(() {
            dogImageUrl = url;
          });
        });
      }
    });
  }

  Widget _buildDogImage() {
    Widget outputWidget;

    if (dogImageUrl.trim().isNotEmpty) {
      // set outputWidget to the dog image
      if (dogImageUrl.startsWith('http')) {
        // New dog image from the internet
        outputWidget = Image.network(dogImageUrl);
        // If we have a new dog image from the internet save it to file
        // in case the user restarts the app
        _saveImage(dogImageUrl);
      } else {
        // Old dog image from the file system
        outputWidget = Image.file(File(dogImageUrl));
      }
    } else {
      outputWidget = CircularProgressIndicator();
    }

    // Wrap this in gesture detection
    return GestureDetector(
      onDoubleTap: () {
        getRandomDogURL().then((url) {
          setState(() {
            likes++;
            dogImageUrl = url;
          });
        });
      },
      onLongPress: () {
        getRandomDogURL().then((url) {
          setState(() {
            dislikes++;
            dogImageUrl = url;
          });
        });
      },
      child: outputWidget,
    );
  }

  void _saveImage(String url) async {
    // Get the temp directory
    final dir = await getTemporaryDirectory();

    // Then create the file path
    final filePath = '${dir.path}/dog.jpg';

    // Get the dog image from the url
    final response = await http.get(Uri.parse(url));

    // Then write the dog image to the file
    final file = File(filePath);
    file.writeAsBytesSync(response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDogImage(),
        LikeText(
          number: likes,
        ),
        LikeText(
          isLike: false,
          number: dislikes,
        ),
      ],
    );
  }
}

class LikeText extends StatelessWidget {
  // True renders Likes: , false renders Dislikes:
  final bool isLike;
  final int number;

  const LikeText({this.isLike = true, required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            isLike ? 'Likes: ' : 'Dislikes: ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$number',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
