// ignore_for_file: avoid_print

import 'package:develocity/constants/core/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/cache_helper.dart';
import '../../constants/network/dio_helper.dart';
import '../../constants/network/network_services.dart';
import '../../model/admins/get_all_admins/get_all_admins.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  static AdminCubit get(context) => BlocProvider.of(context);

  void addAdmin({
    required String name,
    required String email,
    required String password,
    required String jobTitle,
    required String img,
  }) async {
    emit(AddAdminLoadingState());
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
      });

      Response response = await Dio().post(BaseUrl + AddAdmin,
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(AddAdminSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(AddAdminErrorState(error.toString()));
    }
  }

  GetAllAdminsModel getAllAdminsModel = GetAllAdminsModel();
  void getAllAdmins() {
    emit(GetAdminLoadingState());
    final String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: GetAdmin,
      token: 'Bearer $token',
    ).then((value) {
      getAllAdminsModel = GetAllAdminsModel.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(GetAdminSuccessState());
    }).catchError((error) {
      emit(GetAdminErrorState(error.toString()));
      print(error.toString());
    });
  }

  void updateAdmin({
    required String name,
    required String email,
    required String password,
    required String jobTitle,
    required String img,
    required String id,
  }) async {
    emit(UpdateAdminLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
        "Accept-Language": "en"
      };
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(img),
        "name": name,
        "email": email,
        "password": password,
        "job_title": jobTitle,
      });

      Response response = await Dio().post(BaseUrl + 'admins/update/$id',
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 201) {
        print(response.data);
        emit(UpdateAdminSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(UpdateAdminErrorState(error.toString()));
    }
  }

  void deleteAdmin({required context, required String id}) async {
    emit(DeleteAdminLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      Response response = await Dio().post(BaseUrl + 'admins/delete/$id',
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        print('deleeeeeeeeeeeeeeeeeeeeet');
        snackBar(
            message: response.data['message'].toString(), context: context);
        emit(DeleteAdminSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(DeleteAdminErrorState(error.toString()));
    }
  }
}
