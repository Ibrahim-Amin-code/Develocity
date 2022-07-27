// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/admin_cubit/admin_cubit.dart';
import 'package:develocity/business_logic/app_cubit/app_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/admins/update_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/drawer_widget.dart';

class AdminsScreeen extends StatefulWidget {
  const AdminsScreeen({Key? key}) : super(key: key);

  @override
  State<AdminsScreeen> createState() => _AdminsScreeenState();
}

class _AdminsScreeenState extends State<AdminsScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Admins',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          children: [
            BlocConsumer<AppCubit, AppState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        AppCubit.get(context).recentlyAdmins(
                            alladmmins: true, admminAdded: false);
                      },
                      child: Text(
                        'All',
                        style: headingStyle.copyWith(
                            fontFamily: 'SF Pro Display',
                            color: AppCubit.get(context).isAllAdmins
                                ? const Color(0xff696CFF)
                                : Color(0xff435971).withOpacity(0.5),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        AppCubit.get(context).recentlyAdmins(
                            alladmmins: false, admminAdded: true);
                      },
                      child: Text(
                        'Recently added',
                        style: headingStyle.copyWith(
                            fontFamily: 'SF Pro Display',
                            color: AppCubit.get(context).isRecentlyAdmins
                                ? const Color(0xff696CFF)
                                : Color(0xff435971).withOpacity(0.5),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/filter.png',
                        width: w * 0.1,
                        height: h * 0.07,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: h * 0.01,
            ),
            buildUsersRow(),
            SizedBox(
              height: h * 0.03,
            ),
            BlocConsumer<AdminCubit, AdminState>(
              listener: (context, state) {},
              builder: (context, state) {
                return ConditionalBuilder(
                  condition: state is! GetAdminLoadingState,
                  builder: (context) => SizedBox(
                    height: h * .65,
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: true,
                      itemBuilder: (context, index) => buildUsersDataRow(
                          id: AdminCubit.get(context)
                              .getAllAdminsModel
                              .data![index]
                              .id
                              .toString(),
                          adminName: AdminCubit.get(context)
                              .getAllAdminsModel
                              .data![index]
                              .name
                              .toString(),
                          email: AdminCubit.get(context)
                              .getAllAdminsModel
                              .data![index]
                              .email
                              .toString()),
                      separatorBuilder: (context, index) => SizedBox(
                        height: h * 0.01,
                      ),
                      itemCount: AdminCubit.get(context)
                          .getAllAdminsModel
                          .data!
                          .length,
                    ),
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildUsersRow() => Container(
        height: 30,
        decoration: BoxDecoration(
            color: MyColors.mainColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Name',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Email',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Action',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            // Text(
            //   'Action',
            //   style: headingStyle.copyWith(
            //       fontFamily: 'SF Pro Display',
            //       color: Colors.white,
            //       fontSize: 13,
            //       fontWeight: FontWeight.w500),
            // ),
          ],
        ),
      );

  Widget buildUsersDataRow({
    required String adminName,
    required String email,
    required String id,
  }) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Color(0xff696CFF).withOpacity(0.03))),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: w * 0.2,
              child: Text(
                adminName,
                textAlign: TextAlign.center,
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: w * 0.5,
              child: Text(
                email,
                textAlign: TextAlign.center,
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            // Text(
            //   'Cairo',
            //   style: headingStyle.copyWith(
            //       fontFamily: 'SF Pro Display',
            //       color: Color(0xff435971),
            //       fontSize: 13,
            //       fontWeight: FontWeight.w400),
            // ),
            buildUserRowCard(updateId: id, email: email, name: adminName)
          ],
        ),
      ),
    );
  }

  Widget buildUserRowCard(
          {required String updateId,
          required String name,
          required String email}) =>
      Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateAdminsScreeen(
                            email: email,
                            name: name,
                            updateId: updateId,
                          )));
            },
            child: Container(
              width: 40,
              decoration: const BoxDecoration(
                  color: Color(0xffE7E7FF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5))),
              child: Center(
                child: Image.asset(
                  'assets/images/edit-line.png',
                  width: 18,
                  height: 25,
                ),
              ),
            ),
          ),
          BlocConsumer<AdminCubit, AdminState>(
            listener: (context, state) {
              if (state is DeleteAdminSuccessState) {
                AdminCubit.get(context).getAllAdmins();
              }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  AdminCubit.get(context)
                      .deleteAdmin(context: context, id: updateId);
                },
                child: Container(
                  width: 40,
                  decoration: BoxDecoration(
                      color: Color(0xffFF3E1D).withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  child: Center(
                    child: Image.asset(
                      'assets/images/delete-out.png',
                      width: 18,
                      height: 25,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
