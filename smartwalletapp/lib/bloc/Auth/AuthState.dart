
// ignore_for_file: file_names

import '../../models/user.dart';

abstract class AuthState{}

class AuthInitial extends AuthState{

}

class AuthSuccess extends AuthState{
  final User user;
  AuthSuccess(this.user);
}


class AuthError extends AuthState{
  final String message;
  AuthError(this.message);
}