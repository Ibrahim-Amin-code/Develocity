// ignore_for_file: use_key_in_widget_constructors

import 'package:develocity/business_logic/users_cubit/user_cubit.dart';
import 'package:develocity/business_logic/users_cubit/user_state.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/notification/notification_screen.dart';
import 'package:develocity/presentation/admins/widgets/drawer_widget.dart';
import 'package:develocity/presentation/users/screens/home_layout/user_fab_buttom.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHomeLayoutScreen extends StatefulWidget {
  @override
  State<UserHomeLayoutScreen> createState() => _UserHomeLayoutScreenState();
}

class _UserHomeLayoutScreenState extends State<UserHomeLayoutScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit.get(context);
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: buildDrawerWidget(context: context),
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              cubit.appBarTitle[cubit.currentIndex],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              cubit.currentIndex == 0
                  ? IconsOnTap(
                      icon: 'assets/images/carbon_notification-new.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: MyColors.mainColor,
                      ),
                    ),
            ],
            leading: cubit.currentIndex == 0
                ? IconsOnTap(
                    icon: 'assets/images/eva_menu-outline.png',
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        cubit.currentIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: MyColors.mainColor,
                    ),
                  ),
          ),
          bottomNavigationBar: UserFABBottomAppBar(
            onTabSelected: (index) {
              setState(() {
                cubit.currentIndex = index;
              });
            },
            items: cubit.bottomNavItems,
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
            centerItemText: '',
            color:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
            selectedColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
