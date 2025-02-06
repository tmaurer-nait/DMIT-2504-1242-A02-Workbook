import 'package:flutter/material.dart';
import 'dart:convert';
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

    getRandomDogURL().then((url) {
      setState(() {
        dogImageUrl = url;
      });
    });
  }

  Widget _buildDogImage() {
    // Wrap this in gesture detection
    return dogImageUrl.isEmpty
        ? CircularProgressIndicator()
        : GestureDetector(
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
            child: Image.network(
              dogImageUrl,
              height: 250,
            ),
          );
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
