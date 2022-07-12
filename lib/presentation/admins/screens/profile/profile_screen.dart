import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/bottom_nav/layout.dart';
import 'package:develocity/presentation/admins/screens/profile/profile_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../widgets/admin_profile_widget.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: adminProfileAppBar(
            context: context, onTapSearch: () {}, title: 'Profile'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AdminProfileCard(),
            SizedBox(
              height: h * 0.07,
            ),
            MenuProfileItems(
                icon: 'assets/images/edit.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfileScreen()));
                },
                text: 'Settings'),
            SizedBox(
              height: h * 0.02,
            ),
            MenuProfileItems(
                icon: 'assets/images/out.png',
                onTap: () {
                  showExitPopup(context);
                },
                text: 'Logout'),
          ],
        ));
  }
}
