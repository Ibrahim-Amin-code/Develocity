import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/profile/cubit/cubit.dart';
import 'package:develocity/presentation/admins/screens/profile/cubit/state.dart';
import 'package:develocity/presentation/admins/screens/profile/profile_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ProfileCubit _cubit = ProfileCubit.get(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: MyColors.mainColor,
            ),
            backgroundColor: MyColors.mainColor,
            centerTitle: true,
            title: Text(
              'Profile',
              style: headingStyle.copyWith(
                color: Colors.white,
                fontFamily: 'SF Pro Display',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            elevation: 0.0,
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
            leading: IconButton(
                onPressed: () {
                _cubit.profileEditing? _cubit.profileEdit() : Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                const Image(
                  image: AssetImage('assets/images/0.png'),
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
                                color: Colors.white,
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
                                        !_cubit.profileEditing
                                            ? Column(
                                          children: [
                                            Text(
                                              'Samaa Samir',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                  color:
                                                  MyColors.mainColor),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              'UI/UX Design',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                  color: Colors.black),
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
                                                text: 'Mansoura, Egypt',
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
                                                text: '2653 Tasks Completed',
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
                                const CircleAvatar(
                                  radius: 50.0,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/img.png',
                                    ),
                                  ),
                                ),
                                if(!_cubit.profileEditing)
                                  GestureDetector(
                                    onTap: () {
                                      _cubit.profileEdit();
                                    },
                                    child: Container(
                                      padding: const EdgeInsetsDirectional.all(1.0),
                                      height: height * 0.033,
                                      width: width * 0.07,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: MyColors.mainColor, width: 2.0),
                                        borderRadius: BorderRadius.circular(5.0),
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
                      !_cubit.profileEditing
                          ? Container(
                        color: Colors.white,
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
                            MenuProfileItems(
                              text: 'Logout',
                              icon: Icons.logout,
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                          : Form(
                        key: _keyForm,
                        child: Column(
                          children: [
                            CustomTextFormField(
                                _nameController,
                                TextInputType.name,
                                    (String value) {
                                  if(value.isEmpty){
                                    return 'Please Enter your name!';
                                  }
                                },
                                'Name *',
                                'Type Name',
                                    () {}),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            CustomTextFormField(
                                _emailController,
                                TextInputType.emailAddress,
                                    (String value) {
                                  if(value.isEmpty){
                                    return 'Please Enter your email!';
                                  }
                                },
                                'Email *',
                                'Enter Email',
                                    () {}),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            CustomTextFormField(
                                _phoneController,
                                TextInputType.phone,
                                    (String value) {
                                  if(value.isEmpty){
                                    return 'Please Enter your phone!';
                                  }
                                },
                                'Phone Number *',
                                'Type Number',
                                    () {}),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            CustomTextFormField(
                                _passwordController,
                                TextInputType.visiblePassword,
                                    (String value) {
                                  if(value.isEmpty){
                                    return 'Please Enter your password!';
                                  }
                                },
                                'Password *',
                                'Type Password',
                                    () {}),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            CustomButton(onPressed: () {
                              if(_keyForm.currentState!.validate()){
                                print(_nameController.text);
                                print(_phoneController.text);
                                print(_emailController.text);
                                print(_passwordController.text);
                              }
                            }, text: 'Edit')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
