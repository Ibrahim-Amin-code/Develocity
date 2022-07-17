// ignore_for_file: deprecated_member_use

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  DateTime selectedDate = DateTime.now();

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> selectEndstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
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

  final List<String> member = [
    'member1',
    'member2',
    'member3',
    'member4',
    'member5',
    'member6',
    'member7',
  ];

  final List<String> company = [
    'company1',
    'company2',
    'company3',
    'company4',
    'company5',
    'company6',
    'company7',
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      appBar: customTaskAppBar(h: h, w: w, title: 'Add Task', context: context),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
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
                      onTap: () => selectEndstDate(context),
                      child: Container(
                        width: w * 0.4,
                        height: h * 0.07,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff05006EE9)),
                            color: Color(0xffEEF5FD),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: datePickerCard(
                          iconColor: Color(0xffABCEF5),
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
                            child: datePickerCard(
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
                CustomDropDown(
                  items: member,
                  text: 'Select Members',
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Text(
                  'Company',
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
                  items: company,
                  text: 'Select Company',
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                CustomTextFormField(descriptionController, TextInputType.text,
                    () {}, 'Description', 'Type Description', () {}, 5),
                SizedBox(
                  height: h * 0.02,
                ),
                defaultButton(
                    title: 'Create Task',
                    onPressed: () {
                      print('fffffffffff');
                      showTaskPopup(
                          context: context,
                          title: (AppCubit.get(context).isIndividualTask)
                              ? 'Indivisual  task has been created successfully'
                              : '  Team task has been created successfully  ');
                    },
                    fontSize: 14,
                    height: h * 0.06,
                    width: double.infinity,
                    color: MyColors.mainColor,
                    textColor: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget datePickerCard({
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
              "${selectedDate.toLocal()}".split(' ')[0],
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
