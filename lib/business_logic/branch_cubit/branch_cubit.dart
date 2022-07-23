// ignore_for_file: avoid_print

import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:develocity/model/admins/get_branch/get_branch_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/dio_helper.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());

  static BranchCubit get(context) => BlocProvider.of(context);

  GetBranchModel branchModel = GetBranchModel();

  void getBranches() {
    emit(GetBranchLoadingState());
    final String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: GetBranches,
      token: 'Bearer $token',
    ).then((value) {
      branchModel = GetBranchModel.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(GetBranchSuccessState());
    }).catchError((error) {
      emit(GetBranchErrorState(error.toString()));
      print(error.toString());
    });
  }

  void addBranch(
      {required String name,
      required String lat,
      required String lng,
      required String location,
      required String img,
      required context}) async {
    emit(AddBranchLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(img),
        "name": name,
        "lat": lat,
        "lng": lng,
        "location": location,
      });

      Response response = await Dio().post(BaseUrl + CreateBranch,
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(AddBranchSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(AddBranchErrorState(error.toString()));
    }
  }

  ////////////////////////////////////////////////////
  void updateBranch(
      {required String name,
      required String lat,
      required String lng,
      required String location,
      required String img,
      required String id,
      required context}) async {
    emit(UpdateBranchLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(img),
        "name": name,
        "lat": lat,
        "lng": lng,
        "location": location,
      });

      Response response = await Dio().post(BaseUrl + 'branches/update/$id',
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(UpdateBranchSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(UpdateBranchErrorState(error.toString()));
    }
  }

////////////////////////////////////////////////////
  void deleteBranch(String id) async {
    emit(DeleteBranchLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      Response response = await Dio().post(BaseUrl + 'branches/delete/$id',
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        print('deleeeeeeeeeeeeeeeeeeeeet');
        emit(DeleteBranchSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(DeleteBranchErrorState(error.toString()));
    }
  }
}
