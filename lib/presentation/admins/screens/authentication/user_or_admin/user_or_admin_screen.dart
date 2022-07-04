// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.08,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    print('ffffffffffffff');
                  },
                  child: Container(
                    width: 35,
                    height: 35,
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
                    color: const Color(0xff435971)),
              ),
              SizedBox(
                height: h * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildUserOrAdminCard(
                      image: 'assets/images/Vector (1).png',
                      text: 'User',
                      cardColor: Colors.white,
                      textColor: Color(0xffC4C4C4)),
                  buildUserOrAdminCard(
                      image: 'assets/images/Group 2474.png',
                      text: 'Admin',
                      cardColor: MyColors.mainColor.withOpacity(0.25),
                      textColor: MyColors.mainColor),
                ],
              ),
              Spacer(),
              defaultButton(
                  title: 'Confirm',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpScreen()));
                  },
                  fontSize: 14,
                  height: 50,
                  width: 345,
                  color: MyColors.mainColor,
                  textColor: Colors.white),
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
      backgroundColor: Colors.white,
    );
  }

  Widget buildUserOrAdminCard({
    required String image,
    required String text,
    required Color cardColor,
    required Color textColor,
  }) =>
      Column(
        children: [
          Container(
            width: 125,
            height: 105,
            decoration: BoxDecoration(
                color: cardColor,
                border: Border.all(color: Color(0xffC4C4C4)),
                borderRadius: BorderRadius.circular(10)),
            child: Center(child: Image.asset(image)),
          ),
          SizedBox(
            height: 15,
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
      );
}
