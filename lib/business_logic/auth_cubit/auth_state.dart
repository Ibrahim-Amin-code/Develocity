part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class UserLoginLoadingState extends AuthState {}

class UserLoginSuccessState extends AuthState {}

class UserLoginStatusCode extends AuthState {
  final String error;

  UserLoginStatusCode(this.error);
}

class UserLoginErrorState extends AuthState {
  final String error;

  UserLoginErrorState(this.error);
}

class AdminLoginLoadingState extends AuthState {}

class AdminLoginSuccessState extends AuthState {}

class AdminLoginErrorState extends AuthState {
  final String error;

  AdminLoginErrorState(this.error);
}

class AdminLogoutLoadingState extends AuthState {}

class AdminLogoutSuccessState extends AuthState {}

class AdminLogoutErrorState extends AuthState {
  final String error;

  AdminLogoutErrorState(this.error);
}
