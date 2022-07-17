// ignore_for_file: prefer_const_constructors

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';

import '../../../widgets/drawer_widget.dart';

class AddAdminsScreeen extends StatefulWidget {
  const AddAdminsScreeen({Key? key}) : super(key: key);

  @override
  State<AddAdminsScreeen> createState() => _AddAdminsScreeenState();
}

class _AddAdminsScreeenState extends State<AddAdminsScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    final _keyForm = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Admins',
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
              'Add new Admin',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  fontSize: 20,
                  color: Color(0xff435971),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            CustomTextFormField(nameController, TextInputType.name, () {},
                'Admin Name *', 'Enter name', () {}, 1),
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
            CustomTextFormField(nameController, TextInputType.name, () {},
                'Section Name *', 'Enter name', () {}, 1),
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
                11),
            SizedBox(
              height: h * 0.04,
            ),
            Text('Admin Image *',
                style: headingStyle.copyWith(
                    color: MyColors.mainColor,
                    fontFamily: 'SF Pro Display',
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: h * 0.01,
            ),
            Container(
              width: 335,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: MyColors.mainColor.withOpacity(0.1))),
              child: Row(
                children: [
                  Container(
                    width: 128,
                    // height: 48,
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
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'No file chooosen',
                    style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffC4C4C4),
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
              height: h * 0.08,
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
