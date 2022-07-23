// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/branch_cubit/branch_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/branches/update_branch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/drawer_widget.dart';

class BranchesScreeen extends StatefulWidget {
  const BranchesScreeen({Key? key}) : super(key: key);

  @override
  State<BranchesScreeen> createState() => _BranchesScreeenState();
}

class _BranchesScreeenState extends State<BranchesScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocConsumer<BranchCubit, BranchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: Colors.white,
          appBar: csutomAppBarInDrawers(
              image: 'assets/images/arrow.png',
              image2: 'assets/images/search.png',
              text: 'Branches',
              onTap: () {
                Navigator.pop(context);
              },
              onTap1: () {}),
          body: Padding(
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
                buildBranchRow(),
                SizedBox(
                  height: h * 0.03,
                ),
                ConditionalBuilder(
                  condition: state is! GetBranchLoadingState,
                  builder: (context) => SizedBox(
                    height: h * .65,
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: true,
                      itemBuilder: (context, index) => buildBranchDataRow(
                        id: BranchCubit.get(context)
                            .branchModel
                            .data![index]
                            .id
                            .toString(),
                        branchLoaction: BranchCubit.get(context)
                            .branchModel
                            .data![index]
                            .location
                            .toString(),
                        branchName: BranchCubit.get(context)
                            .branchModel
                            .data![index]
                            .name
                            .toString(),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: h * 0.01,
                      ),
                      itemCount:
                          BranchCubit.get(context).branchModel.data!.length,
                    ),
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBranchRow() => Container(
        height: 30,
        decoration: BoxDecoration(
            color: MyColors.mainColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Branch Name',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Location',
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

  Widget buildBranchDataRow({
    required String branchName,
    required String branchLoaction,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              branchName,
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 20,
            ),
            Center(
              child: SizedBox(
                width: w * 0.4,
                child: Text(
                  branchLoaction,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: headingStyle.copyWith(
                      fontFamily: 'SF Pro Display',
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            buildUserRowCard(updateId: id, name: branchName)
          ],
        ),
      ),
    );
  }

  Widget buildUserRowCard({required String updateId, required String name}) =>
      BlocConsumer<BranchCubit, BranchState>(
        listener: (context, state) {
          if (state is DeleteBranchSuccessState) {
            BranchCubit.get(context).getBranches();
          }
        },
        builder: (context, state) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateBranchScreeen(
                                updateId: updateId,
                                updateCompanyName: name,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
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
              InkWell(
                onTap: () {
                  BranchCubit.get(context).deleteBranch(updateId);
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
              ),
            ],
          );
        },
      );
}
