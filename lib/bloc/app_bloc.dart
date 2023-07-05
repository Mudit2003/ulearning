import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitStates()) {
    on<AppEventIncrement>((event, emit) {
      emit(AppState(counter: state.counter + 1));
      log("I am getting called ++");
    });
    on<AppEventDecrement>((event, emit) {
      emit(AppState(counter: state.counter - 1));
      log("I am getting called --");
    });
  }
}
