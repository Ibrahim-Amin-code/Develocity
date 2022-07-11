import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/screens/profile/profile_components.dart';
import 'package:develocity/presentation/admins/widgets/admin_profile_widget.dart';
import 'package:develocity/presentation/admins/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../constants/clip_path.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    final _keyForm = GlobalKey<FormState>();
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
              AdminEditProfileCard(),
              SizedBox(
                height: h * 0.03,
              ),
              Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Column(
                    children: [
                      CustomTextFormField(nameController, TextInputType.name,
                          () {}, 'Name *', 'type name', () {}),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(
                          emailController,
                          TextInputType.emailAddress,
                          () {},
                          'Email *',
                          'Enter Email',
                          () {}),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(phoneController, TextInputType.number,
                          () {}, 'Phone number *', 'type number', () {}),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(
                          passwordController,
                          TextInputType.visiblePassword,
                          () {},
                          'Password *',
                          'type password',
                          () {}),
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
