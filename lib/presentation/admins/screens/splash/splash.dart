// ignore_for_file: avoid_print

import 'dart:async';
import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import '../onBorading/onBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Develocity',
            style: headingStyle.copyWith(
              color: MyColors.mainColor,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
