part of 'register_bloc.dart';

@immutable
class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  const RegisterState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.rePassword = "",
  });
  // safer mechanism is immutable class - all final variables and constant constructor

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      userName: username ?? userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
// thread safe - even if thread changes object does not changes
