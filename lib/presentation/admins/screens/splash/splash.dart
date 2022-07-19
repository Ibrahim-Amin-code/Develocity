// ignore_for_file: avoid_print

import 'dart:async';
import 'package:develocity/business_logic/app_cubit/app_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/authentication/user_or_admin/user_or_admin_screen.dart';
import 'package:develocity/presentation/admins/screens/bottom_nav/layout.dart';
import 'package:develocity/presentation/users/screens/home_layout/user_home_layout.dart';
import 'package:flutter/material.dart';
import '../../../../constants/core/const.dart';
import '../../../../constants/network/cache_helper.dart';
import '../onBorading/onBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget screen = OnBoardingScreen();
  getScreen() async {
    final bool isOnboarding = prefs.getBool("onBoarding") ?? false;
    final bool isLogin = prefs.getBool("isLogin") ?? false;
    final String userType = prefs.getString('user_type').toString();
    if (isOnboarding) {
      if (isLogin) {
        if (userType == 'admin') {
          setState(() {
            screen = LayoutScreen(index: 0);
          });
        } else if (userType == 'user') {
          setState(() {
            screen = UserHomeLayoutScreen();
          });
        }
      } else if (isLogin == false) {
        setState(() {
          screen = const UserOrAdminScreen();
        });
      }
    } else {
      setState(() {
        screen = OnBoardingScreen();
      });
    }
  }

  @override
  void initState() {
    getScreen();
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => screen),
            ));
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
