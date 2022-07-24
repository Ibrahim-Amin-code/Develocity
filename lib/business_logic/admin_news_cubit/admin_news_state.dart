part of 'admin_news_cubit.dart';

@immutable
abstract class AdminNewsState {}

class AdminNewsInitial extends AdminNewsState {}

class AddAdminNewsTypeLoadingState extends AdminNewsState {}

class AddAdminNewsTypeSuccessState extends AdminNewsState {}

class AddAdminNewsTypeErrorState extends AdminNewsState {
  final String error;

  AddAdminNewsTypeErrorState(this.error);
}
///////////////////////////////////////////////////////////////

class GetAdminNewsTypeLoadingState extends AdminNewsState {}

class GetAdminNewsTypeSuccessState extends AdminNewsState {}

class GetAdminNewsTypeErrorState extends AdminNewsState {
  final String error;

  GetAdminNewsTypeErrorState(this.error);
}

///////////////////////////////////////////////////////////////
class UpdateAdminNewsTypeLoadingState extends AdminNewsState {}

class UpdateAdminNewsTypeSuccessState extends AdminNewsState {}

class UpdateAdminNewsTypeErrorState extends AdminNewsState {
  final String error;

  UpdateAdminNewsTypeErrorState(this.error);
}

///////////////////////////////////////////////////////////////
class DeleteAdminNewsTypeLoadingState extends AdminNewsState {}

class DeleteAdminNewsTypeSuccessState extends AdminNewsState {}

class DeleteAdminNewsTypeErrorState extends AdminNewsState {
  final String error;

  DeleteAdminNewsTypeErrorState(this.error);
}
///////////////////////////////////////////////////////////////

class AddNewsLoadingState extends AdminNewsState {}

class AddNewsSuccessState extends AdminNewsState {}

class AddNewsErrorState extends AdminNewsState {
  final String error;

  AddNewsErrorState(this.error);
}
///////////////////////////////////////////////////////////////

class GetNewsLoadingState extends AdminNewsState {}

class GetNewsSuccessState extends AdminNewsState {}

class GetNewsErrorState extends AdminNewsState {
  final String error;

  GetNewsErrorState(this.error);
}

///////////////////////////////////////////////////////////////
class UpdateNewsLoadingState extends AdminNewsState {}

class UpdateNewsSuccessState extends AdminNewsState {}

class UpdateNewsErrorState extends AdminNewsState {
  final String error;

  UpdateNewsErrorState(this.error);
}

///////////////////////////////////////////////////////////////
class DeleteNewsLoadingState extends AdminNewsState {}

class DeleteNewsSuccessState extends AdminNewsState {}

class DeleteNewsErrorState extends AdminNewsState {
  final String error;

  DeleteNewsErrorState(this.error);
}
///////////////////////////////////////////////////////////////