import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/drawer_widget.dart';

class RequirementsScreen extends StatefulWidget {
  const RequirementsScreen({Key? key}) : super(key: key);

  @override
  State<RequirementsScreen> createState() => _RequirementsScreenState();
}

class _RequirementsScreenState extends State<RequirementsScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Users',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
            buildRequirmemtsRow(),
            SizedBox(
              height: h * 0.03,
            ),
            SizedBox(
              height: h * .65,
              child: ListView.separated(
                shrinkWrap: true,
                primary: true,
                itemBuilder: (context, index) => buildUsersRequirmemtsRow(),
                separatorBuilder: (context, index) => SizedBox(
                  height: h * 0.02,
                ),
                itemCount: 11,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRequirmemtsRow() => Container(
        height: 30,
        decoration: BoxDecoration(
            color: MyColors.mainColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Requirements',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Team',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Price',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'User',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Status',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );

  Widget buildUsersRequirmemtsRow() => Container(
        height: 30,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xff696CFF).withOpacity(0.3)),
                child: Center(
                  child: Text(
                    'View',
                    style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        color: Color(0xff006EE9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Text(
                'Backend',
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '180 LE',
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Hema',
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                height: 25,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xff64B429).withOpacity(0.3)),
                child: Center(
                  child: Text(
                    'Approve',
                    style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        color: Color(0xff64B429),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
