// ignore_for_file: unused_local_variable

import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/widgets/admin_profile_widget.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';

class EditAdminProfileScreen extends StatefulWidget {
  const EditAdminProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditAdminProfileScreen> createState() => _EditAdminProfileScreenState();
}

class _EditAdminProfileScreenState extends State<EditAdminProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final keyForm = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
        appBar: adminProfileAppBar(
            title: 'Edit Profile', onTapSearch: () {}, context: context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AdminEditProfileCard(),
              SizedBox(
                height: h * 0.03,
              ),
              Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Column(
                    children: [
                      CustomTextFormField(nameController, TextInputType.name,
                          () {}, 'Name *', 'type name', 1),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(
                          emailController,
                          TextInputType.emailAddress,
                          () {},
                          'Email *',
                          'Enter Email',
                          1),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(phoneController, TextInputType.number,
                          () {}, 'Phone number *', 'type number', 1),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(
                          passwordController,
                          TextInputType.visiblePassword,
                          () {},
                          'Password *',
                          'type password',
                          1),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      defaultButton(
                          title: 'Edit',
                          onPressed: () {},
                          fontSize: 16,
                          height: h * 0.06,
                          width: w * 0.9,
                          color: MyColors.mainColor,
                          textColor: Colors.white),
                      SizedBox(
                        height: h * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
