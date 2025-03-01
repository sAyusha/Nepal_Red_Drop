import 'package:flutter/material.dart';
import 'package:nepal_red_drop/screens/user/login/login.dart';
import 'package:nepal_red_drop/screens/user/signup/signup.dart';

class AppRoute {
  AppRoute._();
  static const String logInRoute = '/login';
  static const String signUpRoute = '/signup';
  static const String homeRoute = '/home';

  static Map<String, WidgetBuilder> getApplicationRoute() {
    return {
      logInRoute: (context) => const LoginScreen(),
      signUpRoute: (context) => const SignUpScreen(),
      // homeRoute: (context) => const HomePage(),
    };
  }
}
