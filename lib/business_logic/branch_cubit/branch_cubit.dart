import 'package:bloc/bloc.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:develocity/model/admins/get_branch/get_branch_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/dio_helper.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());

  static BranchCubit get(context) => BlocProvider.of(context);

  GetBranchModel branchModel = GetBranchModel();

  void getBranches() async {
    emit(GetBranchLoadingState());
    String token = await prefs.getString('token').toString();
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
}
