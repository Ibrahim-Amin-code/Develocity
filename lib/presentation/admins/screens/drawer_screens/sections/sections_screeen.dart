// ignore_for_file: prefer_const_constructors

import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/drawer_widget.dart';
import 'add_section_screeen.dart';

class SectionsScreeen extends StatefulWidget {
  const SectionsScreeen({Key? key}) : super(key: key);

  @override
  State<SectionsScreeen> createState() => _SectionsScreeenState();
}

class _SectionsScreeenState extends State<SectionsScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Sections',
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
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/filter.png',
                    width: w * 0.1,
                    height: h * 0.07,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.01,
            ),
            buildSectionRow(),
            SizedBox(
              height: h * 0.03,
            ),
            SizedBox(
              height: h * .65,
              child: ListView.separated(
                shrinkWrap: true,
                primary: true,
                itemBuilder: (context, index) => buildSectionDataRow(),
                separatorBuilder: (context, index) => SizedBox(
                  height: h * 0.01,
                ),
                itemCount: 11,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSectionRow() => Container(
        height: 30,
        decoration: BoxDecoration(
            color: MyColors.mainColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Section Name',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Location',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Action',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );

  Widget buildSectionDataRow() => Container(
        height: 35,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(color: Color(0xff696CFF).withOpacity(0.03))),
        child: SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Develocity',
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Heliopolis-Cairio',
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              buildSectionRowCard()
            ],
          ),
        ),
      );

  Widget buildSectionRowCard() => Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 40,
            decoration: const BoxDecoration(
                color: Color(0xffE7E7FF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5))),
            child: Center(
              child: Image.asset(
                'assets/images/edit-line.png',
                width: 18,
                height: 25,
              ),
            ),
          ),
          Container(
            width: 40,
            decoration: BoxDecoration(
                color: Color(0xffFF3E1D).withOpacity(0.3),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5))),
            child: Center(
              child: Image.asset(
                'assets/images/delete-out.png',
                width: 18,
                height: 25,
              ),
            ),
          ),
        ],
      );
}
