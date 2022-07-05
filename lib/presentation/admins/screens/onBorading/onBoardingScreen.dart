// ignore_for_file: file_names, use_key_in_widget_constructors, unused_local_variable

import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';

import '../authentication/loign/loign_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Easy Time Management",
      "image": "assets/images/bro.png",
      "sub":
          "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first ",
    },
    {
      "text": 'Increase Work Effectiveness',
      "image": "assets/images/bro14.png",
      "sub":
          "Time management and the determination of more important tasks will give your job statistics better and always improve",
    },
    {
      "text": 'Reminder Notification',
      "image": "assets/images/bro00.png",
      "sub":
          "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set",
    },
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: h * 0.1),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'skip',
                  style: headingStyle.copyWith(
                      fontSize: 15,
                      fontFamily: '',
                      color: const Color(0xff696CFF)),
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.09),

          Expanded(
            flex: 3,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index]["image"].toString(),
                text: splashData[index]['text'].toString(),
                subTitle: splashData[index]['sub'].toString(),
              ),
            ),
          ),
          // SizedBox(height: h * 0.035),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              splashData.length,
              (index) => buildOnBoardingDot(
                  index: index, currentPage: currentPage, context: context),
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          defaultButton(
            title: 'Next',
            textColor: Colors.white,
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));

              // SharedPreferences prefs =
              //     await SharedPreferences.getInstance();
              // prefs.setBool('is_onboearding', true);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const HomeScreen()));
            },
            fontSize: 13,
            height: h * 0.063,
            width: w * 0.9,
            color: MyColors.mainColor,
          ),
          SizedBox(
            height: h * 0.05,
          ),
        ],
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String text, image, subTitle;

  const SplashContent(
      {Key? key,
      required this.text,
      required this.image,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // const SizedBox(
        //   height: 25,
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.1),
          child: Image.asset(
            image,
            // height: h * 0.3,
            width: w * 1,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: h * 0.035,
        ),
        SizedBox(
          width: w * 0.6,
          child: Text(
            text,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: w * 0.042,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: 'SourceSansPro'),
          ),
        ),
        SizedBox(height: h * 0.022),
        SizedBox(
          width: w * 0.85,
          child: Text(
            subTitle,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: headingStyle.copyWith(
                fontSize: 14.5,
                fontFamily: 'SourceSansPro',
                color: const Color(0xff4A4646)),
          ),
        ),
      ],
    );
  }
}

AnimatedContainer buildOnBoardingDot(
    {required int index, required int currentPage, required context}) {
  // double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    margin: EdgeInsets.only(right: w * 0.03),
    height: 8,
    width: currentPage == index ? w * 0.02 : w * 0.02,
    decoration: BoxDecoration(
      color: currentPage == index ? MyColors.mainColor : Colors.grey.shade300,
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

Widget defaultButton({
  required String title,
  required VoidCallback? onPressed,
  required double? fontSize,
  required double? height,
  required double? width,
  required Color color,
  required Color textColor,
  EdgeInsetsGeometry? margin,
}) =>
    Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),

        //#3A0CA3
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: 'SF Pro Display',
          ),
        ),
      ),
    );
