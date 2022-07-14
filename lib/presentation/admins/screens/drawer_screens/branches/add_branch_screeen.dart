// ignore_for_file: prefer_const_constructors

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/drawer_widget.dart';
import '../../profile/profile_components.dart';

class AddBranchScreeen extends StatefulWidget {
  const AddBranchScreeen({Key? key}) : super(key: key);

  @override
  State<AddBranchScreeen> createState() => _AddBranchScreeenState();
}

class _AddBranchScreeenState extends State<AddBranchScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    final _keyForm = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Branches',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Add new Branch',
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
                'Company Name *', 'Enter name', () {}, 1),
            SizedBox(
              height: h * 0.02,
            ),
            CustomTextFormField(emailController, TextInputType.emailAddress,
                () {}, 'Location *', 'Enter Location', () {}, 1),
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              width: w * 03,
              height: h * 0.27,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Mapsicle Map.png')),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: h * 0.04,
            ),
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
      ),
    );
  }
}
