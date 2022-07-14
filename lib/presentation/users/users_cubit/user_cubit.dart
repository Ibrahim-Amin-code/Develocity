import 'package:develocity/presentation/users/screens/compliants_user/user_complaints_screen.dart';
import 'package:develocity/presentation/users/screens/home_user/user_home_screen.dart';
import 'package:develocity/presentation/users/screens/rate_user/user_rate_screen.dart';
import 'package:develocity/presentation/users/screens/requirements_user/user_requirements_screen.dart';
import 'package:develocity/presentation/users/users_cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;
  List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      icon:  Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon:  Icon(Icons.stars),
      label: 'Rate',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.markunread_mailbox),
      label: 'Complaints',
    ),
    const BottomNavigationBarItem(
      icon:  Icon(Icons.error),
      label: 'Requirements',
    ),
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
}
