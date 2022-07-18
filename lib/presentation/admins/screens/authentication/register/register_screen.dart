// ignore_for_file: prefer_const_constructors, unused_local_variable, duplicate_ignore

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/widgets/login_widget.dart';
import 'package:flutter/material.dart';

import '../user_or_admin/user_or_admin_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FocusNode nameFocus = FocusNode();
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: h * 0.06,
                  // ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: h * 0.07),
                        width: w * 0.095,
                        height: h * 0.05,
                        decoration: BoxDecoration(
                            color: MyColors.mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
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
                    height: h * 0.005,
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
                    height: h * 0.07,
                  ),
                  Text(
                    'Create your account',
                    style: headingStyle.copyWith(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor),
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  textFormField(
                    context: context,
                    controller: nameController,
                    obscureText: false,
                    hintText: 'Username',
                    image: 'assets/images/msg.png',
                    keyboardType: TextInputType.name,
                    focusNode: nameFocus,
                    onEditingComplete: () {
                      nameFocus.unfocus();
                      FocusScope.of(context).requestFocus(emailFocus);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Username Is Requried';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  textFormField(
                    context: context,
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
                      } else if (!val.contains("@") || !val.contains(".com")) {
                        return 'Email Is Validate';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  textFormField(
                    context: context,
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
                    height: h * 0.02,
                  ),
                  textFormField(
                    context: context,
                    controller: passController,
                    obscureText: true,
                    hintText: 'Password',
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
                    height: h * 0.04,
                  ),
                  defaultButton(
                      title: 'Register',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserOrAdminScreen()));
                      },
                      fontSize: 14,
                      height: h * 0.063,
                      width: w * 0.95,
                      color: MyColors.mainColor,
                      textColor: Colors.white),
                  SizedBox(
                    height: h * 0.026,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
