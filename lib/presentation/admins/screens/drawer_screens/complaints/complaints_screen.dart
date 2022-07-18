import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/drawer_widget.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Complaints',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'All',
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      color: const Color(0xff696CFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: w * 0.05,
                ),
                Text(
                  'Recently added',
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      color: const Color(0xff435971).withOpacity(0.5),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/filter.png',
                  width: w * 0.1,
                  height: h * 0.07,
                ),
              ],
            ),
            SizedBox(
              height: h * 0.01,
            ),
            SizedBox(
              height: h * .73,
              child: ListView.separated(
                shrinkWrap: true,
                primary: true,
                itemBuilder: (context, index) => buildComplainCard(h: h, w: w),
                separatorBuilder: (context, index) => SizedBox(
                  height: h * 0.013,
                ),
                itemCount: 7,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildComplainCard({required double h, required double w}) => Container(
        height: 125,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 2),
                // ignore: use_full_hex_values_for_flutter_colors
                color: Color(0xff26000000),
                spreadRadius: 1,
                blurRadius: 2)
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/avatars.png',
                  fit: BoxFit.contain,
                  width: w * 0.08,
                  height: h * 0.06,
                ),
                SizedBox(
                  width: w * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        'From: Samaa Samir',
                        style: headingStyle.copyWith(
                          color: MyColors.mainColor,
                          fontFamily: 'SF Pro Display',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.005,
                    ),
                    Text(
                      'Ui/Ux Designer',
                      style: headingStyle.copyWith(
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor,
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  ' Today 11.30 Am',
                  style: headingStyle.copyWith(
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontFamily: 'Roboto',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.close,
                  color: Color(
                    0xff888888,
                  ),
                  size: 22,
                )
              ],
            ),
            SizedBox(
              height: h * 0.025,
            ),
            Row(
              children: [
                SizedBox(
                  width: w * .51,
                  child: Text.rich(TextSpan(
                      text:
                          'Sir, I am Samaa samir, ui/ux desginer I am writing to bring to your notice the poor maintenance ',
                      style: headingStyle.copyWith(
                          fontFamily: 'Roboto',
                          color: Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '.. see more',
                          style: headingStyle.copyWith(
                              fontFamily: 'Roboto',
                              color: Color(0xff696CFF),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ])),
                ),
                Container(
                  margin: EdgeInsets.only(top: h * 0.03, left: w * 0.04),
                  child: Row(
                    children: [
                      Container(
                        width: w * 0.14,
                        height: h * 0.032,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: MyColors.mainColor,
                            border: Border.all(color: MyColors.mainColor)),
                        child: Center(
                          child: Text(
                            'Respone',
                            style: headingStyle.copyWith(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.025,
                      ),
                      Container(
                        width: w * 0.14,
                        height: h * 0.032,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(color: MyColors.mainColor)),
                        child: Center(
                          child: Text(
                            'reject',
                            style: headingStyle.copyWith(
                              color: MyColors.mainColor,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
}
