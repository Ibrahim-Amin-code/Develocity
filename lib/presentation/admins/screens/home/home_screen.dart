// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/admins/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/home_widget.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  int currentIndex = 0;

  List<String> titles = [
    'All',
    'Started',
    'Approval',
    'Rejected',
    'Complete',
  ];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      drawer: buildDrawerWidget(context: context),
      backgroundColor: Colors.white,
      appBar: csutomAppBar(
          onTap: () => scaffoldKey.currentState!.openDrawer(),
          image: 'assets/images/carbon_notification-new.png',
          image2: 'assets/images/eva_menu-outline.png',
          onTap1: () => Navigator.push(context,
              MaterialPageRoute(builder: (conext) => NotificationScreen())),
          text: 'Dashboard'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: h * 0.03,
              // ),
              Text(
                ' Projects',
                textAlign: TextAlign.center,
                style: headingStyle.copyWith(
                    color: Color(0xff435971),
                    fontSize: w * 0.065,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF Pro Display'),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      titles.length,
                      (index) => buildDot(
                          index: index, h: h, w: w, text: titles[index]),
                      growable: true),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              SizedBox(
                width: w,
                height: h * .643,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: titles.length,
                    onPageChanged: (val) {
                      setState(() {
                        currentIndex = val;
                      });
                    },
                    itemBuilder: (context, index) {
                      return buildHomeGrid(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(
      {required int index,
      required double h,
      required double w,
      required String text}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: Color(0xffFAFAFA),
      padding: EdgeInsets.symmetric(horizontal: w * 0.01),
      child: InkWell(
        onTap: () {
          pageController.animateToPage(index,
              duration: const Duration(microseconds: 500),
              curve: Curves.fastOutSlowIn);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: w * 0.17,
              height: h * 0.034,
              decoration: BoxDecoration(
                  color: (currentIndex == index)
                      ? MyColors.mainColor
                      : Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(7)),
              child: Center(
                child: Text(
                  text,
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: (currentIndex == index)
                          ? Colors.white
                          : MyColors.unselectedIconColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
