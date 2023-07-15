
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEventUserName>(_userNameEvent);
    on<RegisterEventEmail>(_emailEvent);
    on<RegisterEventPassword>(_passwordEvent);
    on<RegisterEventConfirmPassword>(_confirmPasswordEvent);
  }
  void _userNameEvent(
      RegisterEventUserName event, Emitter<RegisterState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(RegisterEventEmail event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(
      RegisterEventPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      RegisterEventConfirmPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
