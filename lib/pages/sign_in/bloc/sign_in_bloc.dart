
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEventEmail>(_emailEventHandler);
    on<SignInEventPassword>(_passwordEventHandler);
  }

  void _emailEventHandler(SignInEventEmail event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEventHandler(
    SignInEventPassword event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }
}
