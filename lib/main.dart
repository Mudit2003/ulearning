import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(),
        ),
        BlocProvider<WelcomeBloc>(
          create: (context) => WelcomeBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const WelcomeView(),
          routes: <String, Widget Function(BuildContext)>{
            "/myHomePage/": (context) => const MyHomePage(),
            "/signIn/": (context) => const SignInView(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Home"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: 'hero',
                onPressed: () =>
                    context.read<AppBloc>().add(AppEventIncrement()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: 'heroine',
                onPressed: () =>
                    context.read<AppBloc>().add(AppEventDecrement()),
                tooltip: 'Decrement',
                child: const Icon(Icons.minimize_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
