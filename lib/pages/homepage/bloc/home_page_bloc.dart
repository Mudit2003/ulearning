import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageDotsEvent>(_homePageDots);
  }

  void _homePageDots(HomePageDotsEvent event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
