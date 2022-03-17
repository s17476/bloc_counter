import 'package:bloc_counter/presentation/screens/home_screen.dart';
import 'package:bloc_counter/presentation/screens/second_screen.dart';
import 'package:bloc_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SecondScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(),
        );
      case ThirdScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
