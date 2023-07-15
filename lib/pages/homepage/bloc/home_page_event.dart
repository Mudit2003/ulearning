part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDotsEvent extends HomePageEvent {
  final int index;
  const HomePageDotsEvent({required this.index});
}
