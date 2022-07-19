// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/core/const.dart';
import '../../../widgets/drawer_widget.dart';

class AddUsersScreeen extends StatefulWidget {
  const AddUsersScreeen({Key? key}) : super(key: key);

  @override
  State<AddUsersScreeen> createState() => _AddUsersScreeenState();
}

class _AddUsersScreeenState extends State<AddUsersScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    final _keyForm = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final List<String> section = [
      'Deveovity1',
      'Deveovity2',
      'Deveovity3',
      'Deveovity4',
      'Deveovity5',
      'Deveovity6',
      'Deveovity7',
    ];

    final List<String> branch = [
      'Deveovity1',
      'Deveovity2',
      'Deveovity3',
      'Deveovity4',
      'Deveovity5',
      'Deveovity6',
      'Deveovity7',
    ];

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Users',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Add new User',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  fontSize: 20,
                  color: MyColors.mainColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: h * 0.04,
            ),

            CustomTextFormField(nameController, TextInputType.name, () {},
                'User Name *', 'Enter name', () {}, 1),
            SizedBox(
              height: h * 0.02,
            ),
            CustomTextFormField(emailController, TextInputType.emailAddress,
                () {}, 'Email *', 'Enter Email', () {}, 1),
            SizedBox(
              height: h * 0.02,
            ),
            CustomTextFormField(
                passwordController,
                TextInputType.visiblePassword,
                () {},
                'Password *',
                'Enter Password',
                () {},
                1),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              'Branches *',
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
              items: branch,
              text: 'Select Branch',
            ),

            SizedBox(
              height: h * 0.03,
            ),
            Text(
              'Sections *',
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
              items: section,
              text: 'Select Sections',
            ),
            // Spacer(),

            SizedBox(
              height: h * 0.03,
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
