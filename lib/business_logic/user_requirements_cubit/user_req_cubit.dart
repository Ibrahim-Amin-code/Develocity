import 'package:develocity/business_logic/user_requirements_cubit/user_req_states.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRequirementsCubit extends Cubit<UserRequirementsStates> {
  UserRequirementsCubit() : super(UserRequirementsInitialState());

  static UserRequirementsCubit get(context) => BlocProvider.of(context);

  int? status;

  void addRequirements({
  required String name,
  required String price,
  required String adminId,
  required String taskId,
}) async {
    emit(UserRequirementsLoadingState());
    String token = await prefs.getString('token').toString();
    DioHelper.postData(url: addRequirement, data: {
      'name':name,
      'price':price,
      'task_id':taskId,
      'admin_id':adminId,
    },
    token: 'Bearer $token').then((value){
      print(value.data);
      status= value.data['status'];
      emit(UserRequirementsSuccessState());
    }).catchError((error){
      emit(UserRequirementsErrorsState(error.toString()));
      print(error.toString());
    });
  }
}
