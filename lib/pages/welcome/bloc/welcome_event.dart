part of 'welcome_bloc.dart';

abstract class WelcomeEvent {}

class WelcomePageChangeEvent extends WelcomeEvent {
  final int page;

  WelcomePageChangeEvent({required this.page});
}
