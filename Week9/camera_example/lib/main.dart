import 'package:camera/camera.dart';
import 'package:camera_example/camera_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<CameraDescription> cameras = await availableCameras();

  runApp(MainApp(description: cameras[0]));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.description});

  final CameraDescription description;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraPage(description: description),
    );
  }
}
