import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
              'Profile',
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
                          Stack(
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
                              Container(
                                color: MyColors.mainColor,
                                margin: EdgeInsets.only(
                                  left: w * .44,
                                  top: h * .08,
                                ),
                                child: Image.asset(
                                  'assets/images/pin.png',
                                  // color: MyColors.mainColor,

                                  width: w * 0.078,
                                  height: h * 0.04,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: w * .29),
                              child: Text(
                                'Samaa Samir',
                                style: headingStyle.copyWith(
                                    color: MyColors.mainColor,
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 120),
                              child: Text(
                                'UI UX Designer',
                                style: headingStyle.copyWith(
                                    color: const Color(0xff4A4646),
                                    fontSize: 12,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500),
                              )),
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
              height: h * 0.07,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.1),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfileScreen()));
                },
                child: SizedBox(
                  height: h * 0.05,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/edit.png',
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Text(
                        'Settings',
                        style: headingStyle.copyWith(
                          fontSize: 12,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/out.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Logout',
                        style: headingStyle.copyWith(
                          fontSize: 12,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
