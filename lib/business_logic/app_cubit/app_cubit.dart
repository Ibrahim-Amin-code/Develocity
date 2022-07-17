import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isUser = false;
  bool isAdmin = false;

  void userOrAdmin({
    required bool isUserClicked,
    required bool isAdminClicked,
  }) {
    isAdmin = isAdminClicked;
    isUser = isUserClicked;
    emit(UserOrAdminState());
  }

  bool isIndividualTask = false;
  bool isTeamTask = false;

  void individualOrTeamTask({
    required bool isIndividualClicked,
    required bool isTeamTaskClicked,
  }) {
    isIndividualTask = isIndividualClicked;
    isTeamTask = isTeamTaskClicked;
    emit(IndividualOrTeamTask());
  }

  int? selectRadio = 0;
  void changeRadio(int? select) {
    selectRadio == select;
    emit(ChangeRadioState());
  }

  String color = '';
  void changeColor(String type) {
    color = type;
    emit(ChangeColorState());
  }

  bool isRecentlyAdmins = false;
  bool isAllAdmins = true;

  void recentlyAdmins({
    required bool admminAdded,
    required bool alladmmins,
  }) {
    isRecentlyAdmins = admminAdded;
    isAllAdmins = alladmmins;
    emit(ChangeRecentlyAdminsState());
  }
}
