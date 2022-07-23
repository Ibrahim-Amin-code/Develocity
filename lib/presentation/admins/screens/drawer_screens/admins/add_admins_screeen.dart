// ignore_for_file: prefer_const_constructors, unused_local_variable, use_full_hex_values_for_flutter_colors, void_checks

import 'dart:io';

import 'package:develocity/business_logic/admin_cubit/admin_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/admins/admins_screeen.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/drawer_widget.dart';

class AddAdminsScreeen extends StatefulWidget {
  const AddAdminsScreeen({Key? key}) : super(key: key);

  @override
  State<AddAdminsScreeen> createState() => _AddAdminsScreeenState();
}

class _AddAdminsScreeenState extends State<AddAdminsScreeen> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
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
          text: 'Admins',
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
                'Add new Admin',
                style: headingStyle.copyWith(
                    fontFamily: 'SF Pro Display',
                    fontSize: 20,
                    color: MyColors.mainColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              CustomTextFormField(nameController, TextInputType.name,
                  (String? val) {
                if (val!.isEmpty) {
                  return 'This Felid Is Required';
                } else {
                  return null;
                }
              }, 'Admin Name *', 'Enter name', 1),
              SizedBox(
                height: h * 0.02,
              ),
              CustomTextFormField(emailController, TextInputType.emailAddress,
                  (String val) {
                if (val.isEmpty) {
                  return 'This Felid Is Required';
                } else if (!val.contains("@") || !val.contains(".com")) {
                  return 'INVALID EMAIL';
                }
                return null;
              }, 'Email *', 'Enter Email', 1),
              SizedBox(
                height: h * 0.02,
              ),
              CustomTextFormField(
                  passwordController, TextInputType.visiblePassword,
                  (String? val) {
                if (val!.length < 8) {
                  return 'Password Length Short than 8 chars';
                } else if (passwordController.text.isEmpty) {
                  return 'This Felid Is Required';
                } else {
                  return null;
                }
              }, 'Password *', 'Enter Password', 1),
              SizedBox(
                height: h * 0.02,
              ),
              CustomTextFormField(jobController, TextInputType.name,
                  (String? val) {
                if (val!.isEmpty) {
                  return 'This Felid Is Required';
                } else {
                  return null;
                }
              }, 'Job Title *', 'Enter Job Title', 1),
              SizedBox(
                height: h * 0.02,
              ),
              Text('Admin Image *',
                  style: headingStyle.copyWith(
                      color: MyColors.mainColor,
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: h * 0.01,
              ),
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
              BlocConsumer<AdminCubit, AdminState>(
                listener: (context, state) {
                  if (state is AddAdminSuccessState) {
                    AdminCubit.get(context).getAllAdmins();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminsScreeen()));
                  }
                },
                builder: (context, state) {
                  return (state is! AddAdminLoadingState)
                      ? defaultButton(
                          title: 'Submit',
                          onPressed: () {
                            if (_keyForm.currentState!.validate()) {
                              if (image1 != '') {
                                AdminCubit.get(context).addAdmin(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    jobTitle: jobController.text,
                                    img: image1);
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
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
