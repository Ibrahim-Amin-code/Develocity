// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/bottom_nav/layout.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/widgets/login_widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode confirmPassFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: h * 0.1,
                      ),
                      Text(
                        'Develocity',
                        textAlign: TextAlign.center,
                        style: headingStyle.copyWith(
                            fontSize: 30,
                            color: MyColors.mainColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Text(
                        'Management  App',
                        style: headingStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: const Color(0xff9A9A9A)),
                      ),
                      SizedBox(
                        height: h * 0.08,
                      ),
                      Text(
                        'Forgot Your Pasword',
                        style: headingStyle.copyWith(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff474747)),
                      ),
                      SizedBox(
                        height: h * 0.04,
                      ),
                      textFormField(
                        controller: emailController,
                        obscureText: false,
                        hintText: 'Email',
                        image: 'assets/images/msg.png',
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocus,
                        onEditingComplete: () {
                          emailFocus.unfocus();
                          FocusScope.of(context).requestFocus(passFocus);
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Email Is Requried';
                          } else if (!val.contains("@") ||
                              !val.contains(".com")) {
                            return 'Email Is Validate';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      textFormField(
                        controller: passController,
                        obscureText: true,
                        hintText: 'Password',
                        image: 'assets/images/lock.png',
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: passFocus,
                        onEditingComplete: () {
                          passFocus.unfocus();
                          FocusScope.of(context).requestFocus(confirmPassFocus);
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Password Is Requried';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      textFormField(
                        controller: confirmPassController,
                        obscureText: true,
                        hintText: 'Confirm Password',
                        image: 'assets/images/lock.png',
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: confirmPassFocus,
                        onEditingComplete: () {
                          confirmPassFocus.unfocus();
                          // FocusScope.of(context).requestFocus(passFocus);
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Confirm Password Is Requried';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      defaultButton(
                          title: 'Login',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LayoutScreen(
                                          index: 0,
                                        )));
                          },
                          fontSize: 14,
                          height: h * 0.063,
                          width: w * 0.95,
                          color: MyColors.mainColor,
                          textColor: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
