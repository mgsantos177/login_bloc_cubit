import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:login_bloc/componentes/container.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();
}

// SPLASH PAGE
@immutable
class AuthenticationUninitialized extends AuthenticationState {
  const AuthenticationUninitialized();
}

// HOME PAGE
@immutable
class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated();
}

// LOGIN PAGE
@immutable
class AuthenticationUnauthenticated extends AuthenticationState {
  const AuthenticationUnauthenticated();
}

// Progress
@immutable
class AuthenticationLoading extends AuthenticationState {}

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LocalStorage storage = new LocalStorage('user_oauth.json');
  AuthenticationCubit() : super(AuthenticationUninitialized());

  void verifyAuth() async {
    await storage.ready;
    final user = storage.getItem('user');
    if (user != null) {
      emit(AuthenticationAuthenticated());
      return;
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }
}

class AuthenticationContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
      create: (BuildContext context) {
        final cubit = AuthenticationCubit();
        cubit.verifyAuth();
        return cubit;
      },
      child: AuthenticationView(),
    );
  }
}

class AuthenticationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return Text('SPLASH');
          }
          if (state is AuthenticationAuthenticated) {
            return Text('Olá');
          }
          if (state is AuthenticationUnauthenticated) {
            return Text('Login');
          }
          if (state is AuthenticationLoading) {
            return Text('Logando');
          }
          return const Text('Unknown error');
        },
      ),
    );
  }
}
