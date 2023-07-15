import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsTriggerEvent>(_triggerSettings);
  }

  // void _triggerSettings

  FutureOr<void> _triggerSettings(
      SettingsTriggerEvent event, Emitter<SettingsState> emit) {
    emit(const SettingsState());
  }
}
