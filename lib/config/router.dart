import 'package:flutter/material.dart';
import 'package:nepal_red_drop/screens/user/login/login.dart';
import 'package:nepal_red_drop/screens/user/navigation/bottom_nav.dart';

class AppRoute {
  AppRoute._();
  static const String logInRoute = '/login';
  static const String bottomNavRoute = '/bottomNav';
  static const String homeRoute = '/home';

  static Map<String, WidgetBuilder> getApplicationRoute() {
    return {
      logInRoute: (context) => const LoginScreen(),
      bottomNavRoute: (context) => const BottomNavScreen(),
      // homeRoute: (context) => const HomePage(),
    };
  }
}
