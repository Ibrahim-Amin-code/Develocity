part of 'user_requirments_for_admin_cubit.dart';

@immutable
abstract class UserRequirmentsForAdminState {}

class UserRequirmentsForAdminInitial extends UserRequirmentsForAdminState {}

class UserRequirmentsForAdminLoadingState extends UserRequirmentsForAdminState {
}

class UserRequirmentsForAdminSuccessState extends UserRequirmentsForAdminState {
}

class UserRequirmentsForAdminErrorState extends UserRequirmentsForAdminState {
  final String error;

  UserRequirmentsForAdminErrorState(this.error);
}
