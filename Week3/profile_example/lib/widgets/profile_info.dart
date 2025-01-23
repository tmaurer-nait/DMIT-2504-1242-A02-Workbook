import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Text(
              '$label: ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ));
  }
}
