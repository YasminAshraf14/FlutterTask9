// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:task_list/app_colors.dart';
import 'package:task_list/screens/screen_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool showLightTheme = true;

  @override
  Widget build(BuildContext context) {
    var themeLight = ThemeData.light().copyWith(
      primaryColor: AppColors.lightPrimaryColor,
    );
    var themeDark = ThemeData.light().copyWith(
      primaryColor: AppColors.darkPrimaryColor,
    );

    var themeMode = showLightTheme ? ThemeMode.light : ThemeMode.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(() => _toggleTheme()),
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: themeMode,
    );
  }

  void _toggleTheme() {
    setState(() {
      showLightTheme = !showLightTheme;
    });
  }

}
