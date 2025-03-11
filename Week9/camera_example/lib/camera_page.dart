import 'package:camera_example/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.description});

  final CameraDescription description;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  late XFile? imageFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.description, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) return;

      setState(() {
        // Useful for rerendering after the controller is initialized
        // Set camera presets here if desired
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Reprompt for camera access
            // Or shutdown app, etc.
            break;
          default:
            // Handle any other errors here
            break;
        }
      }
    });
  }

  Future<XFile?> takePicture() async {
    // if we are already taking a picture do nothing
    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      return await controller.takePicture();
    } catch (e) {
      // Try taking another picture, tell the user it failed, crash the app
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(title: Text('Not ready')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhotosPage()));
              },
              icon: Icon(Icons.photo))
        ],
      ),
      body: Center(child: Expanded(child: CameraPreview(controller))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          takePicture().then((XFile? file) {
            if (mounted) {
              // store the file in the state
              setState(() {
                imageFile = file;
              });

              // show a message of where the file is saved
              if (file != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Picture saved to ${file.path}')));
              }
            }
          });
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
