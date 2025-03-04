import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_cubit_example/models/user.dart';

class UserCubit extends Cubit<UserState> {
  // Initialize the state with a default user
  UserCubit() : super(UserState(User('Bob', 'Ross')));

  // Methods to emit events
  void updateUser(User user) {
    return emit(UserState(user));
  }
}

class UserState {
  User user;

  UserState(this.user);
}
