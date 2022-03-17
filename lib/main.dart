import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/router/app_router.dart';
import 'package:bloc_counter/presentation/screens/home_screen.dart';
import 'package:bloc_counter/presentation/screens/second_screen.dart';
import 'package:bloc_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final CounterCubit _counterCubit = CounterCubit();
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      // routes: {
      //   HomeScreen.routeName: (ctx) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: const HomeScreen(),
      //       ),
      //   SecondScreen.routeName: (ctx) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: const SecondScreen(),
      //       ),
      //   ThirdScreen.routeName: (ctx) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: const ThirdScreen(),
      //       ),
      // },
      // home: BlocProvider(
      //   create: (context) => CounterCubit(),
      //   child: const HomeScreen(),
      // ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
