// ignore_for_file: prefer_const_constructors

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/drawer_widget.dart';
import '../../profile/profile_components.dart';

class AddSectionScreeen extends StatefulWidget {
  const AddSectionScreeen({Key? key}) : super(key: key);

  @override
  State<AddSectionScreeen> createState() => _AddSectionScreeenState();
}

class _AddSectionScreeenState extends State<AddSectionScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    final _keyForm = GlobalKey<FormState>();
    final List<String> itemData = [
      'Deveovity1',
      'Deveovity2',
      'Deveovity3',
      'Deveovity4',
      'Deveovity5',
      'Deveovity6',
      'Deveovity7',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Section',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Add new Section',
            style: headingStyle.copyWith(
                fontFamily: 'SF Pro Display',
                fontSize: 20,
                color: Color(0xff435971),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: h * 0.04,
          ),
          CustomTextFormField(nameController, TextInputType.name, () {},
              'Section Name *', 'Enter name', () {}),
          SizedBox(
            height: h * 0.02,
          ),
          Text(
            'Company',
            style: headingStyle.copyWith(
                fontFamily: 'SF Pro Display',
                color: MyColors.mainColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          CustomDropDown(
            items: itemData,
            text: 'Select company',
          ),
          Spacer(),
          defaultButton(
              title: 'Submit',
              onPressed: () {},
              fontSize: 16,
              height: h * 0.06,
              width: w * 0.9,
              color: MyColors.mainColor,
              textColor: Colors.white)
        ]),
      ),
    );
  }
}
