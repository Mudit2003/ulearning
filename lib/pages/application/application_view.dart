import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';
import 'package:ulearning_app/pages/application/widgets/bottom_navigation_bar.dart';

class ApplicationView extends StatefulWidget {
  const ApplicationView({super.key});

  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildApplicationPage(context.read<AppBloc>().state.index),
              bottomNavigationBar: AppBottomNavigationBar(
                  index: context.read<AppBloc>().state.index),
            ),
          ),
        );
      },
    );
  }
}
