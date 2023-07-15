part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

@immutable
class AppEventTrigger extends AppEvent {
  final int index;
  const AppEventTrigger({required this.index}) : super();
}
