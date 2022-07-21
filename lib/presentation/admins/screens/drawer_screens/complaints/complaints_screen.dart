// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/user_complain_for_admin_cubit/user_complain_for_admin_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/drawer_widget.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Complaints',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: BlocConsumer<UserComplainForAdminCubit, UserComplainForAdminState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'All',
                      style: headingStyle.copyWith(
                          fontFamily: 'SF Pro Display',
                          color: const Color(0xff696CFF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    Text(
                      'Recently added',
                      style: headingStyle.copyWith(
                          fontFamily: 'SF Pro Display',
                          color: const Color(0xff435971).withOpacity(0.5),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/filter.png',
                      width: w * 0.1,
                      height: h * 0.07,
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                ConditionalBuilder(
                  condition: state is! UserComplainForAdminLoadingState,
                  builder: (context) => SizedBox(
                    height: h * .73,
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: true,
                      itemBuilder: (context, index) => buildComplainCard(
                          h: h,
                          w: w,
                          title: UserComplainForAdminCubit.get(context)
                              .usersComplaintsModelForAdmin
                              .data![index]
                              .title
                              .toString(),
                          message: UserComplainForAdminCubit.get(context)
                              .usersComplaintsModelForAdmin
                              .data![index]
                              .message
                              .toString(),
                          type: UserComplainForAdminCubit.get(context)
                              .usersComplaintsModelForAdmin
                              .data![index]
                              .type
                              .toString(),
                          userID: UserComplainForAdminCubit.get(context)
                              .usersComplaintsModelForAdmin
                              .data![index]
                              .taskId
                              .toString()),
                      separatorBuilder: (context, index) => SizedBox(
                        height: h * 0.013,
                      ),
                      itemCount: UserComplainForAdminCubit.get(context)
                          .usersComplaintsModelForAdmin
                          .data!
                          .length,
                    ),
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildComplainCard({
    required double h,
    required double w,
    required String title,
    required String message,
    required String type,
    required String userID,
  }) =>
      Container(
        height: h * 0.19,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 2),
                // ignore: use_full_hex_values_for_flutter_colors
                color: Color(0xff26000000),
                spreadRadius: 1,
                blurRadius: 2)
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/avatars.png',
                      fit: BoxFit.contain,
                      width: w * 0.08,
                      height: h * 0.06,
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'From User ID: $userID',
                            style: headingStyle.copyWith(
                              color: MyColors.mainColor,
                              fontFamily: 'SF Pro Display',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Text(
                          'Type: $type',
                          style: headingStyle.copyWith(
                            color: Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor,
                            fontFamily: 'SF Pro Display',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      ' Today 11.30 Am',
                      style: headingStyle.copyWith(
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor,
                        fontFamily: 'Roboto',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.close,
                      color: Color(
                        0xff888888,
                      ),
                      size: 22,
                    )
                  ],
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                Row(children: [
                  //     SizedBox(
                  //   width: w * .51,
                  //   child: Text.rich(TextSpan(
                  //       text:
                  //           message,
                  //       style: headingStyle.copyWith(
                  //           fontFamily: 'Roboto',
                  //           color: Theme.of(context)
                  //               .bottomNavigationBarTheme
                  //               .unselectedItemColor,
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w400),
                  //       children: <InlineSpan>[
                  //         TextSpan(
                  //           text: '.. see more',
                  //   style: headingStyle.copyWith(
                  //       fontFamily: 'Roboto',
                  //       color: Color(0xff696CFF),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400),
                  // )
                  //       ])),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'title : $title',
                        style: headingStyle.copyWith(
                            fontFamily: 'Roboto',
                            color: MyColors.mainColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.37,
                            child: Text(
                              'message : $message ',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: headingStyle.copyWith(
                                  height: 1.2,
                                  fontFamily: 'Roboto',
                                  color: Color(0xff696CFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.13,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: h * 0.02, left: w * 0.04),
                            child: Row(
                              children: [
                                Container(
                                  width: w * 0.14,
                                  height: h * 0.032,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: MyColors.mainColor,
                                      border: Border.all(
                                          color: MyColors.mainColor)),
                                  child: Center(
                                    child: Text(
                                      'Respone',
                                      style: headingStyle.copyWith(
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.025,
                                ),
                                Container(
                                  width: w * 0.14,
                                  height: h * 0.032,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: MyColors.mainColor)),
                                  child: Center(
                                    child: Text(
                                      'reject',
                                      style: headingStyle.copyWith(
                                        color: MyColors.mainColor,
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ]),
              ],
            )),
      );
}
