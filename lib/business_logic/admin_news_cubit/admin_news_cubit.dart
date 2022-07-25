// ignore_for_file: avoid_print

import 'package:develocity/constants/network/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/cache_helper.dart';
import '../../constants/network/network_services.dart';
import '../../model/admins/get_admin_news/get_admin_news_type.dart';
import '../../model/admins/get_admin_news/get_news.dart';

part 'admin_news_state.dart';

class AdminNewsCubit extends Cubit<AdminNewsState> {
  AdminNewsCubit() : super(AdminNewsInitial());

  static AdminNewsCubit get(context) => BlocProvider.of(context);

  void addNewsType({
    required String title,
  }) {
    emit(AddAdminNewsTypeLoadingState());
    final String token = prefs.getString('token').toString();

    DioHelper.postData(
      url: AddAdminNewsType,
      token: 'Bearer $token',
      data: {
        "title": title,
      },
    ).then((value) {
      print(value.data);
      emit(AddAdminNewsTypeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddAdminNewsTypeErrorState(error.toString()));
    });
  }

  ///////////////////////////////////////////////////////////////////////////

  GetAdminNewsTypeModel getAdminNewsTypeModel = GetAdminNewsTypeModel();

  void getAdminNewsType() {
    emit(GetAdminNewsTypeLoadingState());
    final String token = prefs.getString('token').toString();

    DioHelper.getData(
      url: GetAdminNewsType,
      token: 'Bearer $token',
    ).then((value) {
      getAdminNewsTypeModel = GetAdminNewsTypeModel.fromJson(value.data);
      print(value.data);
      emit(GetAdminNewsTypeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAdminNewsTypeErrorState(error.toString()));
    });
  }

  ///////////////////////////////////////////////////////////////////////////

  void updateAdminNewsType({
    required String id,
  }) async {
    emit(UpdateAdminNewsTypeLoadingState());

    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      // FormData formData = FormData.fromMap({
      //   "name": name,
      //   "branch_id": branchId,
      // });

      Response response = await Dio().post(BaseUrl + 'news-type/update/$id',
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(UpdateAdminNewsTypeSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(UpdateAdminNewsTypeErrorState(error.toString()));
    }
  }

  ///////////////////////////////////////////////////////////////////////////

  void deleteAdminNewsType(String id) async {
    emit(DeleteAdminNewsTypeLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      Response response = await Dio().post(BaseUrl + 'news-type/delete/$id',
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        print('deleeeeeeeeeeeeeeeeeeeeet');
        emit(DeleteAdminNewsTypeSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(DeleteAdminNewsTypeErrorState(error.toString()));
    }
  }
/////////////////////////////////////////////////////////////////////////////

  void addNews({
    required String title,
    required String img,
    required String desc,
    required String branchId,
    required String typeId,
  }) async {
    emit(AddNewsLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(img),
        "title": title,
        "desc": desc,
        "branch_id": branchId,
        "type_id": typeId,
      });

      Response response = await Dio().post(BaseUrl + AddNews,
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(AddNewsSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(AddNewsErrorState(error.toString()));
    }
  }

////////////////////////////////////////////////////////////

  GetAdminNewsModel getAdminNewsModel = GetAdminNewsModel();
  void getNews() {
    emit(GetNewsLoadingState());
    final String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: GetNews,
      token: 'Bearer $token',
    ).then((value) {
      getAdminNewsModel = GetAdminNewsModel.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(GetNewsSuccessState());
    }).catchError((error) {
      emit(GetNewsErrorState(error.toString()));
      print(error.toString());
    });
  }

/////////////////////////////////////////////////////////////

  void updateNews({
    required String title,
    required String desc,
    required String branchId,
    required String typeId,
    required String img,
    required String id,
  }) async {
    emit(UpdateNewsLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(img),
        "desc": desc,
        "title": title,
        "branch_id": branchId,
        "type_id": typeId,
      });

      Response response = await Dio().post(BaseUrl + 'news/update/$id',
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(UpdateNewsSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(UpdateNewsErrorState(error.toString()));
    }
  }

///////////////////////////////////////////////////////////////////////////

  void deleteNews({required String id}) async {
    emit(DeleteNewsLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      Response response = await Dio().post(BaseUrl + 'news/delete/$id',
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        print('deleeeeeeeeeeeeeeeeeeeeet');
        emit(DeleteNewsSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(DeleteNewsErrorState(error.toString()));
    }
  }
}
