part of 'home_page_bloc.dart';

@immutable
class HomePageState {
  final int index;
  const HomePageState({this.index = 0});

  HomePageState copyWith({int? index}) {
    return HomePageState(
      index: index ?? this.index,
    );
  }
}
