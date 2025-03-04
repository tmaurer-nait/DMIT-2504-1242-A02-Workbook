import 'package:flutter/material.dart';

import 'package:riverpod_example/models/user.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstNamePage extends ConsumerWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Name Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            Text('User name: ${user.firstName} ${user.lastName}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          user.firstName = 'NewFirstName';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
