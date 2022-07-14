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
      height: height * 0.07,
      onPressed: () {
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Row(
          children: [
            Icon(
              icon,
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
                  .copyWith(color: MyColors.mainColor),
            ),
          ],
        ),
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
  int? maxLine;
  CustomTextFormField(
    this.controller,
    this.inputType,
    this.validate,
    this.label,
    this.hint,
    this.onTap,
    this.maxLine,
  );

  // CustomTextFormField(this.controller, this.inputType, this.validate,
  //     this.label, this.hint, this.onTap, this.maxLine);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              color: MyColors.mainColor,
            ),
          ),
        ),
        TextFormField(
          maxLines: maxLine,
          controller: controller,
          keyboardType: inputType,
          validator: (s) {
            return validate!(s);
          },
          onTap: () {
            onTap();
          },
          // maxLength: maxLine,

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 12.0,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              color: MyColors.hintColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color(0xff0F006EE9),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyColors.mainColor,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyColors.mainColor,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
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

class LogoutAlertDialog extends StatelessWidget {
  String title;
  String bodyText;
  String buttonText;
  Function buttonOnPressed;
  String cancelText;
  Function cancelOnPressed;

  LogoutAlertDialog(
    this.title,
    this.bodyText,
    this.buttonText,
    this.buttonOnPressed,
    this.cancelText,
    this.cancelOnPressed,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      elevation: 0.0,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              Checkbox(value: true, onChanged: (s) {}),
              Text(
                bodyText,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          SizedBox(
            height: height * 0.02,
            width: width,
          ),
          CustomButton(
              onPressed: () {
                buttonOnPressed();
              },
              text: buttonText),
          SizedBox(
            height: height * 0.005,
          ),
          TextButton(
              onPressed: () {
                cancelOnPressed();
              },
              child: Text(cancelText)),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        height: 1.0,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );
  }
}

class UserHomeItem extends StatelessWidget {
  const UserHomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: MyColors.mainColor,
      child: SizedBox(
        height: height * 0.2,
        width: width * 0.6,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.flag,
                  color: Colors.red,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                const Text('UI Element Design'),
                SizedBox(
                  width: width * 0.02,
                ),
                CircleAvatar(
                  backgroundColor: MyColors.mainColor.withOpacity(0.2),
                  child: const Icon(Icons.edit),
                  radius: 20,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              '4 New Updates',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: MyColors.mainColor),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: () {},
                  text: 'View',
                  width: double.minPositive,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                MaterialButton(
                  minWidth: double.minPositive,
                  height: 45.0,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: const Color(0xFFE9AE25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
