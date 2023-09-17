import 'package:flutter/material.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/global.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});
  UserItem? userProfile = Global.storageService.getUserProfile();

  void init() {
    print('Home controller init method');
  }
}
