import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/model/admins/get_tasks_admin_user/get_tasks_admin_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/network/cache_helper.dart';
import '../../constants/network/network_services.dart';

part 'task_state.dart';

class TaskAdmiUserCubit extends Cubit<TaskAdminUserState> {
  TaskAdmiUserCubit() : super(TaskInitial());

  static TaskAdmiUserCubit get(context) => BlocProvider.of(context);

  void addTask({
    required String title,
    required String img,
    required String branchId,
    required String sectionId,
    required String userIds,
    required String desc,
    required String startDate,
    required String endDate,
  }) async {
    emit(AddTaskLoadingState());
    final String token = prefs.getString('token').toString();
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(img),
        "title": title,
        "branch_id": branchId,
        "desc": desc,
        "start_date": startDate,
        "end_date": endDate,
        "section_ids": sectionId,
        "user_ids": userIds,
      });

      Response response = await Dio().post(BaseUrl + AddTask,
          data: formData, options: Options(headers: headers));
      if (response.statusCode == 200) {
        print(response.data);
        emit(AddTaskSuccessState());
      } else {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (error) {
      print(error.toString());
      emit(AddTaskErrorState(error.toString()));
    }
  }

  TasksAdminUserModel tasksAdminUserModel = TasksAdminUserModel();
  void getTasksAdminUser() {
    emit(AddTaskLoadingState());
    final String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: GetAdmin,
      token: 'Bearer $token',
    ).then((value) {
      tasksAdminUserModel = TasksAdminUserModel.fromJson(value.data);
      print(value.data);
      print('tokennnnnnnnnnnnnnnn' + token.toString());
      emit(AddTaskSuccessState());
    }).catchError((error) {
      emit(AddTaskErrorState(error.toString()));
      print(error.toString());
    });
  }
}
