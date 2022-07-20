// ignore_for_file: await_only_futures, avoid_print

import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/model/admins/get_section/get_section_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/dio_helper.dart';
import '../../constants/network/network_services.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());

  static SectionCubit get(context) => BlocProvider.of(context);

  GetSectionModel sectionModel = GetSectionModel();

  void getSections() async {
    emit(GetSectionLoadingState());
    String token = await prefs.getString('token').toString();
    DioHelper.getData(
      url: GetSections,
      token: 'Bearer $token',
    ).then((value) {
      sectionModel = GetSectionModel.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(GetSectionSuccessState());
    }).catchError((error) {
      emit(GetSectionErrorState(error.toString()));
      print(error.toString());
    });
  }

/////////////////////////////////////////////////
  void addSection({
    required String name,
    required String branchId,
  }) async {
    emit(AddSectionLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      FormData formData = FormData.fromMap({
        "name": name,
        "branch_id": branchId,
      });

      Response response = await Dio().post(BaseUrl + CreateSections,
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(AddSectionSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(AddSectionErrorState(error.toString()));
    }
  }

  ////////////////////////////////////////////////////

  void updateSection({
    required String name,
    required String branchId,
    required String id,
  }) async {
    emit(UpdateSectionLoadingState());
    //sections/update/21
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      FormData formData = FormData.fromMap({
        "name": name,
        "branch_id": branchId,
      });

      Response response = await Dio().post(BaseUrl + 'sections/update/$id',
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(UpdateSectionSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(UpdateSectionErrorState(error.toString()));
    }
  }

// ////////////////////////////////////////////////////
  void deleteSection(String id) async {
    emit(DeleteSectionLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      Response response = await Dio().post(BaseUrl + 'sections/delete/$id',
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        print('deleeeeeeeeeeeeeeeeeeeeet');
        emit(DeleteSectionSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(DeleteSectionErrorState(error.toString()));
    }
  }
}
//JVIk62HbQwV32fNE9Tn3ounCr5g3iYrrdKb7DyBK