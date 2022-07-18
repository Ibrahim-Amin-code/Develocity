// ignore_for_file: prefer_const_constructors

import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//'assets/images/msg.png'
Widget textFormField(
        {required TextEditingController? controller,
        FormFieldValidator<String>? validator,
        context,
        required bool obscureText,
        required String hintText,
        required String image,
        VoidCallback? onEditingComplete,
        FocusNode? focusNode,
        required TextInputType? keyboardType}) =>
    TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintText,
        hintStyle: headingStyle.copyWith(
            color: const Color(0xff9A9A9A),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins'),
        prefixIcon: Container(
          width: 48,
          margin: const EdgeInsets.only(right: 10),
          height: 58,
          decoration: BoxDecoration(
              color: MyColors.mainColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10))),
          child: Center(child: Image.asset(image)),
        ),
      ),
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      onEditingComplete: onEditingComplete,
      validator: validator,
    );

Widget socialCard({
  required String image,
  required GestureTapCallback? onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: MyColors.mainColor,
            )),
        child: Center(
            child: Image.asset(
          image,
          height: 30,
          width: 30,
        )),
      ),
    );

Widget socialCardSvg(
        {required GestureTapCallback? onTap, required String imageSvg}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: MyColors.mainColor,
            )),
        child: Center(child: SvgPicture.asset(imageSvg)),
      ),
    );
