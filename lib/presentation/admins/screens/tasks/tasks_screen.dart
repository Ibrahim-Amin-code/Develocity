// ignore_for_file: deprecated_member_use, use_full_hex_values_for_flutter_colors, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/add_user/add_user_cubit.dart';
import 'package:develocity/business_logic/admin_task_cubit/admin_task_cubit.dart';
import 'package:develocity/business_logic/branch_cubit/branch_cubit.dart';
import 'package:develocity/business_logic/section_cubit/section_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/presentation/admins/screens/bottom_nav/layout.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../business_logic/app_cubit/app_cubit.dart';
import '../../../../constants/core/const.dart';
import '../../../users/widgets/user_components.dart';
import '../../widgets/tasks.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Future<void> selectEndstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedEndDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  File? image;
  String image1 = "";

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
          image1 = pickedFile.path;
        });
      } else {
        setState(() {
          image = File(pickedFile!.path);
          image1 = pickedFile.path;
        });
      }
    });
  }

  final List<String> periority = [
    'periority1',
    'periority2',
    'periority3',
    'periority4',
    'periority5',
    'periority6',
    'periority7',
  ];
  List<String> section = [];
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyColors.mainColor,
      appBar: customTaskAppBar(h: h, w: w, title: 'Add Task', context: context),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * 0.06),
              topRight: Radius.circular(w * 0.06),
            )),
        margin: EdgeInsets.only(top: h * 0.03),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Start',
                      style: headingStyle.copyWith(
                          fontFamily: 'Poppins',
                          color: MyColors.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: w * 0.4,
                    ),
                    Text(
                      'Ends',
                      style: headingStyle.copyWith(
                          fontFamily: 'Poppins',
                          color: MyColors.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => selectStartDate(context),
                      child: Container(
                        width: w * 0.4,
                        height: h * 0.07,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: const Color(0xff05006EE9)),
                            color: const Color(0xffEEF5FD),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: datePickerCardStart(
                          iconColor: const Color(0xffABCEF5),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    InkWell(
                      onTap: () => selectEndstDate(context),
                      child: Container(
                        width: w * 0.4,
                        height: h * 0.07,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff05006EE9)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: datePickerCardEnd(
                          // cardColor: Colors.white,
                          iconColor: MyColors.mainColor,
                        )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                Text(
                  'Task Status',
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      color: MyColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        defaultButton(
                            title: 'Individual Task',
                            onPressed: () {
                              AppCubit.get(context).individualOrTeamTask(
                                  isIndividualClicked: true,
                                  isTeamTaskClicked: false);
                            },
                            fontSize: 14,
                            height: h * 0.065,
                            width: w * 0.4,
                            color: (AppCubit.get(context).isIndividualTask)
                                ? MyColors.mainColor
                                : Colors.white,
                            textColor: (AppCubit.get(context).isIndividualTask)
                                ? Colors.white
                                : MyColors.mainColor),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        defaultButton(
                            title: 'Team Task',
                            onPressed: () {
                              AppCubit.get(context).individualOrTeamTask(
                                  isIndividualClicked: false,
                                  isTeamTaskClicked: true);
                            },
                            fontSize: 14,
                            height: h * 0.065,
                            width: w * 0.4,
                            color: (AppCubit.get(context).isIndividualTask) ==
                                    false
                                ? MyColors.mainColor
                                : Colors.white,
                            textColor:
                                (AppCubit.get(context).isIndividualTask) ==
                                        false
                                    ? Colors.white
                                    : MyColors.mainColor),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Text(
                  'Task Periority',
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      color: MyColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                CustomDropDown(
                  items: periority,
                  text: 'Select Periority',
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Text(
                  'Task Member',
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      color: MyColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                BlocConsumer<AddUserCubit, AddUserState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: state is! GetAdminUserLoadingState,
                        builder: (context) => CustomDropDownUsers(
                              items: AddUserCubit.get(context)
                                  .getAdminUserModel
                                  .data!,
                              text: 'Select Members',
                            ),
                        fallback: (context) => Center(
                              child: LinearProgressIndicator(),
                            ));
                  },
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Text(
                  'Branches ',
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      color: MyColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                BlocConsumer<BranchCubit, BranchState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: state is! GetBranchLoadingState,
                        builder: (context) => CustomDropDownBranch(
                              items: BranchCubit.get(context).branchModel.data!,
                              text: 'Select Branch',
                            ),
                        fallback: (context) => Center(
                              child: LinearProgressIndicator(),
                            ));
                  },
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Text(
                  'Sections ',
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      color: MyColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                BlocConsumer<SectionCubit, SectionState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: state is! GetSectionLoadingState,
                        builder: (context) => CustomDropDownSection(
                              items:
                                  SectionCubit.get(context).sectionModel.data!,
                              text: 'Select Section',
                            ),
                        fallback: (context) => Center(
                              child: LinearProgressIndicator(),
                            ));
                  },
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                CustomTextFormField(titleController, TextInputType.text, () {},
                    'Title', 'Type Title', 1),
                SizedBox(
                  height: h * 0.02,
                ),
                CustomTextFormField(descriptionController, TextInputType.text,
                    () {}, 'Description', 'Type Description', 5),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  width: 335,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: MyColors.mainColor.withOpacity(0.1))),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          await getImage();
                        },
                        child: Container(
                          width: 128,
                          color: Color(0xff1A696CFF),
                          child: Center(
                            child: Text(
                              'Choose File',
                              style: headingStyle.copyWith(
                                fontFamily: 'SF Pro Display',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyColors.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 180,
                        child: Text(
                          (image1 != '') ? image1 : 'No file chooosen',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: headingStyle.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffC4C4C4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  'Image with should be jpg , jpeg , png',
                  style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: MyColors.mainColor,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                BlocConsumer<TaskAdminUserCubit, TaskAdminUserState>(
                  listener: (context, state) {
                    if (state is AddTaskSuccessState) {
                      // TaskAdminUserCubit.get(context).getTasksAdminUser();
                      // showTaskPopup(
                      //     context: context,
                      //     title: (AppCubit.get(context).isIndividualTask)
                      //         ? 'Indivisual  task has been created successfully'
                      //         : '  Team task has been created successfully  ');

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LayoutScreen(index: 0)));
                    }
                  },
                  builder: (context, state) {
                    return (state is! AddTaskLoadingState)
                        ? defaultButton(
                            title: 'Create Task',
                            onPressed: () {
                              TaskAdminUserCubit.get(context).addTask(
                                  title: titleController.text,
                                  img: image1,
                                  branchId:
                                      prefs.getString('branchId').toString(),
                                  sectionId: sectionIds,
                                  userIds: usersIds,
                                  desc: descriptionController.text,
                                  startDate: selectedStartDate.day.toString() +
                                      "/" +
                                      selectedStartDate.month.toString() +
                                      "/" +
                                      selectedStartDate.year.toString(),
                                  endDate: selectedEndDate.day.toString() +
                                      "/" +
                                      selectedEndDate.month.toString() +
                                      "/" +
                                      selectedEndDate.year.toString());
                              print('fffffffffff');
                            },
                            fontSize: 14,
                            height: h * 0.06,
                            width: double.infinity,
                            color: MyColors.mainColor,
                            textColor: Colors.white)
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget datePickerCardStart({
    required Color? iconColor,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.calendar_month,
              color: iconColor,
              size: 18,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "${selectedStartDate.toLocal()}".split(' ')[0],
              style: headingStyle.copyWith(
                  fontFamily: 'Poppins',
                  color: Color(0xff4A4646),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );

  Widget datePickerCardEnd({
    required Color? iconColor,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.calendar_month,
              color: iconColor,
              size: 18,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "${selectedEndDate.toLocal()}".split(' ')[0],
              style: headingStyle.copyWith(
                  fontFamily: 'Poppins',
                  color: Color(0xff4A4646),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
}
