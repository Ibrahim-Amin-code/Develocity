// ignore_for_file: use_key_in_widget_constructors

import 'package:develocity/business_logic/auth_cubit/auth_cubit.dart';
import 'package:develocity/business_logic/branch_cubit/branch_cubit.dart';
import 'package:develocity/business_logic/complaint_cubit/complaint_cubit.dart';
import 'package:develocity/business_logic/section_cubit/section_cubit.dart';
import 'package:develocity/business_logic/user_requirements_cubit/user_req_cubit.dart';
import 'package:develocity/business_logic/user_requirments_for_admin_cubit/user_requirments_for_admin_cubit.dart';
import 'package:develocity/business_logic/users_cubit/user_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/constants/theme/themes.dart';
import 'package:develocity/presentation/admins/screens/profile/cubit/cubit.dart';
import 'package:develocity/presentation/admins/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'business_logic/add_user/add_user_cubit.dart';
import 'business_logic/admin_cubit/admin_cubit.dart';
import 'business_logic/admin_news_cubit/admin_news_cubit.dart';
import 'business_logic/admin_profile_cubit/admin_profile_cubit.dart';
import 'business_logic/admin_task_cubit/admin_task_cubit.dart';
import 'business_logic/app_cubit/app_cubit.dart';
import 'business_logic/provider/map.dart';
import 'business_logic/user_complain_for_admin_cubit/user_complain_for_admin_cubit.dart';
import 'constants/core/const.dart';
import 'constants/network/bloc_observer.dart';
import 'constants/network/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await startShared();
  await mapIcon();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: MyColors.mainColor,
      statusBarBrightness: Brightness.dark,
    ),
  );

  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ProfileCubit()),
        BlocProvider(
            create: (BuildContext context) =>
                AdminProfileCubit()..getAdminProfile()),
        BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..changeAppMode(fromShared: prefs.getBool('isDark') ?? false)),
        BlocProvider(create: (BuildContext context) => UserCubit()),
        BlocProvider(
            create: (BuildContext context) => AddUserCubit()..getAdminUser()),
        BlocProvider(create: (BuildContext context) => AuthCubit()),
        BlocProvider(
            create: (BuildContext context) =>
                TaskAdminUserCubit()..getTasksAdminUser()),
        BlocProvider(
            create: (BuildContext context) => AdminCubit()..getAllAdmins()),
        BlocProvider(create: (BuildContext context) => ComplaintsCubit()),
        BlocProvider(create: (BuildContext context) => UserRequirementsCubit()),
        BlocProvider(
            create: (BuildContext context) =>
                UserRequirmentsForAdminCubit()..userRequirementsForAdmin()),
        BlocProvider(
            create: (BuildContext context) => AdminNewsCubit()
              ..getAdminNewsType()
              ..getNews()),
        BlocProvider(
            create: (BuildContext context) => BranchCubit()..getBranches()),
        BlocProvider(
            create: (BuildContext context) => SectionCubit()..getSections()),
        BlocProvider(
            create: (BuildContext context) =>
                UserComplainForAdminCubit()..userComplainForAdmin()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, Object? state) {
          return ChangeNotifierProvider(
            create: (context) => MapProvider(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: (prefs.getBool('isDark') == true)
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const SafeArea(child: SplashScreen()),
            ),
          );
        },
      ),
    );
  }
}
