// ignore_for_file: unused_field, unused_local_variable, avoid_print, body_might_complete_normally_nullable

import 'package:develocity/business_logic/user_requirements_cubit/user_req_cubit.dart';
import 'package:develocity/business_logic/user_requirements_cubit/user_req_states.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserRequirementsScreen extends StatefulWidget {
  const UserRequirementsScreen({Key? key}) : super(key: key);

  @override
  State<UserRequirementsScreen> createState() => _UserRequirementsScreenState();
}

class _UserRequirementsScreenState extends State<UserRequirementsScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _adminController = TextEditingController();
  final TextEditingController _taskIdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _selectedDropDown;
  final List _admins = <String>['Ahmed', 'Ibrahim', 'Islam'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<UserRequirementsCubit, UserRequirementsStates>(
      listener: (context, state) {
        if (state is UserRequirementsSuccessState &&
            UserRequirementsCubit.get(context).status == 200) {
          snackBar(
              message: 'Requirement send successfully',
              context: context,
              color: MyColors.mainColor);
          _userNameController.text = '';
          _costController.text = '';
          _adminController.text = '';
          _taskIdController.text = '';
        } else if (state is UserRequirementsErrorsState) {
          snackBar(
              message: 'Something went wrong, try again!', context: context);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(_userNameController, TextInputType.text,
                      (String value) {
                    if (value.isEmpty) {
                      return 'Enter user name, please.';
                    }
                  }, 'User Name *', 'Enter name', 1),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(_costController, TextInputType.number,
                      (String value) {
                    if (value.isEmpty) {
                      return 'Enter cost, please.';
                    }
                  }, 'Cost *', 'Enter cost', 1),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Admin *',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 14.0),
                    ),
                  ),
                  DropdownButtonFormField2(
                    
                    validator: (value) {
                      if (value == null) {
                        return 'Please select an admin';
                      }
                    },
                    onChanged: (String? value) {
                      if (value == 'Ahmed') {
                        _adminController.text = '4';
                      } else if (value == 'Ibrahim') {
                        _adminController.text = '4';
                      } else {
                        _adminController.text = '4';
                      }
                    },
                    hint: Text(
                      'Select Admin',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        color: MyColors.hintColor,
                      ),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: MyColors.mainColor,
                    ),
                    iconSize: 30,
                    buttonHeight: 65,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.hintColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.mainColor,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.mainColor,
                          width: 2.0,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                    ),
                    isExpanded: true,
                    items: _admins.map<DropdownMenuItem<String>>((item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(_taskIdController, TextInputType.text,
                      (String value) {
                    if (value.isEmpty) {
                      return 'type requirements which you need';
                    }
                  }, 'Task *', 'type requirements which you need', 9),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  state is UserRequirementsLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(_userNameController.text);
                              print(_costController.text);
                              print(_adminController.text);
                              print(_taskIdController.text);
                              UserRequirementsCubit.get(context)
                                  .addRequirements(
                                      name: _userNameController.text,
                                      price: _costController.text,
                                      adminId: _adminController.text,
                                      taskId: _taskIdController.text);
                            }
                          },
                          text: 'Send',
                        ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
