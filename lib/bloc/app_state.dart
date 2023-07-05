part of 'app_bloc.dart';

class AppState {
  int counter;
  AppState({required this.counter});
}

class InitStates extends AppState {
  InitStates() : super(counter: 0);
}
