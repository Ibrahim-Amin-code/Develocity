import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/requirements/requirements_screen.dart';
import 'package:develocity/presentation/admins/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../screens/drawer_screens/complaints/complaints_screen.dart';

Widget buildDrawerWidget({required context}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;

  return Container(
    width: w * 0.85,
    height: h,
    decoration: const BoxDecoration(color: Colors.white),
    child: ListView(
      children: [
        InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen())),
          child: SizedBox(
            height: h * 0.1,
            child: DrawerHeader(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                      margin: EdgeInsets.only(right: w * 0.02),
                      child: Image.asset('assets/images/81.png')),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abdelaziz Bin Fahd',
                          style: headingStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF Pro Display',
                              color: const Color(0xff1A1B2D)),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'ashfaksayem@gmail.com',
                          style: headingStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF Pro Display',
                              color: const Color(0xff535763)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: h * 0.025,
        ),
        buildRowInDrawer(
            title: 'Dashboard',
            image: 'assets/images/dash2.png',
            onPress: () {}),
        SizedBox(
          height: h * 0.04,
        ),
        buildRowInDrawer(
            title: 'Admins',
            image: 'assets/images/Vector (1).png',
            onPress: () {}),
        SizedBox(
          height: h * 0.04,
        ),
        buildRowInDrawer(
            title: 'Branches',
            image: 'assets/images/branches.png',
            onPress: () {}),
        SizedBox(
          height: h * 0.04,
        ),
        buildRowInDrawer(
            title: 'Sections',
            image: 'assets/images/sections.png',
            onPress: () {}),
        SizedBox(
          height: h * 0.04,
        ),

        buildRowInDrawer(
            title: 'Users', image: 'assets/images/admins.png', onPress: () {}),
        SizedBox(
          height: h * 0.04,
        ),
        buildRowInDrawer(
            title: 'Complaints',
            image: 'assets/images/comp.png',
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComplaintsScreen()));
            }),
        SizedBox(
          height: h * 0.04,
        ),
        buildRowInDrawer(
            title: 'Requirements',
            image: 'assets/images/requ.png',
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RequirementsScreen()));
            }),
        SizedBox(
          height: h * 0.17,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xffE5E5E5),
          ),
        ),
        Image.asset('assets/images/Nav item.png'),

        Container(
          height: h * 0.05,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: w * 0.36,
                height: h * 0.04,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.light_mode,
                        color: Color(0xff535763),
                      ),
                      Text(
                        'Light',
                        style: headingStyle.copyWith(
                            color: const Color(0xff535763),
                            fontFamily: 'SF Pro Display',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: w * 0.36,
                height: h * 0.04,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.dark_mode_outlined,
                        color: Color(0xff535763),
                      ),
                      Text(
                        'Light',
                        style: headingStyle.copyWith(
                            color: const Color(0xff535763),
                            fontFamily: 'SF Pro Display',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        // (prefs.getBool("is_login") == false)
        //     ? SizedBox(
        //         height: h * 0.05,
        //       )
        //     : const SizedBox(),
        // (prefs.getBool("is_login") == false)
        //     ? Padding(
        //         padding: EdgeInsets.symmetric(horizontal: w * 0.15),
        //         child: defaultButton(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     blurRadius: 5,
        //     offset: const Offset(0, 3), // Shadow position
        //   ),
        // ],
        //           title: LocaleKeys.Login.tr(),
        //           onPressed: () {
        //             Navigator.pushReplacement(context,
        //                 MaterialPageRoute(builder: (context) => LoginScreen()));
        //           },
        //           fontSize: 15,
        //           height: h * 0.055,
        //           width: 150,
        //           color: const Color(0xff3A0CA3),
        //           textColor: Colors.white,
        //         ),
        //       )
        //     : Container(),
        SizedBox(
          height: h * 0.02,
        ),
        // (prefs.getBool("is_login") == false)
        //     ?
        //     Padding(
        //         padding: EdgeInsets.symmetric(horizontal: w * 0.15),
        //         child: defaultButton(
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey.withOpacity(0.3),
        //               blurRadius: 8,
        //               offset: const Offset(2, 5), // Shadow position
        //             ),
        //           ],
        //           title: LocaleKeys.SignUp.tr(),
        //           onPressed: () {
        //             Navigator.pushReplacement(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => SignUpScreen()));
        //           },
        //           fontSize: 15,
        //           height: h * 0.055,
        //           width: 150,
        //           color: Colors.white,
        //           textColor: const Color(0xff3A0CA3),
        //         ),
        //       )
        //     : Padding(
        //         padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        //         child: Row(
        //           children: [
        //             InkWell(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => UserProfileScreen()));
        //               },
        //               child: CircleAvatar(
        //                 radius: w * 0.065,
        //                 backgroundColor: MyColors.mainColor,
        //                 child: CircleAvatar(
        //                   radius: w * 0.06,
        //                   backgroundColor: Colors.white,
        //                   backgroundImage: const AssetImage(''),
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               width: w * 0.02,
        //             ),
        //             Text(
        //               // prefs.getString('firstName').toString() + " " + prefs.getString('lastName').toString()
        //               'hemaaaa'
        //               ,
        //               style: headingStyle.copyWith(
        //                   color: Colors.black,
        //                   fontSize: w * 0.03,
        //                   fontWeight: FontWeight.w400),
        //             )
        //           ],
        //         ),
        //       ),
      ],
    ),
  );
}

Widget buildRowInDrawer({
  required String image,
  required String title,
  required GestureTapCallback onPress,
  Widget? widget,
}) {
  return InkWell(
    onTap: onPress,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff535763),
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro Display',
              fontSize: 16,
            ),
          ),
          const Spacer(),
          (widget != null) ? widget : const SizedBox(),
        ],
      ),
    ),
  );
}

AppBar csutomAppBarInDrawers({
  required String image,
  required String image2,
  required String text,
  required GestureTapCallback? onTap,
  required GestureTapCallback? onTap1,
}) =>
    AppBar(
      actions: [
        InkWell(
            onTap: onTap1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                image2,
                width: 25,
                height: 12,
              ),
            )),
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
      leading: InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Image.asset(
              image,
              height: 0,
              width: 0,
            ),
          )),
    );
