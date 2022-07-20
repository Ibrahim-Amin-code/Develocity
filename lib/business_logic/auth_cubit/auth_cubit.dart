// ignore_for_file: avoid_print

import 'package:develocity/constants/core/const.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../../constants/network/cache_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  ///admin/logout
  String msgAdmin = '';

  void adminLogin(
      {required String email, required String password, required context}) {
    emit(AdminLoginLoadingState());
    DioHelper.postData(url: AdminLogin, data: {
      'email': email,
      'password': password,
    }).then((value) {
      prefs.setString('token', value.data['data']['token']);
      prefs.setBool('isLogin', true);

      prefs.setString('user_type', "admin");

      print(value.data);
      print(value.data['data']['token']);
      msgAdmin = value.data['message'];
      print(value.data);
      emit(AdminLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      snackBar(message: 'Invalid Email Or Password', context: context);
      emit(AdminLoginErrorState(error.toString()));
    });
  }
  //////////////////////////////////////////////////// /admin/logout

  void out() async {
    emit(AdminLogoutLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      Response response = await Dio()
          .post(BaseUrl + 'admin/logout', options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(AdminLogoutSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(AdminLogoutErrorState(error.toString()));
    }
  }
//////////////////////////////////////////////

  String msgUser = '';
  void userLogin(
      {required String email, required String password, required context}) {
    emit(UserLoginLoadingState());
    DioHelper.postData(url: UserLogin, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      prefs.setBool('isLogin', true);
      prefs.setString('token', value.data['data']['token']);
      prefs.setString('user_type', "user");

      print(value.data['data']['token']);
      emit(UserLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      snackBar(message: 'Invalid Email Or Password', context: context);
      emit(UserLoginErrorState(error.toString()));
    });
  }
}
