import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/users/screens/home_layout/user_fab_buttom.dart';
import 'package:develocity/presentation/users/users_cubit/user_cubit.dart';
import 'package:develocity/presentation/users/users_cubit/user_state.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHomeLayoutScreen extends StatefulWidget {
  @override
  State<UserHomeLayoutScreen> createState() => _UserHomeLayoutScreenState();
}

class _UserHomeLayoutScreenState extends State<UserHomeLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var cubit = UserCubit.get(context);
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
                      onTap: () {},
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
                    onTap: () {},
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
            backgroundColor: Colors.white,
            centerItemText: '',
            color: const Color(0xff80535763),
            selectedColor: MyColors.mainColor,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
