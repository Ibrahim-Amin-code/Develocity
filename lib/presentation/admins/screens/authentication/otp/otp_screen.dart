// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../../../constants/core/colors.dart';
import '../../onBorading/onBoardingScreen.dart';
import 'otp_success.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                height: h * 0.08,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: w * 0.095,
                    height: h * 0.05,
                    decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
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
                'assets/images/bro11.png',
                fit: BoxFit.cover,
                height: h * 0.22,
                width: w * 0.54,
              ),
              SizedBox(
                height: h * 0.05,
              ),
              SizedBox(
                width: w * 0.4,
                child: Text(
                  'Please enter the verification number we send to your email',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontSize: 12,
                      color: const Color(0xff4A4646),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              defaultButton(
                  title: 'Confirm',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpSuccessScreen()));
                  },
                  fontSize: 14,
                  height: h * 0.06,
                  width: w * 0.95,
                  color: MyColors.mainColor,
                  textColor: Colors.white),
              SizedBox(
                height: h * 0.042,
              ),
              // SizedBox(
              //   height: h * 0.025,
              // ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
