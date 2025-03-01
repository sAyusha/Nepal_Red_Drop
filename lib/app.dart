import 'package:flutter/material.dart';
import 'package:nepal_red_drop/config/router.dart';
import 'package:nepal_red_drop/config/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nepal Red Drop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getApplicationTheme(context),
      initialRoute: AppRoute.logInRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
