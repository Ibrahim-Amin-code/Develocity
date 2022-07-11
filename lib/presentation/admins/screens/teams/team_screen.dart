import 'package:develocity/business_logic/app_cubit/app_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // int? group;
    // bool? checkValue = false;
    // int selected = 0;
    // bool _value = false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2.6),
                    width: 40,
                    height: 40,
                    child: Center(
                        child: Image.asset(
                      'assets/images/icon.png',
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.013,
                  ),
                  Text(
                    'UI/Ux Team',
                    style: headingStyle.copyWith(
                        color: MyColors.mainColor,
                        fontFamily: 'SF Pro Display',
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2.6),
                      width: 32,
                      height: 32,
                      child: Center(
                          child: Image.asset(
                        'assets/images/close.png',
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                children: [
                  Text(
                    'start',
                    style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: const Color(0xff435971),
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    'end',
                    style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: Color(0xff435971),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '21 Feb 2022   ',
                    style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 12,
                        color: Color(0xff435971),
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Text(
                    '3 March 2022',
                    style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 12,
                        color: Color(0xff435971),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTimerCard(time: '0', h: h, w: w, text: 'months'),
                  buildTimerCard(time: '12', h: h, w: w, text: 'days'),
                  buildTimerCard(time: '18', h: h, w: w, text: 'hours'),
                ],
              ),
              // SizedBox(
              //   height: h * 0.03,
              // ),
              Text(
                'Description',
                style: headingStyle.copyWith(
                    color: const Color(0xff435971),
                    fontFamily: 'SF Pro Display',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.015,
              ),
              Text(
                'user interface (UI) is anything a user may interact with to use a digital product or service. This includes everything from screens and touchscreens, keyboards, sounds, and even lights. To understand the evolution of UI, however, it’s helpful to learn a bit more about its history and how it has evolved into best practices and a profession.',
                style: headingStyle.copyWith(
                    color: const Color(0xff435971),
                    height: 1.2,
                    fontFamily: 'SF Pro Display',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Text(
                ' Progress',
                style: headingStyle.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: w * 0.035,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff435971)),
              ),
              SizedBox(
                height: h * 0.012,
              ),
              LinearPercentIndicator(
                width: w * 0.9,
                lineHeight: 15.0,
                percent: 0.8,
                center: Text(
                  '80%',
                  style: headingStyle.copyWith(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                backgroundColor: const Color(0xffD9D9D9),
                progressColor: MyColors.mainColor,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Text(
                'To do List',
                style: headingStyle.copyWith(
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    color: const Color(0xff435971),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.015,
              ),
              SizedBox(
                height: h * 0.28,
                child: ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 0, left: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color(0xffE9AE25)
                                      .withOpacity(0.3))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Make a component design',
                                style: headingStyle.copyWith(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              BlocConsumer<AppCubit, AppState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return Radio<int>(
                                      value: index,
                                      splashRadius: 20,
                                      groupValue:
                                          AppCubit.get(context).selectRadio,
                                      activeColor: MyColors.mainColor,
                                      onChanged: (int? val) {
                                        AppCubit.get(context).changeRadio(val);
                                        AppCubit.get(context).selectRadio = val;
                                      });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                      ],
                    );
                  },
                  itemCount: 7,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimerCard(
          {required String time,
          required String text,
          required double h,
          required double w}) =>
      Container(
        width: w * 0.29,
        height: h * 0.14,
        decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              time,
              style: headingStyle.copyWith(
                  color: MyColors.mainColor,
                  fontFamily: 'SF Pro Display',
                  fontSize: w * 0.12,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              text,
              style: headingStyle.copyWith(
                  color: MyColors.mainColor,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
}
