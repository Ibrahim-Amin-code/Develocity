// ignore_for_file: prefer_const_constructors, unused_local_variable, duplicate_ignore

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/authentication/loign/loign_screen.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/screens/home_layout/user_home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/app_cubit/app_cubit.dart';
import '../../bottom_nav/layout.dart';
import '../otp/otp_screen.dart';

class UserOrAdminScreen extends StatefulWidget {
  const UserOrAdminScreen({Key? key}) : super(key: key);

  @override
  State<UserOrAdminScreen> createState() => _UserOrAdminScreenState();
}

class _UserOrAdminScreenState extends State<UserOrAdminScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    bool click = false;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.09,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
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
                height: h * 0.09,
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
                'Welcome Samaa !',
                style: headingStyle.copyWith(
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff696CFF)),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Text(
                'Why are using our System',
                style: headingStyle.copyWith(
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor),
              ),
              SizedBox(
                height: h * 0.06,
              ),
              BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildUserOrAdminCard(
                          image: 'assets/images/user11.png',
                          text: 'User',
                          cardColor: (AppCubit.get(context).isUser == true)
                              ? MyColors.mainColor.withOpacity(0.25)
                              : Theme.of(context).cardColor,
                          onTap: () {
                            AppCubit.get(context).userOrAdmin(
                                isUserClicked: true, isAdminClicked: false);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginScreen(true)));
                          },
                          imageColor: (AppCubit.get(context).isUser == true)
                              ? MyColors.mainColor
                              : Color(0xffC4C4C4),
                          textColor: (AppCubit.get(context).isUser == true)
                              ? MyColors.mainColor
                              : Color(0xffC4C4C4)),
                      buildUserOrAdminCard(
                          image: 'assets/images/Group 2474.png',
                          text: 'Admin',
                          cardColor: (AppCubit.get(context).isAdmin == true)
                              ? MyColors.mainColor.withOpacity(0.25)
                              : Theme.of(context).cardColor,
                          onTap: () {
                            AppCubit.get(context).userOrAdmin(
                                isUserClicked: false, isAdminClicked: true);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginScreen(false)));
                          },
                          imageColor: (AppCubit.get(context).isAdmin == true)
                              ? MyColors.mainColor
                              : Color(0xffC4C4C4),
                          textColor: (AppCubit.get(context).isAdmin == true)
                              ? MyColors.mainColor
                              : Color(0xffC4C4C4)),
                    ],
                  );
                },
              ),
              Spacer(),
              BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return defaultButton(
                      title: 'Go to Dashboard',
                      onPressed: () {
                        (AppCubit.get(context).isAdmin)
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LayoutScreen(
                                          index: 0,
                                        )))
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UserHomeLayoutScreen()));
                      },
                      fontSize: 14,
                      height: h * 0.06,
                      width: w * 0.95,
                      color: MyColors.mainColor,
                      textColor: Colors.white);
                },
              ),
              SizedBox(
                height: h * 0.026,
              ),
              SizedBox(
                height: h * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserOrAdminCard({
    required String image,
    Color? imageColor,
    required String text,
    required Color cardColor,
    required Color textColor,
    required GestureTapCallback? onTap,
  }) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: w * 0.4,
            height: h * 0.17,
            decoration: BoxDecoration(
                color: cardColor,
                border: Border.all(
                    color: Color(
                  0xffC4C4C4,
                )),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Image.asset(image, color: imageColor ?? Color(0xffC4C4C4)),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: headingStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Display',
                color: textColor),
          )
        ],
      ),
    );
  }
}
