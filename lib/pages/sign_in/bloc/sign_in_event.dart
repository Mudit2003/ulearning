part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInEventEmail extends SignInEvent {
  final String email;

  SignInEventEmail({this.email = ""});
}

class SignInEventPassword extends SignInEvent {
  final String password;

  SignInEventPassword({this.password = ""});
}
