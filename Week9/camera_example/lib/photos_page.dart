import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  var photosDir = '';
  List<String> photosList = [];

  @override
  void initState() {
    super.initState();

    getApplicationCacheDirectory().then((dir) {
      setState(() {
        // save the path to the state
        photosDir = dir.path;

        // get all photo paths in that directory
        dir.listSync().toList().forEach((file) {
          if (file.path.endsWith('jpg')) photosList.add(file.path);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos Page'),
      ),
      body: Center(
          child: Column(
        children: [
          photosList.isEmpty
              ? Text('No Saved Photos')
              : Expanded(
                  child: ListView.builder(
                      itemCount: photosList.length,
                      itemBuilder: (context, idx) {
                        return ListTile(
                          leading: Image.file(
                            File(photosList[idx]),
                            width: 36,
                            height: 36,
                          ),
                          title: Text(photosList[idx]),
                        );
                      }),
                ),
        ],
      )),
    );
  }
}
