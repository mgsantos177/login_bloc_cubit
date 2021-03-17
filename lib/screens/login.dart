import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class InitLoginState extends LoginState {
  const InitLoginState();
}

@immutable
class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

// @immutable
// class LoadedLoginState extends LoginState {
//   final List<Contact> _contacts;

//   const LoadedLoginState(this._contacts);
// }

@immutable
class FatalErrorLoginState extends LoginState {
  const FatalErrorLoginState();
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitLoginState());
}
