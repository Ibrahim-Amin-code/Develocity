// // ignore_for_file: unused_local_variable

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// import '../../../../../constants/core/colors.dart';
// import '../../onBorading/onBoardingScreen.dart';
// import 'otp_success.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   // StreamController<ErrorAnimationType> errorController =
//   //     StreamController<ErrorAnimationType>();
//   String currentText = "";
//   StreamController<ErrorAnimationType>? errorController;
//   bool hasError = false;
//   var textEditingController = TextEditingController();
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   final formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     // onTapRecognizer = TapGestureRecognizer()
//     //   ..onTap = () {
//     //     Navigator.pop(context);
//     //   };
//     errorController = StreamController<ErrorAnimationType>();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     errorController!.close();
//     super.dispose();
//   }

//   snackBar(String? message) {
//     return ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message!),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       key: scaffoldKey,
//       body: ListView(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                 width: w * 0.095,
//                 height: h * 0.05,
//                 decoration: BoxDecoration(
//                     color: MyColors.mainColor,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: const Center(
//                     child: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 )),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: h * 0.01,
//           ),
//           Text(
//             'Develocity',
//             textAlign: TextAlign.center,
//             style: headingStyle.copyWith(
//                 fontSize: 30,
//                 color: MyColors.mainColor,
//                 fontWeight: FontWeight.w400),
//           ),
//           SizedBox(
//             height: h * 0.005,
//           ),
//           Text(
//             'Management  App',
//             textAlign: TextAlign.center,
//             style: headingStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: 'Poppins',
//                 color: const Color(0xff9A9A9A)),
//           ),
//           SizedBox(
//             height: h * 0.05,
//           ),
//           Text(
//             'Verify Account',
//             textAlign: TextAlign.center,
//             style: headingStyle.copyWith(
//                 fontSize: 12,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w500,
//                 color: const Color(0xff474747)),
//           ),
//           SizedBox(
//             height: h * 0.05,
//           ),
//           Image.asset(
//             'assets/images/bro11.png',
//             fit: BoxFit.contain,
//             height: h * 0.22,
//             width: w * 0.54,
//           ),
//           SizedBox(
//             height: h * 0.05,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: w * 0.25),
//             child: Text(
//               'Please enter the verification number we send to your email',
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               style: headingStyle.copyWith(
//                   fontFamily: 'SF Pro Display',
//                   fontSize: 12,
//                   color: const Color(0xff4A4646),
//                   fontWeight: FontWeight.w500),
//             ),
//           ),

//           SizedBox(
//             height: h * 0.08,
//           ),
//           // const Spacer(),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: w * 0.2, vertical: 5),
//             child: Form(
//               key: formKey,
//               child: PinCodeTextField(
//                 appContext: context,
//                 obscuringCharacter: '*',
//                 length: 4,
//                 obscureText: false,
//                 keyboardType: TextInputType.number,
//                 animationType: AnimationType.fade,
//                 validator: (v) {
//                   if (v!.length < 3) {
//                     return "I'm from validator";
//                   } else {
//                     return null;
//                   }
//                 },
//                 pinTheme: PinTheme(
//                   disabledColor: Colors.white,
//                   activeFillColor: Colors.white,
//                   activeColor: MyColors.mainColor,
//                   errorBorderColor: MyColors.mainColor,
//                   inactiveColor: MyColors.mainColor,
//                   inactiveFillColor: Colors.white,
//                   selectedColor: MyColors.mainColor,
//                   selectedFillColor: Colors.white,
//                   shape: PinCodeFieldShape.underline,
//                   borderRadius: BorderRadius.circular(5),
//                   fieldHeight: 50,
//                   fieldWidth: 40,
//                   // activeFillColor: Colors.white,
//                 ),
//                 cursorColor: Colors.black,

//                 animationDuration: Duration(milliseconds: 300),
//                 // backgroundColor: Colors.blue.shade50,
//                 enableActiveFill: true,
//                 errorAnimationController: errorController,
//                 controller: textEditingController,
//                 onCompleted: (v) {
//                   print("Completed");
//                 },
//                 onChanged: (value) {
//                   print(value);
//                   setState(() {
//                     currentText = value;
//                   });
//                 },
//                 beforeTextPaste: (text) {
//                   print("Allowing to paste $text");
//                   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                   //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                   return true;
//                 },
//               ),
//             ),
//           ),
//           // SizedBox(height: h * 0.01),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Don’t receive a code?  ',
//                 style: headingStyle.copyWith(
//                     fontFamily: 'Poppins',
//                     color: Color(0xff9A9A9A),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500),
//               ),
//               TextButton(
//                 onPressed: () => snackBar("OTP resend!!"),
//                 child: Text(
//                   'Resend',
//                   style: headingStyle.copyWith(
//                       fontFamily: 'Poppins',
//                       color: Color(0xff696CFF),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500),
//                 ),
//               )
//             ],
//           ),
//           // const SizedBox(
//           //   height: 20,
//           // ),

//           defaultButton(
//               margin: EdgeInsets.symmetric(horizontal: w * 0.08),
//               title: 'Confirm',
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   // signInWithPhoneNumber();
//                 }
//                 // conditions for validating
//                 if (currentText.length == 6) {
//                   errorController!.add(ErrorAnimationType
//                       .shake); // Triggering error shake animation
//                   setState(() {
//                     hasError = true;
//                   });
//                 } else {
//                   setState(() {
//                     hasError = false;
//                     scaffoldKey.currentState!.showSnackBar(SnackBar(
//                       content: Text("Aye!!"),
//                       duration: Duration(seconds: 2),
//                     ));
//                   });
//                 }
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const OtpSuccessScreen()));
//               },
//               fontSize: 14,
//               height: h * 0.06,
//               width: w * 0.95,
//               color: MyColors.mainColor,
//               textColor: Colors.white),
//           SizedBox(
//             height: h * 0.042,
//           ),
//         ],
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }
