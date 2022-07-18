import 'package:bloc/bloc.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/model/users/user_login_model.dart';
import 'package:develocity/presentation/admins/screens/authentication/loign/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  int? statusCode;
  Future userLogin(String email, String password) async {
    DioHelper.postData(url: 'user/login', data: {
      'email' : email,
      'password': password,
    }).then((value){
      UserLoginModel userLoginModel = UserLoginModel.fromJson(value.data);
      statusCode = userLoginModel.status;
      print('the status is : $statusCode');

      emit(LoginUserSuccessState());
    }).catchError((error){
      LoginUserErrorState(error.toString());
      print(error.toString());
    });
  }
}
