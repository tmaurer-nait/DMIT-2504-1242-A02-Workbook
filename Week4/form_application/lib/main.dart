import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: UserSignupForm(),
        ),
      ),
    );
  }
}

class UserSignupForm extends StatelessWidget {
  const UserSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Text('New User Form'),
          TextFormField(
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Username cannot be empty'
                  : null;
            },
            decoration: InputDecoration(
              label: Text('Username'),
            ),
          ),
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              label: Text('Password'),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Sign up'),
          )
        ],
      ),
    );
  }
}
