import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/widget/appbar.dart';
import 'package:ulearning_app/pages/profile/settings/widget/settings_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void removeUserData() {
      context.read<AppBloc>().add(const AppEventTrigger(index: 0));
      Global.storageService.remove(AppConstants.storageUserTokenKey);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.signIn, (route) => false);
    }

    return Scaffold(
      appBar: buildSettingsAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  SettingsButton(
                    func: removeUserData,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
