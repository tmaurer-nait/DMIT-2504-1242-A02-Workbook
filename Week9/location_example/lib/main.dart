import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Tracks the location of the device
  late Position? _position;

  @override
  void initState() {
    super.initState();
    _position = null;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Services are disabled on this device');
    }

    // Check permissions
    permission = await Geolocator.checkPermission();
    // If I already have permissions I skip all this
    if (permission == LocationPermission.denied) {
      // If we don't have, ask
      permission = await Geolocator.requestPermission();
      // If they deny after being explictly asked, return an error
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
        // Here you could ask again, show UI explaining issue, stop doing location things etc.
      }
    }

    // Final permission check
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    // Return location
    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );
  }

  void handlePress() async {
    try {
      final position = await _determinePosition();
      setState(() {
        _position = position;
      });
    } catch (e) {
      // If we don't have permissions for location services set to null
      setState(() {
        _position = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 110,
              ),
              Text('Location: ${_position ?? "unknown"}'),
              ElevatedButton(
                onPressed: handlePress,
                child: Text('Get Position'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
