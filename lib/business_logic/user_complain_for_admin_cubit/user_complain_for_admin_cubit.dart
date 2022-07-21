import 'package:bloc/bloc.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/cache_helper.dart';
import '../../constants/network/dio_helper.dart';
import '../../model/admins/get_users_complains_for_admin/get_users_complains_for_admin.dart';

part 'user_complain_for_admin_state.dart';

class UserComplainForAdminCubit extends Cubit<UserComplainForAdminState> {
  UserComplainForAdminCubit() : super(UserComplainForAdminInitial());

  static UserComplainForAdminCubit get(context) => BlocProvider.of(context);

  UsersComplaintsModelForAdmin usersComplaintsModelForAdmin =
      UsersComplaintsModelForAdmin();

  void userComplainForAdmin() async {
    emit(UserComplainForAdminLoadingState());
    String token = await prefs.getString('token').toString();
    DioHelper.getData(
      url: UserComplainForAdmin,
      token: 'Bearer $token',
    ).then((value) {
      usersComplaintsModelForAdmin =
          UsersComplaintsModelForAdmin.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(UserComplainForAdminSuccessState());
    }).catchError((error) {
      emit(UserComplainForAdminErrorState(error.toString()));
      print(error.toString());
    });
  }
}
