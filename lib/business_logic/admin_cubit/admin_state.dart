part of 'admin_cubit.dart';

@immutable
abstract class AdminState {}

class AdminInitial extends AdminState {}

class AddAdminLoadingState extends AdminState {}

class AddAdminSuccessState extends AdminState {}

class AddAdminErrorState extends AdminState {
  final String error;
  AddAdminErrorState(this.error);
}

/////////////////////////////////////////////////////////////////

class UpdateAdminLoadingState extends AdminState {}

class UpdateAdminSuccessState extends AdminState {}

class UpdateAdminErrorState extends AdminState {
  final String error;

  UpdateAdminErrorState(this.error);
}

////////////////////////////////////////////////////////////////

class DeleteAdminLoadingState extends AdminState {}

class DeleteAdminSuccessState extends AdminState {}

class DeleteAdminErrorState extends AdminState {
  final String error;

  DeleteAdminErrorState(this.error);
}

/////////////////////////////////////////////////////////////////////

class GetAdminLoadingState extends AdminState {}

class GetAdminSuccessState extends AdminState {}

class GetAdminErrorState extends AdminState {
  final String error;

  GetAdminErrorState(this.error);
}

////////////////////////////////////////////////////////////////////