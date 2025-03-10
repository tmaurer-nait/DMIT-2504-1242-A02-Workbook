import 'dart:math' as math;

import 'package:animations_example/pages/animations_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transformations')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to Animations Page',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AnimationsPage()),
          );
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Just a plain transform
            Transform.rotate(
              angle: 90 * (math.pi / 180),
              child: Text('Rotate only'),
            ),
            // Nested Transforms
            Transform.scale(
              scale: 1.5,
              child: Transform.translate(
                offset: Offset(50, -200),
                child: Transform.rotate(
                  angle: -45 * math.pi / 180,
                  child: Text('Scale, translate, rotate'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
