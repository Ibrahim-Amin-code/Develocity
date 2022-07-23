part of 'add_user_cubit.dart';

@immutable
abstract class AddUserState {}

class AddUserInitial extends AddUserState {}

//////////////////////////////////////////////////////////
class AddUserLoadingState extends AddUserState {}

class AddUserSuccessState extends AddUserState {}

class AddUserErrorState extends AddUserState {
  final String error;

  AddUserErrorState(this.error);
}

/////////////////////////////////////////////////////////
class DeleteAdminUserLoadingState extends AddUserState {}

class DeleteAdminUserSuccessState extends AddUserState {}

class DeleteAdminUserErrorState extends AddUserState {
  final String error;

  DeleteAdminUserErrorState(this.error);
}

/////////////////////////////////////////////////////////////
class GetAdminUserLoadingState extends AddUserState {}

class GetAdminUserSuccessState extends AddUserState {}

class GetAdminUserErrorState extends AddUserState {
  final String error;

  GetAdminUserErrorState(this.error);
}
