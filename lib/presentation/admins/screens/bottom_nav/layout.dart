// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison, file_names, prefer_const_constructors, use_full_hex_values_for_flutter_colors, unused_import, avoid_print

import 'package:develocity/business_logic/auth_cubit/auth_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/bottom_nav/fab_buttom.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/admins/add_admins_screeen.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/branches/add_branch_screeen.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/sections/add_section_screeen.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/users/add_user_screen.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/network/cache_helper.dart';
import '../admin_profile/admin_profile_screen.dart';
import '../drawer_screens/news/add_admin_news_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../rate/rate_screen.dart';
import '../tasks/tasks_screen.dart';

class LayoutScreen extends StatefulWidget {
  final int index;

  LayoutScreen({Key? key, required this.index}) : super(key: key);
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    TasksScreen(),
    RateAdminScreeen(),
    // ProfileScreen(),
    AdminProfileScreen()
  ];

  gatScreen() {
    if (widget.index != null) {
      setState(() {
        currentIndex = widget.index;
      });
    } else {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  @override
  void initState() {
    gatScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /**assets/images/Vector (1).png',

assets/images/branches.png',
  
assets/images/sections.png',
  
assets/images/admins.png',
     */
            homeBottomSheet(
                context: context,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildListTileBottomSheet(
                          title: 'Add Admin',
                          image: 'assets/images/Vector (1).png',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddAdminsScreeen()));
                          }),
                      buildListTileBottomSheet(
                          title: 'Add branches',
                          image: 'assets/images/branches.png',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddBranchScreeen()));
                          }),
                      buildListTileBottomSheet(
                          title: 'Add Sections',
                          image: 'assets/images/sections.png',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddSectionScreeen()));
                          }),
                      buildListTileBottomSheet(
                          title: 'Add User',
                          image: 'assets/images/admins.png',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddUsersScreeen()));
                          }),
                      buildListTileBottomSheet(
                          title: 'Add Task',
                          image: 'assets/images/tasks.png',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LayoutScreen(
                                          index: 1,
                                        )));
                          }),
                      buildListTileBottomSheet(
                          title: 'Add News',
                          image: 'assets/images/tasks.png',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddNewsScreeen()));
                          }),
                    ],
                  ),
                ));
          },
          backgroundColor: MyColors.mainColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          onTabSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            FABBottomAppBarItem(
                iconData: "assets/images/home11.png", text: 'Home'),
            FABBottomAppBarItem(
                iconData: "assets/images/tasks.png", text: 'Taks'),
            FABBottomAppBarItem(
                iconData: "assets/images/rates.png", text: 'Rate'),
            FABBottomAppBarItem(
                iconData: "assets/images/user11.png", text: 'Profile'),
          ],

          /** backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
            centerItemText: '',
            color:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
            selectedColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
           */
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
          centerItemText: '',
          color:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
          selectedColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
        ),
        body: screens[currentIndex],
      ),
    );
  }

  homeBottomSheet({context, child}) {
    var w = MediaQuery.of(context).size.width;

    return showModalBottomSheet(
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(w * 0.07),
            topLeft: Radius.circular(w * 0.07)),
      ),
      isDismissible: true,
      context: context,
      builder: (context) => child,
    );
  }

  Widget buildListTileBottomSheet({
    required String title,
    required String image,
    required GestureTapCallback? onTap,
  }) =>
      ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 50,
        ),
        leading: Image.asset(
          image,
          color: MyColors.mainColor,
        ),
        title: Text(
          title,
          style: headingStyle.copyWith(
              color: MyColors.mainColor,
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        onTap: onTap,
      );

  Future<bool> showExitPopup() async {
    return await showDialog(
          useSafeArea: true,
          useRootNavigator: true,
          context: context,
          barrierDismissible: true,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                "Logout of Develocity?",
                style: headingStyle.copyWith(
                    color: MyColors.mainColor,
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            content: Text(
              'Remember my login info',
              textAlign: TextAlign.center,
              style: headingStyle.copyWith(
                  color: Color(0xff474747),
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            elevation: 0.0,
            actions: [
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AdminLogoutSuccessState) {
                    prefs.clear();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                        (route) => false);
                  }
                },
                builder: (context, state) {
                  return defaultButton(
                      title: 'Logout',
                      onPressed: () {
                        AuthCubit.get(context).out();
                        print('oooooooooooooooo');
                      },
                      fontSize: 16,
                      height: 40,
                      width: 325,
                      color: MyColors.mainColor,
                      textColor: Colors.white);
                },
              ),
              defaultButton(
                  title: 'cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  fontSize: 14,
                  height: 40,
                  width: 325,
                  color: Colors.transparent,
                  textColor: Colors.black)
            ],
          ),
        ) ??
        false;
  }
}
