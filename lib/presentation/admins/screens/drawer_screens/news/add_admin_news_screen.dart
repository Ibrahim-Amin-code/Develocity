// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_field, void_checks

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/add_user/add_user_cubit.dart';
import 'package:develocity/business_logic/admin_news_cubit/admin_news_cubit.dart';
import 'package:develocity/business_logic/branch_cubit/branch_cubit.dart';
import 'package:develocity/business_logic/section_cubit/section_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/users/users_screeens.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants/core/const.dart';
import '../../../widgets/drawer_widget.dart';

class AddNewsScreeen extends StatefulWidget {
  const AddNewsScreeen({Key? key}) : super(key: key);

  @override
  State<AddNewsScreeen> createState() => _AddNewsScreeenState();
}

class _AddNewsScreeenState extends State<AddNewsScreeen> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController titleTypeController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  File? image;
  String image1 = "";

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
          image1 = pickedFile.path;
        });
      } else {
        setState(() {
          image = File(pickedFile!.path);
          image1 = pickedFile.path;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Add News',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Add news',
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    fontSize: 20,
                    color: MyColors.mainColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.04,
              ),

              CustomTextFormField(
                  titleTypeController,
                  TextInputType.text,
                  //     (String? val) {
                  //   if (val!.isEmpty) {
                  //     return 'This Felid Is Required';
                  //   } else {
                  //     return null;
                  //   }
                  // }
                  () {},
                  'Title Type *',
                  'Enter Title Type',
                  1),
              SizedBox(
                height: h * 0.02,
              ),

              BlocConsumer<AdminNewsCubit, AdminNewsState>(
                listener: (context, state) {
                  if (state is AddAdminNewsTypeSuccessState) {
                    AdminNewsCubit.get(context).getAdminNewsType();
                  }
                },
                builder: (context, state) {
                  return (state is! AddAdminNewsTypeLoadingState)
                      ? defaultButton(
                          title: 'Add News Type',
                          onPressed: () {
                            // if (_keyForm.currentState!.validate()) {
                            AdminNewsCubit.get(context).addNewsType(
                              title: titleTypeController.text,
                            );
                            // }
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
              ),
              ////////////////////////////////////////////////////////
              ///
              ///
              SizedBox(
                height: h * 0.02,
              ),

              CustomTextFormField(titleController, TextInputType.text,
                  (String? val) {
                if (val!.isEmpty) {
                  return 'This Felid Is Required';
                } else {
                  return null;
                }
              }, 'Title  *', 'Enter Title ', 1),
              SizedBox(
                height: h * 0.02,
              ),

              CustomTextFormField(descController, TextInputType.text,
                  (String? val) {
                if (val!.isEmpty) {
                  return 'This Felid Is Required';
                } else {
                  return null;
                }
              }, 'Description *', 'Enter Description', 3),
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                'Branches *',
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
                listener: (context, state) {},
                builder: (context, state) {
                  return ConditionalBuilder(
                      condition: state is! GetBranchLoadingState,
                      builder: (context) => CustomDropDownBranch(
                            items: BranchCubit.get(context).branchModel.data!,
                            text: 'Select Branch',
                          ),
                      fallback: (context) => Center(
                            child: LinearProgressIndicator(),
                          ));
                },
              ),
              SizedBox(
                height: h * 0.02,
              ),

              Text(
                'News Types *',
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    color: MyColors.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              BlocConsumer<AdminNewsCubit, AdminNewsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ConditionalBuilder(
                      condition: state is! GetAdminNewsTypeLoadingState,
                      builder: (context) => CustomDropDownNewsType(
                            items: AdminNewsCubit.get(context)
                                .getAdminNewsTypeModel
                                .data!,
                            text: 'Select News Type',
                          ),
                      fallback: (context) => Center(
                            child: LinearProgressIndicator(),
                          ));
                },
              ),

              SizedBox(
                height: h * 0.03,
              ),

              // Text(
              //   'Sections *',
              //   style: headingStyle.copyWith(
              //       fontFamily: 'SF Pro Display',
              //       color: MyColors.mainColor,
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500),
              // ),
              // SizedBox(
              //   height: h * 0.01,
              // ),
              // BlocConsumer<SectionCubit, SectionState>(
              //   listener: (context, state) {},
              //   builder: (context, state) {
              //     return ConditionalBuilder(
              //       condition: state is! GetSectionLoadingState,
              //       builder: (context) => CustomDropDownSection(
              //         items: SectionCubit.get(context).sectionModel.data!,
              //         text: 'Select Sections',
              //       ),
              //       fallback: (context) => Center(
              //         child: LinearProgressIndicator(),
              //       ),
              //     );
              //   },
              // ),
              // // Spacer(),

              // SizedBox(
              //   height: h * 0.03,
              // ),
              Container(
                width: 335,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: MyColors.mainColor.withOpacity(0.1))),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await getImage();
                      },
                      child: Container(
                        width: 128,
                        color: Color(0xff1A696CFF),
                        child: Center(
                          child: Text(
                            'Choose File',
                            style: headingStyle.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: MyColors.mainColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        (image1 != '') ? image1 : 'No file chooosen',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: headingStyle.copyWith(
                          fontFamily: 'SF Pro Display',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                'Image with should be jpg , jpeg , png',
                style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MyColors.mainColor,
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              BlocConsumer<AdminNewsCubit, AdminNewsState>(
                listener: (context, state) {
                  if (state is AddNewsSuccessState) {
                    AdminNewsCubit.get(context).getNews();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => UsersScreeen()));
                  }
                },
                builder: (context, state) {
                  return (state is! AddNewsLoadingState)
                      ? defaultButton(
                          title: 'Add News',
                          onPressed: () {
                            if (_keyForm.currentState!.validate()) {
                              if (image1 != '') {
                                AdminNewsCubit.get(context).addNews(
                                  desc: descController.text,
                                  title: titleController.text,
                                  typeId:
                                      prefs.getString('newsTypeId').toString(),
                                  img: image1,
                                  branchId:
                                      prefs.getString('branchId').toString(),
                                );
                              } else {
                                return snackBar(
                                    message: 'You Must Choose Image',
                                    context: context);
                              }
                            }
                          },
                          fontSize: 16,
                          height: h * 0.06,
                          width: w * 0.9,
                          color: MyColors.mainColor,
                          textColor: Colors.white)
                      : Center(child: CircularProgressIndicator());
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
