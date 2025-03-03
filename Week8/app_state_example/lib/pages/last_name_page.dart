import 'package:app_state_example/models/user.dart';
import 'package:flutter/material.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Name Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            ListenableBuilder(
                listenable: user,
                builder: (context, _) {
                  return Text('User name: ${user.firstName} ${user.lastName}');
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user last name here
        onPressed: () {
          user.lastName = 'NewLastName';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
