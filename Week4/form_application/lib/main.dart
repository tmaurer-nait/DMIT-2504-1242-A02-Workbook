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
          UserNameInput(controller: _usernameController),
          PasswordFormField(
            controller: _passwordController,
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Password cannot be empty'
                : null,
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

class UserNameInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const UserNameInput(
      {required this.controller, this.label = 'Username', Key? key})
      : super(key: key);

  @override
  State<UserNameInput> createState() => _UserNameInputState();
}

class _UserNameInputState extends State<UserNameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => value == null || value.trim().isEmpty
          ? 'Username cannot be empty'
          : null,
      decoration: InputDecoration(
        label: Text(widget.label),
      ),
    );
  }
}

class PasswordFormField extends FormField<String> {
  final TextEditingController controller;
  final String label;

  PasswordFormField(
      {required this.controller,
      this.label = 'Password',
      Key? key,
      FormFieldValidator<String>? validator})
      : super(
            key: key,
            validator: validator,
            builder: (FormFieldState<String> state) {
              _PasswordFormFieldState customState =
                  state as _PasswordFormFieldState;
              customState._controller = controller;

              return TextFormField(
                controller: controller,
                validator: validator,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  label: Text(label),
                ),
                // Required to enforcce correct validation
                onChanged: (value) {
                  customState.didChange(value);
                },
              );
            });

  // Can create our own custom state if necessary
  @override
  FormFieldState<String> createState() => _PasswordFormFieldState();
}

// Custom form field state for our new custom form field
class _PasswordFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    if (_controller != null) {
      _controller!.addListener(_controllerChanged);
    }
  }

  void reset() {
    super.reset();
    if (_controller != null) {
      _controller!.text = '';
    }
  }

  void _controllerChanged() {
    if (_controller != null) {
      didChange(_controller!.text);
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.removeListener(_controllerChanged);
    }
    super.dispose();
  }
}
