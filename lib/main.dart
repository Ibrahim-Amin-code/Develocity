import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/theme/themes.dart';
import 'package:develocity/presentation/admins/screens/profile/cubit/cubit.dart';
import 'package:develocity/presentation/admins/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: MyColors.mainColor,
      statusBarBrightness: Brightness.dark,
    ),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> ProfileCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SafeArea(child: ProfileScreen()),
      ),
    );
  }
}
