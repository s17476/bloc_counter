import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/screens/home_screen.dart';
import 'package:bloc_counter/presentation/screens/second_screen.dart';
import 'package:bloc_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SecondScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: const SecondScreen()));
      case ThirdScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: const ThirdScreen()));
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: const HomeScreen()));
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
