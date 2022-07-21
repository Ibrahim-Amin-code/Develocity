import 'package:develocity/business_logic/complaint_cubit/complaint_state.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsCubit extends Cubit<ComplaintsStates> {
  ComplaintsCubit() : super(ComplaintsInitialState());

  static ComplaintsCubit get(context) => BlocProvider.of(context);

  void addCompliant(
      {required String title,
      required String message,
      required String type,
      required String taskId}) {
    emit(ComplaintsAddLoadingState());
    DioHelper.postData(url: addComplaint, data: {
      'title': title,
      'message': message,
      'type': type,
      'task_id': taskId,
    }).then((value) {
      print(value.data);
      emit(ComplaintsAddSuccessState());
    }).catchError((error) {
      emit(ComplaintsAddErrorsState(error.toString()));
      print(error.toString());
    });
  }
}
