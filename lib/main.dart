import 'package:develocity/business_logic/auth_cubit/auth_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/constants/theme/themes.dart';
import 'package:develocity/presentation/admins/screens/profile/cubit/cubit.dart';
import 'package:develocity/presentation/admins/screens/splash/splash.dart';

import 'package:develocity/presentation/users/users_cubit/user_cubit.dart';
import 'package:develocity/presentation/users/users_cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/app_cubit/app_cubit.dart';
import 'constants/core/const.dart';
import 'constants/network/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await startShared();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: MyColors.mainColor,
      statusBarBrightness: Brightness.dark,
    ),
  );
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
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
        BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..changeAppMode(dark: prefs.getBool('isDark') ?? false)),
        BlocProvider(create: (BuildContext context) => UserCubit()),
        BlocProvider(create: (BuildContext context) => AuthCubit()),
      ],
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) {},
        builder: (context, Object? state) {
          return MaterialApp(
            // darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            themeMode: (prefs.getBool('isDark') == true)
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const SafeArea(child: SplashScreen()),
          );
        },
      ),
    );
  }
}
