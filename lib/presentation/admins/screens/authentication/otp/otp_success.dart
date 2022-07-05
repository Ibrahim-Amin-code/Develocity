// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../../../constants/core/colors.dart';
import '../../bottom_nav/layout.dart';
import '../../onBorading/onBoardingScreen.dart';

class OtpSuccessScreen extends StatefulWidget {
  const OtpSuccessScreen({Key? key}) : super(key: key);

  @override
  State<OtpSuccessScreen> createState() => _OtpSuccessScreenState();
}

class _OtpSuccessScreenState extends State<OtpSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.15,
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
                'Verify Account',
                style: headingStyle.copyWith(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff474747)),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Image.asset(
                'assets/images/bro12.png',
                fit: BoxFit.cover,
                height: h * 0.26,
                width: w * 0.55,
              ),
              SizedBox(
                height: h * 0.06,
              ),
              SizedBox(
                width: w * 0.4,
                child: Text(
                  'Your Account has been Verified Successfully!',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontSize: 12,
                      color: const Color(0xff4A4646),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: h * 0.15,
              ),
              defaultButton(
                  title: 'Go to Dashboard',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayoutScreen(
                                  index: 0,
                                )));
                  },
                  fontSize: 14,
                  height: h * 0.06,
                  width: w * 0.95,
                  color: MyColors.mainColor,
                  textColor: Colors.white),
              SizedBox(
                height: h * 0.048,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
