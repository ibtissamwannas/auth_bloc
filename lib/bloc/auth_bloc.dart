import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginButtonPressed>(_onAuthLoginButtonPressed);

    on<AuthLogoutButtonPressed>(_onLogoutButtonPressed);
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    print("chnage - $change");
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print("transation - $transition");
  }

  void _onAuthLoginButtonPressed(
      AuthLoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final pass = event.password;
      // email validation using regex
      final emailRegex = RegExp(
          r'^([a-zA-Z0-9_\-\.]+)(@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})$');
      if (!emailRegex.hasMatch(email)) {
        return emit(AuthError(error: "Invalid email address"));
      }
      if (pass.length < 6) {
        return emit(AuthError(error: "Password must be at least 6 characters"));
      }
      await Future.delayed(
          const Duration(
            seconds: 2,
          ), () {
        return emit(AuthSuccess(uid: "$email,$pass"));
      });
    } catch (e) {
      return emit(AuthError(error: e.toString()));
    }
  }

  void _onLogoutButtonPressed(
      AuthLogoutButtonPressed event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      await Future.delayed(
          const Duration(
            seconds: 1,
          ), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
