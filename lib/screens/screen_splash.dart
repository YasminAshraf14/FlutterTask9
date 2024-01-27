// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list/app_colors.dart';
import 'package:task_list/screens/screen_register.dart';

class ScreenSplash extends StatelessWidget {

  final Function() toggleTheme;

  ScreenSplash(this.toggleTheme);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ScreenRegister(toggleTheme)
          )
        );
      }
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FractionallySizedBox(
              widthFactor: 1 / 1.5,
              child: Lottie.asset(
                'assets/lottie/splash_animation.json',
                repeat: true,
                reverse: false,
                animate: true,
              ),
            ),
          ),
          SizedBox(height: 16,),
          Text(
            'Taskati',
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16,),
          Text(
            "It's Time to Get Organized",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.hint,
            ),
          ),
        ],
      ),
    );
  }
}
