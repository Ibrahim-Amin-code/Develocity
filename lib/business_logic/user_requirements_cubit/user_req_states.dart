abstract class UserRequirementsStates {}

class UserRequirementsInitialState extends UserRequirementsStates {}

class UserRequirementsSuccessState extends UserRequirementsStates {}

class UserRequirementsLoadingState extends UserRequirementsStates {}

class UserRequirementsErrorsState extends UserRequirementsStates {
  String error;
  UserRequirementsErrorsState(this.error);
}


