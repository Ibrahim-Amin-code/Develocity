part of 'user_complain_for_admin_cubit.dart';

@immutable
abstract class UserComplainForAdminState {}

class UserComplainForAdminInitial extends UserComplainForAdminState {}

class UserComplainForAdminLoadingState extends UserComplainForAdminState {}

class UserComplainForAdminSuccessState extends UserComplainForAdminState {}

class UserComplainForAdminErrorState extends UserComplainForAdminState {
  final String error;

  UserComplainForAdminErrorState(this.error);
}
