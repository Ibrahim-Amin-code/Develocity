import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/authentication/loign/login_cubit/login_cubit.dart';
import 'package:develocity/presentation/admins/screens/authentication/loign/login_cubit/login_states.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/widgets/login_widget.dart';
import 'package:develocity/presentation/users/screens/home_layout/user_home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftoast/ftoast.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  bool isUser;

  LoginScreen(this.isUser);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
      if (state is LoginUserSuccessState && cubit.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                   UserHomeLayoutScreen())));
      } else {
        FToast.toast(
          context,
          msg: '${cubit.message}',
          color: Colors.red,
          msgStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
          duration: 2500,
        );
      }
    }, builder: (BuildContext context, state) {
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
                          'Login to your account',
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
                          context: context,
                          controller: passController,
                          obscureText: true,
                          hintText: 'Password',
                          image: 'assets/images/lock.png',
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: passFocus,
                          onEditingComplete: () {
                            passFocus.unfocus();
                            // FocusScope.of(context).requestFocus(passFocus);
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Password Is Requried';
                            }
                            return null;
                          },
                        ),
                        // SizedBox(
                        //   height: h * 0.01,
                        // ),
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: InkWell(
                        //     onTap: () => Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 ForgetPasswordScreen())),
                        //     child: Text(
                        //       'Forgot password?  ',
                        //       style: headingStyle.copyWith(
                        //           fontSize: 12,
                        //           fontFamily: 'Poppins',
                        //           fontWeight: FontWeight.w500,
                        //           color: const Color(0xff87ADF4)),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        defaultButton(
                            title: 'Login',
                            onPressed: () {
                              if (widget.isUser == true) {
                                cubit.userLogin(
                                    emailController.text, passController.text);
                              }
                            },
                            fontSize: 14,
                            height: h * 0.063,
                            width: w * 0.95,
                            color: MyColors.mainColor,
                            textColor: Colors.white),
                        SizedBox(
                          height: h * 0.03,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account? ',
                              style: headingStyle.copyWith(
                                  fontFamily: 'Poppins',
                                  color: const Color(0xff9A9A9A),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const RegisterScreen())));
                              },
                              child: Text(
                                'Sign Up',
                                style: headingStyle.copyWith(
                                    fontFamily: 'Poppins',
                                    color: MyColors.mainColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
