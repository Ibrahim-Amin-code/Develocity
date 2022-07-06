import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodySmall: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Display',
      fontSize: 12.0,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
      color: MyColors.mainColor,
    ),
    titleLarge: headingStyle.copyWith(color: MyColors.unselectedIconColor),
  ),
  cardColor: MyColors.backgroundColor,
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: MyColors.unselectedIconColor),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.grey,
  cardColor: Colors.grey.withOpacity(0.4),
  textTheme: TextTheme(
    titleLarge: headingStyle.copyWith(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff696CFF),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xff696CFF),
    ),),
);
