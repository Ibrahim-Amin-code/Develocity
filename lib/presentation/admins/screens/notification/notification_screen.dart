import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.mainColor),
                child: const Center(
                    child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 18,
                )),
              ),
            ),
            SizedBox(
              width: w * 0.23,
            ),
            Text(
              'Notification',
              style: headingStyle.copyWith(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: h * 0.015,
        ),
        buildNotificationCard(
            h: h,
            w: w,
            image: 'assets/images/trend.png',
            text: 'See your statistic!',
            subText:
                'Hello Phillip, lets see your progress in 2020, and fix it',
            cardColor: const Color(0xffF1F7FE)),
        SizedBox(
          height: h * 0.015,
        ),
        buildNotificationCard(
            h: h,
            w: w,
            image: 'assets/images/right.png',
            text: 'UI Task less than 8 days',
            subText:
                'Phillip, your assignment is less than 8 days away from reaching',
            cardColor: Colors.white),
        SizedBox(
          height: h * 0.015,
        ),
        buildNotificationCard(
            h: h,
            w: w,
            image: 'assets/images/alert-outline (1).png',
            text: 'Edit Task less than 12 days',
            subText: 'Phillip, your assignment is less than 12 days away from ',
            cardColor: Color(0xffF1F7FE)),
        SizedBox(
          height: h * 0.015,
        ),
        buildNotificationCard(
            h: h,
            w: w,
            image: 'assets/images/alert-outline (1).png',
            text: 'Edit Task less than 12 days',
            subText: 'Phillip, your assignment is less than 12 days away from ',
            cardColor: Colors.white),
        SizedBox(
          height: h * 0.015,
        ),
        buildNotificationCard(
            h: h,
            w: w,
            image: 'assets/images/alert-outline (1).png',
            text: 'Edit Task less than 12 days',
            subText: 'Phillip, your assignment is less than 12 days away from ',
            cardColor: Colors.white),
        SizedBox(
          height: h * 0.015,
        ),
      ]),
    );
  }

  Widget buildNotificationCard({
    required double h,
    required double w,
    required String image,
    required String text,
    required String subText,
    required Color cardColor,
  }) =>
      Container(
        padding: const EdgeInsets.only(left: 20),
        height: h * 0.06,
        width: double.infinity,
        color: cardColor,
        child: Row(
          children: [
            Image.asset(
              image,
              height: 25,
              width: 25,
            ),
            SizedBox(
              width: w * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,
                    style: headingStyle.copyWith(
                        fontFamily: 'Poppins',
                        color: Color(0xff435971),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subText,
                  style: headingStyle.copyWith(
                      fontFamily: 'Poppins',
                      color: const Color(0xff474747),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      );
}
