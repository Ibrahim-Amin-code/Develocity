import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/theme/themes.dart';
import 'package:develocity/presentation/admins/screens/authentication/loign/loign_screen.dart';
import 'package:develocity/presentation/admins/screens/profile/cubit/cubit.dart';
<<<<<<< HEAD
import 'package:develocity/presentation/admins/screens/splash/splash.dart';
import 'package:develocity/presentation/admins/screens/tasks/tasks_screen.dart';
=======
import 'package:develocity/presentation/admins/screens/profile/profile_screen.dart';
import 'package:develocity/presentation/users/screens/home_layout/home_layout.dart';
import 'package:develocity/presentation/users/users_cubit/user_cubit.dart';
import 'package:develocity/presentation/users/users_cubit/user_state.dart';
>>>>>>> c4e7213069236b9d276da4bd685c99bff0adbbcc
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/network/bloc_observer.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: MyColors.mainColor,
      statusBarBrightness: Brightness.dark,
    ),
  );

  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ProfileCubit()),
        BlocProvider(create: (BuildContext context) => UserCubit()),
      ],
      child: BlocConsumer<UserCubit,UserStates>(
        listener: (context, state) {},
        builder: (context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: SafeArea(child: HomeLayoutScreen()),
          );
        },
      ),
    );
  }
}
