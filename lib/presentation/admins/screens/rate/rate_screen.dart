// ignore_for_file: prefer_const_constructors

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/widgets/profile_components.dart';
import 'package:flutter/material.dart';

import '../../../../constants/core/const.dart';
import '../../widgets/drawer_widget.dart';

class RateAdminScreeen extends StatefulWidget {
  const RateAdminScreeen({Key? key}) : super(key: key);

  @override
  State<RateAdminScreeen> createState() => _RateAdminScreeenState();
}

class _RateAdminScreeenState extends State<RateAdminScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final _keyForm = GlobalKey<FormState>();
    final TextEditingController noteController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final List<String> company = [
      'company1',
      'company2',
      'company3',
      'company4',
      'company5',
      'company6',
      'company7',
    ];
    final List<String> branch = [
      'branch1',
      'branch2',
      'branch3',
      'branch4',
      'branch5',
      'branch6',
      'branch7',
    ];
    final List<String> employee = [
      'employee1',
      'employee2',
      'employee3',
      'employee4',
      'employee5',
      'employee6',
      'employee7',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Rate',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: h * 0.025,
            ),
            Text(
              'Company *',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: MyColors.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            CustomDropDown(
              items: company,
              text: 'Select company',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              'Branch *',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: MyColors.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            CustomDropDown(
              items: branch,
              text: 'Select Branch',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              'Employee *',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: MyColors.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            CustomDropDown(
              items: employee,
              text: 'Select Employee',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            CustomTextFormField(
              hint: 'Enter Rate Value',
              label: 'Rate *',
              inputType: TextInputType.number,
              controller: rateController,
              onTap: () {},
              validate: (s) {},
            ),
            SizedBox(
              height: h * 0.005,
            ),
            Text(
              'Rate should be from 0.0 to 5.0',
              style: headingStyle.copyWith(
                  fontFamily: 'Roboto',
                  color: MyColors.mainColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            CustomTextFormField(
              controller: noteController,
              onTap: () {},
              label: 'Notes *',
              validate: (s) {},
              inputType: TextInputType.text,
              hint: 'Type Note',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            defaultButton(
                title: 'Submit',
                onPressed: () {},
                fontSize: 16,
                height: h * 0.06,
                width: w * 0.9,
                color: MyColors.mainColor,
                textColor: Colors.white)
          ]),
        ),
      ),
    );
  }
}
