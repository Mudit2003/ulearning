// unify Blocprovider and routes and pages

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application_view.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/homepage/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/homepage/home_page.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/settings_page.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPageRoutes {
  static List<PageEntity> routes() => [
        PageEntity(
            route: AppRoutes.initial,
            page: const WelcomeView(),
            bloc: BlocProvider<WelcomeBloc>(create: (_) => WelcomeBloc())),
        PageEntity(
            route: AppRoutes.signIn,
            page: const SignInView(),
            bloc: BlocProvider<SignInBloc>(create: (_) => SignInBloc())),
        PageEntity(
            route: AppRoutes.register,
            page: const RegisterView(),
            bloc: BlocProvider<RegisterBloc>(create: (_) => RegisterBloc())),
        PageEntity(
            route: AppRoutes.applicationPage,
            page: const ApplicationView(),
            bloc: BlocProvider<AppBloc>(create: (_) => AppBloc())),
        PageEntity(
            route: AppRoutes.homePage,
            page: const HomePage(),
            bloc: BlocProvider<HomePageBloc>(create: (_) => HomePageBloc())),
        PageEntity(
            route: AppRoutes.settingsPage,
            page: const SettingsPage(),
            bloc: BlocProvider<SettingsBloc>(create: (_) => SettingsBloc())),
      ];

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    dynamic bloc;
    for (PageEntity entity in routes()) {
      bloc = entity.bloc;
      if (bloc != null) blocProviders.add(bloc);
    }

    return blocProviders;
  }

  // a modal that covers entire screen when called
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name matching wehn navigator gets trigerred
      // from list of page entity retrieve the route that is same as your route
      Iterable<PageEntity> result =
          routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        // if the result was not empty
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        // get the status if it is the first time user logged in p
        if (result.first.route == AppRoutes.initial && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.isLoggedIn;
          print(isLoggedIn.toString());
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationView(), settings: settings);
          } else {
            return MaterialPageRoute(
              builder: (_) => const SignInView(),
              settings: settings,
            );
          }
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }

    return MaterialPageRoute(
      builder: (_) => const SignInView(),
      settings: settings,
    );
  }
}

class PageEntity {
  final String route;
  final Widget page;
  final dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}
