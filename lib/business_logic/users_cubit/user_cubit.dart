import 'package:develocity/business_logic/users_cubit/user_state.dart';
import 'package:develocity/presentation/users/screens/compliants_user/user_complaints_screen.dart';
import 'package:develocity/presentation/users/screens/home_layout/user_fab_buttom.dart';
import 'package:develocity/presentation/users/screens/home_user/user_home_screen.dart';
import 'package:develocity/presentation/users/screens/rate_user/user_rate_screen.dart';
import 'package:develocity/presentation/users/screens/requirements_user/user_requirements_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;
  List<UserFABBottomAppBarItem> bottomNavItems = [
    UserFABBottomAppBarItem(iconData: "assets/images/home11.png", text: 'Home'),
    UserFABBottomAppBarItem(iconData: "assets/images/rates.png", text: 'Rate'),
    UserFABBottomAppBarItem(
        iconData: "assets/images/comp.png", text: 'Complaints'),
    UserFABBottomAppBarItem(
        iconData: "assets/images/requ.png", text: 'Requirements'),
  ];

  List<Widget> screens = [
    const UserHomeScreen(),
    const UserRateScreen(),
    UserComplaintsScreen(),
    const UserRequirementsScreen(),
  ];

  List<String> appBarTitle = [
    'Dashboard',
    'Rate',
    'Complaints',
    'Requirements'
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(UserBottomNavState());
  }

  bool userRecentlyRate = false;

  void changeUserRecentlyRate() {
    userRecentlyRate = !userRecentlyRate;
    emit(UserRateRecentlyState());
  }
}
