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

class AdminLoginStatusCode extends AuthState {
  final String error;

  AdminLoginStatusCode(this.error);
}

class AdminLoginErrorState extends AuthState {
  final String error;

  AdminLoginErrorState(this.error);
}
