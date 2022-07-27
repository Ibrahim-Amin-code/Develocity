part of 'admin_profile_cubit.dart';

@immutable
abstract class AdminProfileState {}

class AdminProfileInitial extends AdminProfileState {}

class AdminProfileEditingState extends AdminProfileState {}

class GetAdminProfileLoadingState extends AdminProfileState {}

class GetAdminProfileSuccessState extends AdminProfileState {}

class GetAdminProfileErrorState extends AdminProfileState {
  final String error;

  GetAdminProfileErrorState(this.error);
}
