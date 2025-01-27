import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Center(
            child: RandomDogImage(),
          ),
        ));
  }
}

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String dogImageUrl = '';
  int likes = 0;
  int dislikes = 0;

  static Future<String> getRandomDogURL() async {
    const String endpoint = 'https://dog.ceo/api/breeds/image/random';
    var endpointURI = Uri.parse(endpoint);
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

  @override
  Widget build(BuildContext context) {
    return dogImageUrl.isEmpty
        ? Text('Loading...')
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                dogImageUrl,
                height: 250,
              ),
              TextButton(
                onPressed: () {
                  getRandomDogURL().then((url) {
                    setState(() {
                      dogImageUrl = url;
                      likes++;
                    });
                  });
                },
                child: const Text('Like'),
              ),
              TextButton(
                onPressed: () {
                  getRandomDogURL().then((url) {
                    setState(() {
                      dogImageUrl = url;
                      dislikes++;
                    });
                  });
                },
                child: const Text('Dislike'),
              ),
              Text('Likes: $likes'),
              Text('Dislikes: $dislikes'),
            ],
          );
  }
}
