// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:develocity/business_logic/complaint_cubit/complaint_cubit.dart';
import 'package:develocity/business_logic/complaint_cubit/complaint_state.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserComplaintsScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _taskIdController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List _type = <String>['general', 'task'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<ComplaintsCubit, ComplaintsStates>(
      listener: (context, state) {
        if (state is ComplaintsAddSuccessState) {
          snackBar(
              message: 'Complaint send successfully',
              context: context,
              color: MyColors.mainColor);
          _titleController.text = '';
          _messageController.text = '';
          _taskIdController.text = '';
        } else if (state is ComplaintsAddErrorsState) {
          snackBar(
              message: 'Something went wrong, try again!', context: context);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.38,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Align(
                          child: Container(
                            height: height * 0.3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: MyColors.hintColor),
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'We are very sorry',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  'for your bad experience please , spend some \n of your valuable time to write what happened \n so we can take our steps \n as soon as possible',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          // color: MyColors.unselectedIconColor,
                                          ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                              ],
                            ),
                          ),
                          alignment: AlignmentDirectional.bottomCenter,
                        ),
                        SvgPicture.asset(
                          'assets/images/complaints.svg',
                          width: width * 0.4,
                          height: height * 0.2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Column(
                    children: [
                      CustomTextFormField(_titleController, TextInputType.text,
                          (String value) {
                        if (value.isEmpty) {
                          return 'Enter title, Please.';
                        }
                      }, 'Title *', 'Type title ..', 1),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      DropdownButtonFormField2(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select type';
                          }
                        },
                        onChanged: (String? value) {
                          _typeController.text = value!;
                        },
                        hint: Text(
                          'Select Type *',
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
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
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
                        items: _type.map<DropdownMenuItem<String>>((item) {
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
                          return 'Enter Task ID, Please.';
                        }
                      }, 'Task ID', 'Type task ID ..', 1),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextFormField(
                        _messageController,
                        TextInputType.text,
                        (String value) {
                          if (value.isEmpty) {
                            return 'Enter your complaints, Please.';
                          }
                        },
                        'Complaints *',
                        'Type Here ...',
                        // () {},
                        8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  state is ComplaintsAddLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ComplaintsCubit.get(context).addCompliant(
                                  title: _titleController.text,
                                  message: _messageController.text,
                                  type: _typeController.text,
                                  taskId: _taskIdController.text);
                            }
                          },
                          text: 'Send',
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
