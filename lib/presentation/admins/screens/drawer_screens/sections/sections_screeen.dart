// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/section_cubit/section_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/sections/update_section_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/drawer_widget.dart';

class SectionsScreeen extends StatefulWidget {
  const SectionsScreeen({Key? key}) : super(key: key);

  @override
  State<SectionsScreeen> createState() => _SectionsScreeenState();
}

class _SectionsScreeenState extends State<SectionsScreeen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocConsumer<SectionCubit, SectionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: Colors.white,
          appBar: csutomAppBarInDrawers(
              image: 'assets/images/arrow.png',
              image2: 'assets/images/search.png',
              text: 'Sections',
              onTap: () {
                Navigator.pop(context);
              },
              onTap1: () {}),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
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
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                buildSectionRow(),
                SizedBox(
                  height: h * 0.03,
                ),
                ConditionalBuilder(
                    condition: state is! GetSectionLoadingState,
                    builder: (context) => SizedBox(
                          height: h * .65,
                          child: ListView.separated(
                            shrinkWrap: true,
                            primary: true,
                            itemBuilder: (context, index) =>
                                buildSectionDataRow(
                              id: SectionCubit.get(context)
                                  .sectionModel
                                  .data![index]
                                  .id
                                  .toString(),
                              sctionName: SectionCubit.get(context)
                                  .sectionModel
                                  .data![index]
                                  .name
                                  .toString(),
                              branchName: SectionCubit.get(context)
                                  .sectionModel
                                  .data![index]
                                  .branch!
                                  .name
                                  .toString(),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: h * 0.01,
                            ),
                            itemCount: SectionCubit.get(context)
                                .sectionModel
                                .data!
                                .length,
                          ),
                        ),
                    fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSectionRow() => Container(
        height: 30,
        decoration: BoxDecoration(
            color: MyColors.mainColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Section Name',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Branch Name',
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
/** */
  Widget buildSectionDataRow({
    required String sctionName,
    required String branchName,
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
              width: 1,
            ),
            Text(
              sctionName,
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: w * 0.09,
            ),
            SizedBox(
              width: w * 0.25,
              child: Text(
                branchName,
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
            buildSectionRowCard(id: id, secionName: sctionName)
          ],
        ),
      ),
    );
  }

  Widget buildSectionRowCard({
    required String id,
    required String secionName,
  }) =>
      BlocConsumer<SectionCubit, SectionState>(
        listener: (context, state) {
          if (state is DeleteSectionSuccessState) {
            SectionCubit.get(context).getSections();
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
                          builder: (context) => UpdateSectionScreeen(
                                id: id,
                                sectionName: secionName,
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
                  SectionCubit.get(context).deleteSection(id);
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
