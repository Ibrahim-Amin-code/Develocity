// ignore_for_file: avoid_print

import 'package:develocity/constants/core/const.dart';
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

    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromFile(img),
      "name": name,
      "lng": lng,
      "lat": lat,
      "location": location,
    });
    DioHelper.postDataWithImage(
      url: CreateBranch,
      data: formData,
      token: 'Bearer $token',
    ).then((value) {
      print(value.data);
      emit(AddBranchSuccessState());
    }).catchError((error) {
      print(error.toString());
      snackBar(message: 'Error', context: context);
      emit(AddBranchErrorState(error.toString()));
    });
  }
}
