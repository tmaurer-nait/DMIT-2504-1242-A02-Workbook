import 'package:animations_example/widgets/rainbow_button.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = _controller.drive(CurveTween(curve: Curves.bounceInOut));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Text('Rotation Animation'),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(height: 110),
            AnimatedBuilder(
                animation: _animation,
                child: Text('Rotation Animation with curve from initState'),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value * 2 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(height: 110),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 2 * math.pi),
                curve: Curves.bounceInOut,
                duration: Duration(seconds: 3),
                builder: (context, value, widget) {
                  return Transform.rotate(
                    angle: value,
                    child: Text('Rotation Tween Builder'),
                  );
                }),
            SizedBox(height: 110),
            RotationTransition(
              // turns: _controller,
              turns: CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInCubic,
              ),
              child: Text('Rotation Transition'),
            ),
            SizedBox(height: 110),
            RainbowButton(child: Text('Rainbow Button')),
          ],
        ),
      ),
    );
  }
}
