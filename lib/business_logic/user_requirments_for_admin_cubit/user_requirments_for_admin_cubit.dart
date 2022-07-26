// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:develocity/model/admins/get_users_requirments_for_admin/get_users_requir_model_for_admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/cache_helper.dart';
import '../../constants/network/dio_helper.dart';
import '../../model/admins/get_users_complains_for_admin/get_users_complains_for_admin.dart';

part 'user_requirments_for_admin_state.dart';

class UserRequirmentsForAdminCubit extends Cubit<UserRequirmentsForAdminState> {
  UserRequirmentsForAdminCubit() : super(UserRequirmentsForAdminInitial());

  static UserRequirmentsForAdminCubit get(context) => BlocProvider.of(context);

  UsersRequirementsModelForAdmin usersRequirementsModelForAdmin =
      UsersRequirementsModelForAdmin();

  void userRequirementsForAdmin() {
    emit(UserRequirmentsForAdminLoadingState());
    final String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: UserequirementsForAdmin,
      token: 'Bearer $token',
    ).then((value) {
      usersRequirementsModelForAdmin =
          UsersRequirementsModelForAdmin.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(UserRequirmentsForAdminSuccessState());
    }).catchError((error) {
      emit(UserRequirmentsForAdminErrorState(error.toString()));
      print(error.toString());
    });
  }
}
