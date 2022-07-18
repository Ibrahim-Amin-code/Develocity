import 'package:develocity/constants/core/const.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

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
