import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../constants/clip_path.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 27,
                  )),
            ),
          ],
          elevation: 0.0,
          backgroundColor: MyColors.mainColor,
          title: Center(
            child: Text(
              'Edit Profile',
              style: headingStyle.copyWith(
                  color: Colors.white,
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          leading: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_back,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: h * .16,
                    color: MyColors.mainColor,
                  ),
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: h * 0.06),
                        height: h * .23,
                        width: w * .9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff1A006EE9).withOpacity(0.3),
                              blurRadius: 2,
                              offset: const Offset(0, 2), // Shadow position
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(left: w * .28),
                            width: w * .22,
                            height: h * 0.12,
                            decoration: BoxDecoration(
                                color: MyColors.mainColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: MyColors.mainColor,
                                ),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profile11.png'))),
                          ),
                          SizedBox(
                            height: h * 0.018,
                          ),
                          defaultButton(
                              margin: EdgeInsets.only(left: w * .28),
                              title: 'change picture',
                              onPressed: () {},
                              fontSize: 14,
                              height: 35,
                              width: 125,
                              color: MyColors.mainColor,
                              textColor: Colors.white),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          SizedBox(
                              width: 250,
                              height: h * 0.05,
                              child: Container(
                                margin:
                                    EdgeInsets.symmetric(horizontal: w * 0.06),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/locationN.png',
                                      height: 20,
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width: h * 0.01,
                                    ),
                                    Text(
                                      'Mansoura , Egypt',
                                      style: headingStyle.copyWith(
                                          fontSize: 12,
                                          fontFamily: 'SF Pro Display',
                                          color: const Color(0xff4A4646)),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                              width: 250,
                              height: h * 0.04,
                              child: Container(
                                margin:
                                    EdgeInsets.symmetric(horizontal: w * 0.06),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/bag.png',
                                      height: 20,
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width: w * 0.02,
                                    ),
                                    Text(
                                      '2653 Task Completed',
                                      style: headingStyle.copyWith(
                                          fontSize: 12,
                                          fontFamily: 'SF Pro Display',
                                          color: const Color(0xff4A4646)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                child: textFormField(
                    controller: nameController,
                    obscureText: false,
                    hintText: 'type name',
                    image: '',
                    keyboardType: TextInputType.name)),
            SizedBox(
              height: h * 0.03,
            ),
          ],
        ));
  }
}
