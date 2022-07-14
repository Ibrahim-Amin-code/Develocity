import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/main.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserComplaintsScreen extends StatelessWidget {
  final TextEditingController _complaintController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.38,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Align(
                      child: Container(
                        height: height * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.0, color: MyColors.hintColor),
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'We are very sorry',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              'for your bad experience please , spend some \n of your valuable time to write what happened \n so we can take our steps \n as soon as possible',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: MyColors.unselectedIconColor,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ),
                      ),
                      alignment: AlignmentDirectional.bottomCenter,
                    ),
                    SvgPicture.asset(
                      'assets/images/complaints.svg',
                      width: width * 0.4,
                      height: height * 0.2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFormField(
                _complaintController,
                TextInputType.text,
                (String value) {
                  if (value.isEmpty) {
                    return 'Enter your complaints, Please.';
                  }
                },
                'Complaints *',
                'Type Here ...',
                () {},
                8,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(_complaintController.text);
                  }
                },
                text: 'Send',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
