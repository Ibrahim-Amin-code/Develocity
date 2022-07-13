// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

AppBar csutomAppBar({
  required String image,
  required String image2,
  required String text,
  required GestureTapCallback? onTap,
  required GestureTapCallback? onTap1,
}) =>
    AppBar(
      actions: [
        InkWell(onTap: onTap1, child: Image.asset(image)),
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
      leading: InkWell(onTap: onTap, child: Image.asset(image2)),
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
///

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor = Colors.white,
      this.onSave,
      this.borderColor,
      this.validator})
      : super(key: key);
  final List<String>? items;
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _chosenValue;

  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: (widget.borderColor == null)
            ? Border.all(color: Color(0xff05006EE9))
            : Border.all(color: widget.borderColor!),
        color: widget.fillColor!,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonFormField(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: MyColors.mainColor,
          size: 28,
        ),
        iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: _chosenValue,
        items: widget.items?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: headingStyle.copyWith(
                  color: Color(0xffC4C4C4),
                  fontFamily: 'SF Pro Display',
                  fontSize: 14),
            ),
          );
        }).toList(),
        hint: Text(
          widget.text,
          style: headingStyle.copyWith(
              color: Color(0xffC4C4C4),
              fontFamily: 'SF Pro Display',
              fontSize: 14),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
          });
          // _chosenValue = value;
        },
        onSaved: widget.onSave,
        validator: widget.validator,
      ),
    );
  }
}
