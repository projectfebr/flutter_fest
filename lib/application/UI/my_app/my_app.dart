import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/navigation/main_navigation.dart';
import 'package:flutter_fest/application/UI/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.ligth,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
