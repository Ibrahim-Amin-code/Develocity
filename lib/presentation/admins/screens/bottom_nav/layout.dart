// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison, file_names, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/bottom_nav/fab_buttom.dart';
import 'package:flutter/material.dart';
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
    RateScreen(),
    ProfileScreen(),
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

  // @override
  // void initState() {
  //   gatScreen();
  //   UserprofileCubit.get(context).getUserProfile();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // setState(() {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => SubCategoriesScreen(
            //                 catItem: HomeCubit.get(context)
            //                     .homeitemsModel!
            //                     .data!
            //                     .categories!,
            //               )));
            // });
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
          backgroundColor: Colors.white,
          centerItemText: '',
          color: const Color(0xff80535763),
          selectedColor: Color(0xff696CFF),
        ),
        body: screens[currentIndex],
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Are You Sure"),
            content: Text('Exit'),
            actions: [
              // ignore: deprecated_member_use
              RaisedButton(
                color: MyColors.mainColor,
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: MyColors.mainColor,
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('YES'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
