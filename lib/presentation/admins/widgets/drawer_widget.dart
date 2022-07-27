// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:develocity/business_logic/admin_profile_cubit/admin_profile_cubit.dart';
import 'package:develocity/business_logic/app_cubit/app_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/news/add_admin_news_screen.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/news/admin_news_screen.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/requirements/requirements_screen.dart';
import 'package:develocity/presentation/admins/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/network/cache_helper.dart';
import '../screens/admin_profile/admin_profile_screen.dart';
import '../screens/drawer_screens/admins/admins_screeen.dart';
import '../screens/drawer_screens/branches/branches_screen.dart';
import '../screens/drawer_screens/complaints/complaints_screen.dart';
import '../screens/drawer_screens/sections/sections_screeen.dart';
import '../screens/drawer_screens/users/users_screeens.dart';

Widget buildDrawerWidget({required context}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;

  return Container(
    width: w * 0.85,
    height: h,
    decoration:
        BoxDecoration(color: Theme.of(context).drawerTheme.backgroundColor),
    child: BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminProfileScreen()));
              },
              child: SizedBox(
                height: h * 0.14,
                child: DrawerHeader(
                  child: BlocConsumer<AdminProfileCubit, AdminProfileState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 70,
                              height: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.amber),
                              margin: EdgeInsets.only(right: w * 0.02),
                              child: customCachedNetworkImage(
                                  url: AdminProfileCubit.get(context)
                                      .getAdminProfileModel
                                      .data!
                                      .img
                                      .toString(),
                                  context: context,
                                  fit: BoxFit.cover)),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Text(
                                  AdminProfileCubit.get(context)
                                      .getAdminProfileModel
                                      .data!
                                      .name
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'SF Pro Display',
                                          color: MyColors.mainColor),
                                ),
                                SizedBox(
                                    // height: h * 0.005,
                                    ),
                                Text(
                                  AdminProfileCubit.get(context)
                                      .getAdminProfileModel
                                      .data!
                                      .email
                                      .toString(),
                                  style: headingStyle.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF Pro Display',
                                      color: Theme.of(context)
                                          .bottomNavigationBarTheme
                                          .unselectedItemColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: h * 0.02,
            // ),
            buildRowInDrawer(
                imageColor: (AppCubit.get(context).color == 'Dashboard')
                    ? Colors.white
                    : Color(0xff535763),
                title: 'Dashboard',
                color: (AppCubit.get(context).color == 'Dashboard')
                    ? MyColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                image: 'assets/images/dash2.png',
                onPress: () {
                  AppCubit.get(context).changeColor('Dashboard');
                }),

            SizedBox(
              height: h * 0.01,
            ),
            buildRowInDrawer(
                imageColor: (AppCubit.get(context).color == 'Admins')
                    ? Colors.white
                    : Color(0xff535763),
                title: 'Admins',
                color: (AppCubit.get(context).color == 'Admins')
                    ? MyColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                image: 'assets/images/Vector (1).png',
                onPress: () {
                  AppCubit.get(context).changeColor('Admins');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminsScreeen()));
                }),

            SizedBox(
              height: h * 0.01,
            ),
            buildRowInDrawer(
                imageColor: (AppCubit.get(context).color == 'Branches')
                    ? Colors.white
                    : Color(0xff535763),
                title: 'Branches',
                color: (AppCubit.get(context).color == 'Branches')
                    ? MyColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                image: 'assets/images/branches.png',
                onPress: () {
                  AppCubit.get(context).changeColor('Branches');

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BranchesScreeen()));
                }),
            SizedBox(
              height: h * 0.01,
            ),
            buildRowInDrawer(
                imageColor: (AppCubit.get(context).color == 'Sections')
                    ? Colors.white
                    : Color(0xff535763),
                color: (AppCubit.get(context).color == 'Sections')
                    ? MyColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                title: 'Sections',
                image: 'assets/images/sections.png',
                onPress: () {
                  AppCubit.get(context).changeColor('Sections');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SectionsScreeen()));
                }),
            SizedBox(
              height: h * 0.01,
            ),

            buildRowInDrawer(
                imageColor: (AppCubit.get(context).color == 'Users')
                    ? Colors.white
                    : Color(0xff535763),
                title: 'Users',
                color: (AppCubit.get(context).color == 'Users')
                    ? MyColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                image: 'assets/images/admins.png',
                onPress: () {
                  print('rrrrrrrrrr');
                  AppCubit.get(context).changeColor('Users');

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UsersScreeen()));
                }),

            SizedBox(
              height: h * 0.01,
            ),

            buildRowInDrawer(
                title: 'Complaints',
                imageColor: (AppCubit.get(context).color == 'Complaints')
                    ? Colors.white
                    : Color(0xff535763),
                color: (AppCubit.get(context).color == 'Complaints')
                    ? MyColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                image: 'assets/images/comp.png',
                onPress: () {
                  AppCubit.get(context).changeColor('Complaints');

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComplaintsScreen()));
                }),

            SizedBox(
              height: h * 0.01,
            ),
            buildRowInDrawer(
                imageColor: (AppCubit.get(context).color == 'Requirements')
                    ? Colors.white
                    : Color(0xff535763),
                title: 'Requirements',
                color: (AppCubit.get(context).color == 'Requirements')
                    ? MyColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                image: 'assets/images/requ.png',
                onPress: () {
                  AppCubit.get(context).changeColor('Requirements');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequirementsScreen()));
                }),

            SizedBox(
              height: h * 0.01,
            ),
            buildRowInDrawer(
                imageColor: (AppCubit.get(context).color == 'News')
                    ? Colors.white
                    : Color(0xff535763),
                title: 'News',
                color: (AppCubit.get(context).color == 'News')
                    ? MyColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                image: 'assets/images/requ.png',
                onPress: () {
                  AppCubit.get(context).changeColor('News');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminNewsScreen()));
                }),
            SizedBox(
              height: h * 0.03,
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

            BlocConsumer<AppCubit, AppState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  height: h * 0.05,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: const Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.pop(context);
                          prefs.setBool('isDark', false).then((value) {
                            AppCubit.get(context)
                                .changeAppMode(fromShared: false);
                          });
                        },
                        child: Container(
                          width: w * 0.36,
                          height: h * 0.04,
                          decoration: BoxDecoration(
                              color: (prefs.getBool('isDark') == false)
                                  ? Colors.white
                                  : Colors.transparent,
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
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pop(context);

                          prefs.setBool('isDark', true).then((value) {
                            AppCubit.get(context)
                                .changeAppMode(fromShared: true);
                          });
                        },
                        child: Container(
                          width: w * 0.36,
                          height: h * 0.04,
                          decoration: BoxDecoration(
                              color: (prefs.getBool('isDark') == true)
                                  ? Colors.white
                                  : Colors.transparent,
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
                                  'Dark',
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
                      )
                    ],
                  ),
                );
              },
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
        );
      },
    ),
  );
}

Widget buildRowInDrawer({
  required String image,
  required String title,
  required GestureTapCallback onPress,
  Widget? widget,
  required Color color,
  required Color imageColor,
  // required Color textColor,
}) {
  // return ListTileTheme(
  //   selectedColor: MyColors.mainColor,
  //   selectedTileColor: MyColors.mainColor,
  //   child: ListTile(
  //     onTap: onPress,
  //     selectedTileColor: Colors.blue,
  //     leading: Image.asset(image),
  //     title: Text(
  //       title,
  //       style: const TextStyle(
  //         color: Color(0xff535763),
  //         fontWeight: FontWeight.w600,
  //         fontFamily: 'SF Pro Display',
  //         fontSize: 16,
  //       ),
  //     ),
  //     selectedColor: MyColors.mainColor,
  //   ),
  // );

  return InkWell(
    onTap: onPress,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset(
                image,
                color: imageColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title, //Color(0xff535763)
                style: TextStyle(
                  color: imageColor,
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
                width: 20,
                height: 12,
              ),
            )),
      ],
      elevation: 0.0,
      // backgroundColor: Colors.white,
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
          child: Icon(
            Icons.arrow_back,
            size: 25,
            color: MyColors.mainColor,
          )),
    );
