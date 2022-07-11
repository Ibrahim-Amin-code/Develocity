import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../constants/core/colors.dart';
import '../screens/onBorading/onBoardingScreen.dart';

class AdminProfileCard extends StatelessWidget {
  const AdminProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: h * .16,
            color: MyColors.mainColor,
          ),
        ),
        Center(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: h * 0.06),
                height: h * .23,
                width: w * .9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1A006EE9).withOpacity(0.3),
                      blurRadius: 2,
                      offset: const Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.14),
                  child: Row(
                    children: [
                      SizedBox(
                          height: h * 0.05,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: w * 0.06),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/locationN.png',
                                  height: 20,
                                  width: 15,
                                ),
                                SizedBox(
                                  width: h * 0.01,
                                ),
                                Text(
                                  'Mansoura , Egypt',
                                  style: headingStyle.copyWith(
                                      fontSize: 12,
                                      fontFamily: 'SF Pro Display',
                                      color: const Color(0xff4A4646)),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                          // width: 250,
                          height: h * 0.04,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: w * 0.06),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/bag.png',
                                  height: 20,
                                  width: 15,
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                Text(
                                  '2653 Task Completed',
                                  style: headingStyle.copyWith(
                                      fontSize: 12,
                                      fontFamily: 'SF Pro Display',
                                      color: const Color(0xff4A4646)),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: w * .28),
                        width: w * .22,
                        height: h * 0.12,
                        decoration: BoxDecoration(
                            color: MyColors.mainColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: MyColors.mainColor,
                            ),
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/profile11.png'))),
                      ),
                      Container(
                        color: MyColors.mainColor,
                        margin: EdgeInsets.only(
                          left: w * .44,
                          top: h * .08,
                        ),
                        child: Image.asset(
                          'assets/images/pin.png',
                          // color: MyColors.mainColor,

                          width: w * 0.078,
                          height: h * 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: w * .29),
                      child: Text(
                        'Samaa Samir',
                        style: headingStyle.copyWith(
                            color: MyColors.mainColor,
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: w * .28),
                      child: Text(
                        'UI UX Designer',
                        style: headingStyle.copyWith(
                            color: const Color(0xff4A4646),
                            fontSize: 12,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500),
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AdminEditProfileCard extends StatelessWidget {
  const AdminEditProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: h * .16,
            color: MyColors.mainColor,
          ),
        ),
        Center(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: h * 0.06),
                height: h * .23,
                width: w * .9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1A006EE9).withOpacity(0.3),
                      blurRadius: 2,
                      offset: const Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.14),
                  child: Row(
                    children: [
                      SizedBox(
                          height: h * 0.05,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: w * 0.06),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/locationN.png',
                                  height: 20,
                                  width: 15,
                                ),
                                SizedBox(
                                  width: h * 0.01,
                                ),
                                Text(
                                  'Mansoura , Egypt',
                                  style: headingStyle.copyWith(
                                      fontSize: 12,
                                      fontFamily: 'SF Pro Display',
                                      color: const Color(0xff4A4646)),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                          // width: 250,
                          height: h * 0.04,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: w * 0.06),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/bag.png',
                                  height: 20,
                                  width: 15,
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                Text(
                                  '2653 Task Completed',
                                  style: headingStyle.copyWith(
                                      fontSize: 12,
                                      fontFamily: 'SF Pro Display',
                                      color: const Color(0xff4A4646)),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: w * .28),
                    width: w * .22,
                    height: h * 0.12,
                    decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MyColors.mainColor,
                        ),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profile11.png'))),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  defaultButton(
                      margin: EdgeInsets.only(left: w * .28),
                      title: 'change picture',
                      onPressed: () {},
                      fontSize: 14,
                      height: 35,
                      width: 125,
                      color: MyColors.mainColor,
                      textColor: Colors.white),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

AppBar adminProfileAppBar({
  required String title,
  required GestureTapCallback? onTapSearch,
  required context,
}) =>
    AppBar(
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
              onTap: onTapSearch,
              child: const Icon(
                Icons.search,
                size: 27,
              )),
        ),
      ],
      elevation: 0.0,
      backgroundColor: MyColors.mainColor,
      title: Text(
        title,
        style: headingStyle.copyWith(
            color: Colors.white,
            fontFamily: 'SF Pro Display',
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          )),
    );
