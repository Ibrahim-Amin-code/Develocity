// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/network/dio_helper.dart';
import 'package:develocity/model/admins/get_admin_users/get_admin_users.dart';
import 'package:develocity/model/admins/get_tasks_admin_user/get_tasks_admin_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/core/const.dart';
import '../../constants/network/cache_helper.dart';
import '../../constants/network/network_services.dart';
part 'admin_task_state.dart';

class TaskAdminUserCubit extends Cubit<TaskAdminUserState> {
  TaskAdminUserCubit() : super(TaskInitial());

  static TaskAdminUserCubit get(context) => BlocProvider.of(context);

  void addTask({
    required String title,
    required String img,
    required String branchId,
    required List<int> sectionId,
    required List<int> userIds,
    required String desc,
    required String startDate,
    required String endDate,
  }) async {
    emit(AddTaskLoadingState());
    final String token = prefs.getString('token').toString();

    // List<Map<String, int>> selectedUsers = [];
    // List<Map<String, int>> selectedSections = [];

    // for (int element in userIds) {
    //   selectedUsers.add({"user_ids": element});
    // }

    // for (int element in sectionId) {
    //   selectedSections.add({"section_ids": element});
    // }
    // print(selectedSections);
    // List<int> section_ids = [13, 14];
    // List<int> section_ids = [13, 14];

    // var section_ids = [13, 14];
    // var users_ids = [18, 16];

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
        "section_ids[]": sectionIds,
        "user_ids[]": usersIds,
      });

      print('section_ids');
      print(sectionIds);
      // print(formData.fields);
      print('users_ids');
      print(usersIds);

      Response response = await Dio().post(BaseUrl + AddTask,
          data: formData,
          options: Options(
            headers: headers, followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        print('response.data');
        print(response.data);

        print(response.statusCode);
        print('response.data');

        emit(AddTaskSuccessState());
      } else {
        print(response.data);

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

///////////////////////////////////////////////////////////////////////////////////////////
class CustomDropDownUsers extends StatefulWidget {
  static var chosenValue;
  const CustomDropDownUsers(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor,
      this.onSave,
      this.borderColor,
      this.validator})
      : super(key: key);
  final List? items;
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CustomDropDownUsersState createState() => _CustomDropDownUsersState();
}

class _CustomDropDownUsersState extends State<CustomDropDownUsers> {
  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Theme.of(context).cardColor),
        color: widget.fillColor,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonFormField(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: MyColors.mainColor,
          size: 28,
        ),
        iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: CustomDropDownUsers.chosenValue,
        items: widget.items?.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value.toString(),
              style: headingStyle.copyWith(
                  color: Color(0xffC4C4C4),
                  fontFamily: 'SF Pro Display',
                  fontSize: 14),
            ),
          );
        }).toList(),
        hint: Text(
          widget.text,
          style: headingStyle.copyWith(
              color: Color(0xffC4C4C4),
              fontFamily: 'SF Pro Display',
              fontSize: 14),
        ),
        onChanged: (dynamic value) {
          setState(() {
            CustomDropDownUsers.chosenValue = value;
            usersIds.add(value.id);
            print(CustomDropDownUsers.chosenValue.id.toString());
            prefs.setString(
                'userId', CustomDropDownUsers.chosenValue.id.toString());
          });
          // _chosenValue = value;.id
        },
        // onSaved: widget.onSave,
        // validator: widget.validator,
      ),
    );
  }
}
