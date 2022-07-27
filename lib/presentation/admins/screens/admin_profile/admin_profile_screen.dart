// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/auth_cubit/auth_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/constants/network/cache_helper.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/admin_profile_cubit/admin_profile_cubit.dart';
import '../splash/splash.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({Key? key}) : super(key: key);

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _nameController.text = AdminProfileCubit.get(context)
        .getAdminProfileModel
        .data!
        .name
        .toString();
    _emailController.text = AdminProfileCubit.get(context)
        .getAdminProfileModel
        .data!
        .email
        .toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AdminProfileCubit _cubit = AdminProfileCubit.get(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AdminProfileCubit, AdminProfileState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor:
              (prefs.getBool('isDark') == true) ? Colors.black : Colors.white,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: MyColors.mainColor,
            ),
            backgroundColor: MyColors.mainColor,
            centerTitle: true,
            title: Text(
              'Admin Profile',
              style: headingStyle.copyWith(
                color: Colors.white,
                fontFamily: 'SF Pro Display',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            elevation: 0.0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
            leading: IconButton(
                onPressed: () {
                  _cubit.adminProfileEditing ? _cubit.profileEdit() : null;
                },
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
          body: ConditionalBuilder(
            condition: state is! GetAdminProfileLoadingState,
            builder: (context) => SingleChildScrollView(
              child: Container(
                color: (prefs.getBool('isDark') == true)
                    ? Colors.black
                    : Colors.white,
                child: Stack(
                  children: [
                    Image(
                      image: (prefs.getBool('isDark') == true)
                          ? const AssetImage('assets/images/dark0.png')
                          : const AssetImage('assets/images/0.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.08,
                          ),
                          SizedBox(
                            height: height * 0.37,
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Center(
                                  child: Card(
                                    color: Theme.of(context)
                                        .bottomNavigationBarTheme
                                        .backgroundColor,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    shadowColor: MyColors.mainColor,
                                    child: SizedBox(
                                      width: width * 0.9,
                                      height: height * 0.24,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: height * 0.06,
                                            ),
                                            !_cubit.adminProfileEditing
                                                ? Column(
                                                    children: [
                                                      Text(
                                                        AdminProfileCubit.get(
                                                                context)
                                                            .getAdminProfileModel
                                                            .data!
                                                            .name
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                                color: MyColors
                                                                    .mainColor),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.02,
                                                      ),
                                                      Text(
                                                        AdminProfileCubit.get(
                                                                context)
                                                            .getAdminProfileModel
                                                            .data!
                                                            .userType
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                              color: MyColors
                                                                  .mainColor,
                                                            ),
                                                      ),
                                                    ],
                                                  )
                                                : CustomButton(
                                                    height: height * 0.05,
                                                    width: width * 0.05,
                                                    onPressed: () {},
                                                    text: 'Change Picture',
                                                  ),
                                            SizedBox(
                                              height: height * 0.04,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CardProfileInfo(
                                                    text: AdminProfileCubit.get(
                                                            context)
                                                        .getAdminProfileModel
                                                        .data!
                                                        .email
                                                        .toString(),
                                                    icon: Icons.location_on),
                                                SizedBox(
                                                  width: width * 0.005,
                                                  child: Container(
                                                    height: height * 0.02,
                                                    color: MyColors.mainColor
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                CardProfileInfo(
                                                    text:
                                                        ' 2653 Tasks Completed',
                                                    icon: Icons.work),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    SizedBox(
                                      width: width * 0.28,
                                      height: height * 0.12,
                                      child: customCachedNetworkImage(
                                          url: AdminProfileCubit.get(context)
                                              .getAdminProfileModel
                                              .data!
                                              .img
                                              .toString(),
                                          context: context,
                                          fit: BoxFit.fitHeight),
                                    ),
                                    if (!_cubit.adminProfileEditing)
                                      GestureDetector(
                                        onTap: () {
                                          _cubit.profileEdit();
                                        },
                                        child: Container(
                                          padding:
                                              const EdgeInsetsDirectional.all(
                                                  1.0),
                                          height: height * 0.033,
                                          width: width * 0.07,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .bottomNavigationBarTheme
                                                .backgroundColor,
                                            border: Border.all(
                                                color: MyColors.mainColor,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            color: MyColors.mainColor,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          !_cubit.adminProfileEditing
                              ? Container(
                                  color: (prefs.getBool('isDark') == true)
                                      ? Colors.black
                                      : Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      MenuProfileItems(
                                        text: 'Settings',
                                        icon: Icons.settings,
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      BlocConsumer<AuthCubit, AuthState>(
                                        listener: (context, state) {
                                          if (state
                                              is AdminLogoutSuccessState) {
                                            prefs.clear();
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SplashScreen()),
                                                (route) => false);
                                          }
                                        },
                                        builder: (context, state) {
                                          return MenuProfileItems(
                                            text: 'Logout',
                                            icon: Icons.logout,
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return LogoutAlertDialog(
                                                        'Logout of Develocity?',
                                                        'Remember my login info',
                                                        'Logout',
                                                        () {
                                                          AuthCubit.get(context)
                                                              .out();
                                                          print(
                                                              'oooooooooooooooo');
                                                        },
                                                        'Cancel',
                                                        () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        });
                                                  });
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : Form(
                                  key: _keyForm,
                                  child: Column(
                                    children: [
                                      CustomTextFormField(
                                          _nameController, TextInputType.name,
                                          (String value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter your name!';
                                        }
                                      }, 'Name *', 'Type Name', 1),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      CustomTextFormField(_emailController,
                                          TextInputType.emailAddress,
                                          (String value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter your email!';
                                        }
                                      }, 'Email *', 'Enter Email', 1),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      CustomTextFormField(
                                          _phoneController, TextInputType.phone,
                                          (String value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter your phone!';
                                        }
                                      }, 'Phone Number *', 'Type Number', 1),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      CustomTextFormField(_passwordController,
                                          TextInputType.visiblePassword,
                                          (String value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter your password!';
                                        }
                                      }, 'Password *', 'Type Password', 1),
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      CustomButton(
                                          onPressed: () {
                                            if (_keyForm.currentState!
                                                .validate()) {
                                              print(_nameController.text);
                                              print(_phoneController.text);
                                              print(_emailController.text);
                                              print(_passwordController.text);
                                            }
                                          },
                                          text: 'Edit')
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
