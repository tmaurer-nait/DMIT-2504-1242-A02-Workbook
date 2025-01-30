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

class UserSignupForm extends StatefulWidget {
  const UserSignupForm({super.key});

  @override
  State<UserSignupForm> createState() => _UserSignupFormState();
}

class _UserSignupFormState extends State<UserSignupForm> {
  // Create a global key to uniquely ID the form widget

  final _formKey = GlobalKey<FormState>();

  // We need controllers to get information out of the fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is unmounted
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text('New User Form'),
          TextFormField(
            // Bind the appropriate controller
            controller: _usernameController,
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
            controller: _passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              label: Text('Password'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // This is where we would get the data and send it off to our backend
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Username: ${_usernameController.text}, Password: ${_passwordController.text}')),
                );

                _formKey.currentState!.reset();
              }
            },
            child: Text('Sign up'),
          )
        ],
      ),
    );
  }
}
