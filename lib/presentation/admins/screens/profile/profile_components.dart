import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';

class CardProfileInfo extends StatelessWidget {
  String text;
  IconData icon;

  CardProfileInfo({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: MyColors.mainColor,
          size: 16.0,
        ),
        SizedBox(
          width: width * 0.01,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

class MenuProfileItems extends StatelessWidget {
  String text;
  IconData icon;
  Function onTap;

  MenuProfileItems({
    required this.onTap,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialButton(
      height: height*0.07,
      onPressed: () {
        onTap();
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.0,
            color: MyColors.mainColor,
          ),
          SizedBox(
            width: width * 0.05,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  Function onPressed;
  double? height = 45;
  double? width;
  Color? color;
  double? radius;
  String text;

  CustomButton({
    required this.onPressed,
    this.height,
    this.color,
    this.width,
    this.radius,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? double.infinity,
      height: height ?? 45.0,
      onPressed: () {
        onPressed();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.0),
      ),
      color: color ?? MyColors.mainColor,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14.0,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  Function? validate;
  Function onTap;
  String label;
  String hint;

  CustomTextFormField(
    this.controller,
    this.inputType,
    this.validate,
    this.label,
    this.hint,
    this.onTap,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(label,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            color: MyColors.mainColor,
          ),),
        ),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          validator: (s) {
            return validate!(s);
          },
          onTap: () {
            onTap();
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 12.0,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              color: MyColors.hintColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.hintColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.mainColor,
                width: 2.0,
              ),
            ),
            focusedErrorBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.mainColor,
                width: 2.0,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
