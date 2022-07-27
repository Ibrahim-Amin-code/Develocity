// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_field, void_checks, deprecated_member_use, use_full_hex_values_for_flutter_colors

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/admin_news_cubit/admin_news_cubit.dart';
import 'package:develocity/business_logic/branch_cubit/branch_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/news/admin_news_screen.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants/core/const.dart';
import '../../../widgets/drawer_widget.dart';

class UpdateNewsScreeen extends StatefulWidget {
  final String id;
  final String typeId;
  final String title;
  final String desc;
  final String titleType;

  const UpdateNewsScreeen(
      {Key? key,
      required this.id,
      required this.title,
      required this.desc,
      required this.titleType,
      required this.typeId})
      : super(key: key);

  @override
  State<UpdateNewsScreeen> createState() => _UpdateNewsScreeenState();
}

class _UpdateNewsScreeenState extends State<UpdateNewsScreeen> {
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
  void initState() {
    titleController.text = widget.title;
    titleTypeController.text = widget.titleType;
    descController.text = widget.desc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Update News',
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
                'Update news',
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
                  if (state is UpdateAdminNewsTypeSuccessState) {
                    AdminNewsCubit.get(context).getAdminNewsType();
                  }
                },
                builder: (context, state) {
                  return (state is! UpdateAdminNewsTypeLoadingState)
                      ? defaultButton(
                          title: 'Update News Type',
                          onPressed: () {
                            // if (_keyForm.currentState!.validate()) {
                            AdminNewsCubit.get(context).updateAdminNewsType(
                                id: widget.typeId.toString(),
                                titleType: titleTypeController.text);
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
                  if (state is UpdateNewsSuccessState) {
                    AdminNewsCubit.get(context).getNews();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminNewsScreen()));
                  }
                },
                builder: (context, state) {
                  return (state is! UpdateNewsLoadingState)
                      ? defaultButton(
                          title: 'Update News',
                          onPressed: () {
                            // if (_keyForm.currentState!.validate()) {
                            if (image1 != '') {
                              AdminNewsCubit.get(context).updateNews(
                                id: widget.id,
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
                            // }
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
