import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/admins/widgets/admin_profile_widget.dart';
import 'package:develocity/presentation/admins/widgets/login_widget.dart';
import 'package:develocity/presentation/users/widgets/profile_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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
    final _keyForm = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

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
                      CustomTextFormField(
                        controller: _nameController,
                        inputType: TextInputType.name,
                        validate: (s) {},
                        label: 'Name *',
                        hint: 'type name',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        inputType: TextInputType.emailAddress,
                        validate: (s) {},
                        label: 'Email *',
                        hint: 'Enter Email',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(
                        controller: _phoneController,
                        inputType: TextInputType.number,
                        validate: (s) {},
                        label: 'Phone number *',
                        hint: 'type number',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      CustomTextFormField(
                        controller: _passwordController,
                        inputType: TextInputType.visiblePassword,
                        validate: (s) {},
                        label: 'Password *',
                        hint: 'type password',
                        onTap: () {},
                      ),
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
