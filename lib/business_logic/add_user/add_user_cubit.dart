import 'package:bloc/bloc.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/cache_helper.dart';
import '../../constants/network/network_services.dart';
import '../../model/get_admin_users/get_admin_users.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserInitial());

  static AddUserCubit get(context) => BlocProvider.of(context);

  void addUser({
    required String name,
    required String email,
    required String password,
    required String jobTitle,
    required String img,
    required String description,
    required String kpis,
    required String branchId,
    required String sectionId,
  }) async {
    emit(AddUserLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(img),
        "name": name,
        "password": password,
        "job_title": jobTitle,
        "email": email,
        "job_desc": description,
        "kpis": kpis,
        "branch_id": branchId,
        "section_id": sectionId,
      });

      Response response = await Dio().post(BaseUrl + AddUser,
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(AddUserSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(AddUserErrorState(error.toString()));
    }
  }
//////////////////////////////////////////////////////////////////////

  GetAdminUsersModel getAdminUserModel = GetAdminUsersModel();
  void getAdminUser() {
    emit(GetAdminUserLoadingState());
    final String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: GetUser,
      token: 'Bearer $token',
    ).then((value) {
      getAdminUserModel = GetAdminUsersModel.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(GetAdminUserSuccessState());
    }).catchError((error) {
      emit(GetAdminUserErrorState(error.toString()));
      print(error.toString());
    });
  }

  void deleteUser(String id) async {
    emit(DeleteAdminUserLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      Response response = await Dio().post(BaseUrl + 'users/delete/$id',
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        print('deleeeeeeeeeeeeeeeeeeeeet');
        emit(DeleteAdminUserSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(DeleteAdminUserErrorState(error.toString()));
    }
  }
}
