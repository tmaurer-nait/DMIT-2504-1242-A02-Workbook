import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class RainbowButton extends StatefulWidget {
  const RainbowButton({
    super.key,
    required this.child,
    this.onLongPress,
    this.onPressed,
  });

  final Function? onPressed;
  final Function? onLongPress;
  final Widget child;

  @override
  State<RainbowButton> createState() => _RainbowButtonState();
}

class _RainbowButtonState extends State<RainbowButton>
    with SingleTickerProviderStateMixin {
  late Color _color;
  late Color _lastColor;

  @override
  void initState() {
    super.initState();
    _color = Colors.red;
    _lastColor = Colors.blue;

    Timer.periodic(Duration(milliseconds: 6000), (timer) {
      setState(() {
        _lastColor = _color;
        _color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withValues(alpha: 1.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: ColorTween(begin: _lastColor, end: _color),
      duration: Duration(milliseconds: 3000),
      child: widget.child,
      builder: (_, Color? color, child) {
        return ElevatedButton(
          onPressed: () {
            widget.onPressed?.call();
          },
          onLongPress: () {
            widget.onLongPress?.call();
          },
          style: ElevatedButton.styleFrom(backgroundColor: color),
          child: child,
        );
      },
    );
  }
}
