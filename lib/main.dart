import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPageRoutes.allBlocProviders(context)],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(393, 852),
        builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(),
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              elevation: 0,
              backgroundColor: AppColors.primaryBackground,
            ),
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryBackground),
            useMaterial3: true,
          ),
          onGenerateRoute: AppPageRoutes.generateRouteSettings,
        ),
      ),
    );
  }
}
