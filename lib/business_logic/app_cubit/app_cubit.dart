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
}
