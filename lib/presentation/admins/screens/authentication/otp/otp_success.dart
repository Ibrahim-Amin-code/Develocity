import 'package:flutter/material.dart';

import '../../../../../constants/core/colors.dart';
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
                height: 200,
                width: 215,
              ),
              SizedBox(
                height: h * 0.06,
              ),
              SizedBox(
                width: 130,
                child: Text(
                  'Your Account has been Verified Successfully!',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontSize: 12,
                      color: Color(0xff4A4646),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              defaultButton(
                  title: 'Go to Dashboard',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => OtpSuccessScreen()));
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
    ;
  }
}
