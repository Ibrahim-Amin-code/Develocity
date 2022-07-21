import 'package:develocity/business_logic/complaint_cubit/complaint_state.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/constants/network/network_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsCubit extends Cubit<ComplaintsStates> {
  ComplaintsCubit() : super(ComplaintsInitialState());

  void addCompliant() {
    emit(ComplaintsAddLoadingState());
  /*  DioHelper.postData(url: AddComplaint, data: {
      'title': ,
      'message': ,
      'type': ,
      'task_id': ,
    });*/
  }
}
