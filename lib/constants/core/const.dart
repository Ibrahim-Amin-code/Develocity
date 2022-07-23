// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/model/admins/get_branch/get_branch_model.dart';
import 'package:develocity/model/admins/get_section/get_section_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'colors.dart';

Future<bool> showTaskPopup({context, required String title}) async {
  return await showDialog(
        useSafeArea: true,
        useRootNavigator: true,
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 20,
          ),
          elevation: 0.0,
          actions: [
            Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: headingStyle.copyWith(
                      color: MyColors.mainColor,
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                    title: 'Back',
                    onPressed: () {},
                    fontSize: 16,
                    height: 40,
                    width: 325,
                    color: MyColors.mainColor,
                    textColor: Colors.white),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ) ??
      false;
}

AppBar csutomAppBar({
  context,
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      this.fillColor,
      this.onSave,
      this.borderColor,
      this.validator})
      : super(key: key);
  final List? items;
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  var chosenValue;

  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Theme.of(context).cardColor),
        color: widget.fillColor,
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
        value: chosenValue,
        items: widget.items?.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              'value.name.toString()',
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
        onChanged: (dynamic value) {
          setState(() {
            chosenValue = value;
            print(chosenValue.id.toString());
            // prefs.setString('branchId', chosenValue.id.toString());
          });
          // _chosenValue = value;.id
        },
        // onSaved: widget.onSave,
        // validator: widget.validator,
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////
class CustomDropDownBranch extends StatefulWidget {
  static var chosenValue;
  const CustomDropDownBranch(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor,
      this.onSave,
      this.borderColor,
      this.validator})
      : super(key: key);
  final List? items;
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CustomDropDownBranchState createState() => _CustomDropDownBranchState();
}

class _CustomDropDownBranchState extends State<CustomDropDownBranch> {
  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Theme.of(context).cardColor),
        color: widget.fillColor,
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
        value: CustomDropDownBranch.chosenValue,
        items: widget.items?.map<DropdownMenuItem<Data>>((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value.name.toString(),
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
        onChanged: (dynamic value) {
          setState(() {
            CustomDropDownBranch.chosenValue = value;
            print(CustomDropDownBranch.chosenValue.id.toString());
            prefs.setString(
                'branchId', CustomDropDownBranch.chosenValue.id.toString());
          });
          // _chosenValue = value;.id
        },
        // onSaved: widget.onSave,
        // validator: widget.validator,
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////

class CustomDropDownSection extends StatefulWidget {
  static var chosenValue;
  const CustomDropDownSection(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor,
      this.onSave,
      this.borderColor,
      this.validator})
      : super(key: key);
  final List? items;
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CustomDropDownSectionState createState() => _CustomDropDownSectionState();
}

class _CustomDropDownSectionState extends State<CustomDropDownSection> {
  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Theme.of(context).cardColor),
        color: widget.fillColor,
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
        value: CustomDropDownSection.chosenValue,
        items: widget.items?.map<DropdownMenuItem<SectionData?>>((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value.name.toString(),
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
        onChanged: (dynamic value) {
          setState(() {
            CustomDropDownSection.chosenValue = value;
            print(CustomDropDownSection.chosenValue.id.toString());
            prefs.setString(
                'sectionId', CustomDropDownSection.chosenValue.id.toString());
          });
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////
snackBar({required String? message, context, Color? color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message!),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    ),
  );
}

////////////////////////////////////////////////////////////////////
late BitmapDescriptor markerImage;
mapIcon() async {
  markerImage = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(), 'assets/images/noun-pin.png');
}
//////////////////////////////////////////////////////////////////////