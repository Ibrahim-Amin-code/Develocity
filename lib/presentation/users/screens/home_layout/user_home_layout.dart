import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/users/users_cubit/user_cubit.dart';
import 'package:develocity/presentation/users/users_cubit/user_state.dart';
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
                  ? InkWell(
                onTap: (){},
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.1,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        image: const DecorationImage(
                            image: AssetImage('assets/images/carbon_notification-new.png')
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
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
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: MyColors.mainColor,
                    ),
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomNavItems,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
