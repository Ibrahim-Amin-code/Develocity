abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginUserSuccessState extends LoginStates {}

class LoginUserLoadingState extends LoginStates {}

class LoginUserErrorState extends LoginStates {
  String error;

  LoginUserErrorState(this.error);
}
