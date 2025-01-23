import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imagePath;

  const ProfileImage({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Theme.of(context).colorScheme.primary,
          ),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          )),
    );
  }
}
