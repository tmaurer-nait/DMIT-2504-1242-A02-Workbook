import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_cubit_example/state/user_cubit.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject our BlocProvider around the material app so
    // everything can access our cubits
    return BlocProvider(
      create: (_) => UserCubit(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
