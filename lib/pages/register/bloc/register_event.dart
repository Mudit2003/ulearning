part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterEventUserName extends RegisterEvent {
  final String username;
  const RegisterEventUserName({required this.username});
}

class RegisterEventEmail extends RegisterEvent {
  final String email;
  const RegisterEventEmail({required this.email});
}

class RegisterEventPassword extends RegisterEvent {
  final String password;
  const RegisterEventPassword({required this.password});
}

class RegisterEventConfirmPassword extends RegisterEvent {
  final String rePassword;
  const RegisterEventConfirmPassword({required this.rePassword});
}
