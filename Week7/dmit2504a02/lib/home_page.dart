import 'package:flutter/material.dart';
import 'package:dmit2504a02/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.authAppState, super.key});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth Demo'),
      ),
      body: ListView(
        children: [
          ListenableBuilder(
            listenable: authAppState,
            builder: (context, _) {
              return authAppState.loggedIn
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/profile');
                      },
                      child: Text('Profile'))
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/sign-in');
                      },
                      child: Text('Sign In'));
            },
          )
        ],
      ),
    );
  }
}
