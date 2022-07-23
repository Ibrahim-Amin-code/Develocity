// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/add_user/add_user_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/drawer_widget.dart';

class UsersScreeen extends StatefulWidget {
  const UsersScreeen({Key? key}) : super(key: key);

  @override
  State<UsersScreeen> createState() => _UsersScreeenState();
}

class _UsersScreeenState extends State<UsersScreeen> {
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
      body: BlocConsumer<AddUserCubit, AddUserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
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
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/filter.png',
                        width: w * 0.1,
                        height: h * 0.07,
                      ),
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
                ConditionalBuilder(
                  condition: state is! GetAdminUserLoadingState,
                  builder: (context) => SizedBox(
                    height: h * .65,
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: true,
                      itemBuilder: (context, index) => buildUsersRow(
                          id: AddUserCubit.get(context)
                              .getAdminUserModel
                              .data![index]
                              .id
                              .toString(),
                          branch: 'Cairo',
                          job: AddUserCubit.get(context)
                              .getAdminUserModel
                              .data![index]
                              .jobTitle
                              .toString(),
                          name: AddUserCubit.get(context)
                              .getAdminUserModel
                              .data![index]
                              .name
                              .toString()),
                      separatorBuilder: (context, index) => SizedBox(
                        height: h * 0.01,
                      ),
                      itemCount: AddUserCubit.get(context)
                          .getAdminUserModel
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

  Widget buildRequirmemtsRow() => Container(
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
              'Job',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Branch',
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
          ],
        ),
      );

  Widget buildUsersRow({
    required String name,
    required String job,
    required String id,
    required String branch,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              name,
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: w * 0.15,
              child: Text(
                job,
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
              width: w * 0.15,
              child: Text(
                branch,
                textAlign: TextAlign.center,
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            buildUserRowCard(id: id)
          ],
        ),
      ),
    );
  }

  Widget buildUserRowCard({required String id}) => Row(
        children: [
          // Container(
          //   width: 40,
          //   decoration: const BoxDecoration(
          //       color: Color(0xffE7E7FF),
          //       borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(5),
          //           topLeft: Radius.circular(5))),
          //   child: Center(
          //     child: Image.asset(
          //       'assets/images/edit-line.png',
          //       width: 18,
          //       height: 25,
          //     ),
          //   ),
          // ),
          BlocConsumer<AddUserCubit, AddUserState>(
            listener: (context, state) {
              if (state is DeleteAdminUserSuccessState) {
                AddUserCubit.get(context).getAdminUser();
              }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  AddUserCubit.get(context).deleteUser(id);
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
