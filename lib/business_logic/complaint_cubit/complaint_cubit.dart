import 'package:develocity/business_logic/complaint_cubit/complaint_state.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsCubit extends Cubit<ComplaintsStates> {
  ComplaintsCubit() : super(ComplaintsInitialState());

  static ComplaintsCubit get(context) => BlocProvider.of(context);

  int? status;
  void addCompliant(
      {required String title,
      required String message,
      required String type,
      required String taskId}) async {
    emit(ComplaintsAddLoadingState());
    String token = await prefs.getString('token').toString();
    DioHelper.postData(url: addComplaint, data: {
      'title': title,
      'message': message,
      'type': type,
      'task_id': taskId,
    },
    token: 'Bearer $token').then((value) {
      print(value.data);
      status = value.data['status'];
      emit(ComplaintsAddSuccessState());
    }).catchError((error) {
      emit(ComplaintsAddErrorsState(error.toString()));
      print(error.toString());
    });
  }
}
