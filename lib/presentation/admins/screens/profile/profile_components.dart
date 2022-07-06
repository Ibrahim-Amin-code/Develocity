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
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}


