// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/user_requirments_for_admin_cubit/user_requirments_for_admin_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/drawer_widget.dart';

class RequirementsScreen extends StatefulWidget {
  const RequirementsScreen({Key? key}) : super(key: key);

  @override
  State<RequirementsScreen> createState() => _RequirementsScreenState();
}

class _RequirementsScreenState extends State<RequirementsScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Users',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: BlocConsumer<UserRequirmentsForAdminCubit,
          UserRequirmentsForAdminState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                buildRequirmemtsRow(),
                SizedBox(
                  height: h * 0.03,
                ),
                SizedBox(
                  height: h * .65,
                  child: ListView.separated(
                      shrinkWrap: true,
                      primary: true,
                      itemBuilder: (context, index) => buildUsersRequirmemtsRow(
                            jobTitle: 'jobTitle',
                            // UserRequirmentsForAdminCubit.get(context)
                            //     .usersRequirementsModelForAdmin
                            //     .data![index]
                            //     .user!
                            //     .jobTitle
                            //     .toString(),
                            price: 'Price',
                            // UserRequirmentsForAdminCubit.get(context)
                            //     .usersRequirementsModelForAdmin
                            //     .data![index]
                            //     .price
                            //     .toString(),
                            user: 'name',
                            // UserRequirmentsForAdminCubit.get(context)
                            //     .usersRequirementsModelForAdmin
                            //     .data![index]
                            //     .user!
                            //     .name
                            //     .toString(),
                            status: 'status',
                            // UserRequirmentsForAdminCubit.get(context)
                            //     .usersRequirementsModelForAdmin
                            //     .data![index]
                            //     .status
                            //     .toString()
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: h * 0.02,
                          ),
                      itemCount: 6
                      // UserRequirmentsForAdminCubit.get(context)
                      //     .usersRequirementsModelForAdmin
                      //     .data!
                      //     .length,
                      ),
                ),

                // ConditionalBuilder(
                //   condition: state is! UserRequirmentsForAdminLoadingState,
                //   builder: (context) => Container(),

                //   fallback: (context) =>
                //       Center(child: CircularProgressIndicator()),
                // )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildRequirmemtsRow() => Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: MyColors.mainColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Requirements',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Team',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Price',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'User',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Status',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );

  Widget buildUsersRequirmemtsRow({
    required String jobTitle,
    required String price,
    required String user,
    required String status,
  }) =>
      Container(
        height: 30,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 25,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xff696CFF).withOpacity(0.3)),
                child: Center(
                  child: Text(
                    'View',
                    style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        color: Color(0xff006EE9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Text(
                jobTitle,
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                price,
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                user,
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                height: 25,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xff64B429).withOpacity(0.3)),
                child: Center(
                  child: Text(
                    status,
                    style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        color: Color(0xff64B429),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
