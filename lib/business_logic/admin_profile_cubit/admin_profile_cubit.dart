import 'package:develocity/constants/network/network_services.dart';
import 'package:develocity/model/admins/get_admin_profile/get_admin_profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/cache_helper.dart';
import '../../constants/network/dio_helper.dart';
part 'admin_profile_state.dart';

class AdminProfileCubit extends Cubit<AdminProfileState> {
  AdminProfileCubit() : super(AdminProfileInitial());

  static AdminProfileCubit get(context) => BlocProvider.of(context);
  bool adminProfileEditing = false;

  void profileEdit() {
    adminProfileEditing = !adminProfileEditing;
    emit(AdminProfileEditingState());
  }

  GetAdminProfileModel getAdminProfileModel = GetAdminProfileModel();

  void getAdminProfile() {
    emit(GetAdminProfileLoadingState());
    final String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: GetAdminProfile,
      token: 'Bearer $token',
    ).then((value) {
      getAdminProfileModel = GetAdminProfileModel.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(GetAdminProfileSuccessState());
    }).catchError((error) {
      emit(GetAdminProfileErrorState(error.toString()));
      print(error.toString());
    });
  }
}
