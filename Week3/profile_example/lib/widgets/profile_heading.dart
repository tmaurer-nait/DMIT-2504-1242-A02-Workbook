import 'package:flutter/material.dart';

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Employee Profile',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
