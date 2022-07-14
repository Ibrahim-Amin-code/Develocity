import 'package:develocity/presentation/admins/screens/bottom_nav/layout.dart';
import 'package:flutter/material.dart';

import '../../../constants/core/colors.dart';

AppBar customTaskAppBar(
        {context,
        required double w,
        required double h,
        required String title}) =>
    AppBar(
      elevation: 0,
      backgroundColor: MyColors.mainColor,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.025),
          child: Image.asset(
            'assets/images/editTask.png',
            width: 35,
            height: 35,
          ),
        ),
      ],
      title: Center(
        child: Text(
          title,
          style: headingStyle.copyWith(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      leading: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => LayoutScreen(index: 0))),
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Icon(
            Icons.arrow_back,
            size: 20,
            color: MyColors.mainColor,
          ),
        ),
      ),
    );
