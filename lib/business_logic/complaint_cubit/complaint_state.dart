abstract class ComplaintsStates {}

class ComplaintsInitialState extends ComplaintsStates {}

class ComplaintsAddSuccessState extends ComplaintsStates {}

class ComplaintsAddLoadingState extends ComplaintsStates {}

class ComplaintsAddErrorsState extends ComplaintsStates {
  String error;
  ComplaintsAddErrorsState(this.error);
}


