// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:develocity/business_logic/branch_cubit/branch_cubit.dart';
import 'package:develocity/business_logic/section_cubit/section_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/sections/sections_screeen.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/drawer_widget.dart';

class UpdateSectionScreeen extends StatefulWidget {
  final String id;

  const UpdateSectionScreeen({Key? key, required this.id}) : super(key: key);

  @override
  State<UpdateSectionScreeen> createState() => _UpdateSectionScreeenState();
}

class _UpdateSectionScreeenState extends State<UpdateSectionScreeen> {
  TextEditingController nameController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Update Section',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Update Section',
            style: headingStyle.copyWith(
                fontFamily: 'SF Pro Display',
                fontSize: 20,
                color: MyColors.mainColor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: h * 0.04,
          ),
          CustomTextFormField(nameController, TextInputType.name, () {},
              'Section Name *', 'Enter name', 1),
          SizedBox(
            height: h * 0.02,
          ),
          Text(
            'Company',
            style: headingStyle.copyWith(
                fontFamily: 'SF Pro Display',
                color: MyColors.mainColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          BlocConsumer<BranchCubit, BranchState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return CustomDropDown(
                items: BranchCubit.get(context).branchModel.data!,
                text: 'Select company',
              );
            },
          ),
          SizedBox(
            height: h * 0.05,
          ),
          BlocConsumer<SectionCubit, SectionState>(
            listener: (context, state) {
              if (state is UpdateSectionSuccessState) {
                SectionCubit.get(context).getSections();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SectionsScreeen()),
                );
              }
            },
            builder: (context, state) {
              return (state is! UpdateSectionLoadingState)
                  ? defaultButton(
                      title: 'Submit',
                      onPressed: () {
                        SectionCubit.get(context).updateSection(
                            id: widget.id,
                            name: nameController.text,
                            branchId: prefs.getString('branchId').toString());
                      },
                      fontSize: 16,
                      height: h * 0.06,
                      width: w * 0.9,
                      color: MyColors.mainColor,
                      textColor: Colors.white)
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          )
        ]),
      ),
    );
  }
}
