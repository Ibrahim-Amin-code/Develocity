import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class UserRequirementsScreen extends StatefulWidget {
  const UserRequirementsScreen({Key? key}) : super(key: key);

  @override
  State<UserRequirementsScreen> createState() => _UserRequirementsScreenState();
}

class _UserRequirementsScreenState extends State<UserRequirementsScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _adminController = TextEditingController();
  final TextEditingController _taskNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _selectedDropDown;
  final List _admins = <String>['Ahmed', 'Ibrahim', 'Islam'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(_userNameController, TextInputType.text,
                  (String value) {
                if (value.isEmpty) {
                  return 'Enter user name, please.';
                }
              }, 'User Name *', 'Enter name', () {}, 1),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFormField(_costController, TextInputType.number,
                  (String value) {
                if (value.isEmpty) {
                  return 'Enter cost, please.';
                }
              }, 'Cost *', 'Enter cost', () {}, 1),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  'Admin *',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14.0),
                ),
              ),
              DropdownButtonFormField2(
                validator: (value) {
                  if (value == null) {
                    return 'Please select an admin';
                  }
                },
                onChanged: (value) {
                  //Do something when changing the item if you want.
                },
                hint: Text(
                  'Select Admin',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    color: MyColors.hintColor,
                  ),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: MyColors.mainColor,
                ),
                iconSize: 30,
                buttonHeight: 65,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.hintColor,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.mainColor,
                      width: 2.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.mainColor,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                ),
                isExpanded: true,
                items: _admins.map<DropdownMenuItem<String>>((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFormField(_taskNameController, TextInputType.text,
                  (String value) {
                if (value.isEmpty) {
                  return 'type requirements which you need';
                }
              }, 'Task *', 'type requirements which you need', () {}, 9),
              SizedBox(
                height: height * 0.03,
              ),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(_userNameController.text);
                    print(_costController.text);
                    print(_adminController.text);
                    print(_taskNameController.text);
                  }
                },
                text: 'Send',
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
