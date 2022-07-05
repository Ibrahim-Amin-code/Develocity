import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

AppBar csutomAppBar({
  required String image,
  required String image2,
  required String text,
}) =>
    AppBar(
      actions: [
        Image.asset(image),
      ],
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          text,
          style: headingStyle.copyWith(
              color: MyColors.mainColor,
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      leading: Image.asset(image2),
    );

customCachedNetworkImage(
    {required String url, required context, required BoxFit fit}) {
  try {
    // ignore: unnecessary_null_comparison
    if (url == null || url == "") {
      return const Icon(
        Icons.error,
        color: Color(0xffAB0D03),
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (context, url) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.height * 0.02,
                      child: Image.asset(
                        "assets/icons/LOGO.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                errorWidget: (context, url, error) {
                  // ignore: prefer_const_constructors
                  return Icon(
                    Icons.error,
                    color: const Color(0xffAB0D03),
                  );
                })
            : const Icon(
                Icons.error,
                color: Color(0xffAB0D03),
              ),
      );
    }
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
  }
}

////////////////////////////////////////////////////

