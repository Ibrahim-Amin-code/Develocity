import 'package:develocity/presentation/admins/screens/teams/team_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/core/colors.dart';

Widget buildHomeGrid(context) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;

  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      crossAxisSpacing: 10,
      mainAxisSpacing: 15,
    ),
    shrinkWrap: true,
    primary: true,
    padding: EdgeInsets.zero,
    itemCount: 8,
    itemBuilder: ((ctx, index) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TeamScreen()));
        },
        child: Column(
          children: [
            // SizedBox(
            //   height: h * 0.008,
            // ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: h * 0.02),
                  width: w * 0.43,
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.025, vertical: h * 0.013),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          color: MyColors.backgroundColor,
                          spreadRadius: 3,
                          blurRadius: 5)
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'assets/images/points.png',
                            width: w * 0.06,
                            height: 8,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        Text(
                          'Ui / Ux Team',
                          style: headingStyle.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff435971)),
                        ),
                        SizedBox(
                          height: h * 0.008,
                        ),
                        Text(
                          'Landing Page',
                          style: headingStyle.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff888888)),
                        ),
                        SizedBox(
                          height: h * 0.012,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/avatars.png',
                              width: w * 0.06,
                              height: h * 0.03,
                            ),
                            Image.asset(
                              'assets/images/avatars.png',
                              width: w * 0.06,
                              height: h * 0.03,
                            ),
                            Image.asset(
                              'assets/images/avatars.png',
                              width: w * 0.06,
                              height: h * 0.03,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Progress',
                              style: headingStyle.copyWith(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: w * 0.035,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff435971)),
                            ),
                            Text(
                              '45%',
                              style: headingStyle.copyWith(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: w * 0.035,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff435971)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        LinearPercentIndicator(
                          width: w * 0.38,
                          lineHeight: 12.0,
                          percent: 0.5,
                          backgroundColor: const Color(0xffD9D9D9),
                          progressColor: MyColors.mainColor,
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: const EdgeInsets.only(right: 3),
                            width: w * 0.17,
                            height: h * 0.025,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    const Color(0xffDC6465).withOpacity(0.3)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 13,
                                  color: Color(0xffDC6465),
                                ),
                                Text(
                                  '1week left',
                                  style: headingStyle.copyWith(
                                      fontSize: w * 0.023,
                                      color: const Color(0xffDC6465),
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: w * 0.16,
                  ),
                  padding: const EdgeInsets.all(2.6),
                  width: 40,
                  height: 40,
                  child: Center(
                      child: Image.asset(
                    'assets/images/icon.png',
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.mainColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }),
  );
}
