import 'package:dmit2504a02/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:dmit2504a02/app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var authAppState = ApplicationState();

  runApp(MainApp(
    authAppState: authAppState,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.authAppState, super.key});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/': (context) {
        return HomePage(authAppState: authAppState);
      },
      '/sign-in': (context) {
        return SignInScreen(
          actions: [
            AuthStateChangeAction(
              (context, state) {
                final user = switch (state) {
                  SignedIn state => state.user,
                  UserCreated state => state.credential.user,
                  _ => null,
                };

                if (user == null) {
                  return;
                }

                if (state is UserCreated) {
                  // new user, update their display name to the first part of
                  // their email address
                  user.updateDisplayName(user.email!.split('@').first);
                }

                // remove the dialog and route to main page
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
            )
          ],
        );
      },
      '/profile': (context) {
        return ProfileScreen(actions: [
          SignedOutAction((context) {
            // remove the dialog and route to main page
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/');
          })
        ]);
      }
    };
    return MaterialApp(
      routes: routes,
    );
  }
}
