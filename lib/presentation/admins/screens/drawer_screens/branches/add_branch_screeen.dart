// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_field, use_full_hex_values_for_flutter_colors, avoid_print

import 'dart:io';

import 'package:develocity/business_logic/branch_cubit/branch_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/admins/screens/onBorading/onBoardingScreen.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../business_logic/provider/map.dart';
import '../../../widgets/drawer_widget.dart';

class AddBranchScreeen extends StatefulWidget {
  const AddBranchScreeen({Key? key}) : super(key: key);

  @override
  State<AddBranchScreeen> createState() => _AddBranchScreeenState();
}

class _AddBranchScreeenState extends State<AddBranchScreeen> {
  GoogleMapController? _controller;

  void _updatePosition(CameraPosition _position, context) {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(_position));
    Provider.of<MapProvider>(context, listen: false)
        .updateLat(_position.target);
  }

  TextEditingController nameController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController locationController = TextEditingController();

  File? image;
  String image1 = "";

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
          image1 = pickedFile.path;
        });
      } else {
        setState(() {
          image = File(pickedFile!.path);
          image1 = pickedFile.path;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    MapProvider map = Provider.of<MapProvider>(context, listen: true);
    locationController.text = map.street.toString();
    return Scaffold(
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'Branches',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Add new Branch',
              style: headingStyle.copyWith(
                  fontFamily: 'SF Pro Display',
                  fontSize: 20,
                  color: MyColors.mainColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            CustomTextFormField(nameController, TextInputType.name, () {},
                'Company Name *', 'Enter name', () {}, 1),
            SizedBox(
              height: h * 0.02,
            ),
            Text('Branch Image *',
                style: headingStyle.copyWith(
                    color: MyColors.mainColor,
                    fontFamily: 'SF Pro Display',
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: h * 0.01,
            ),
            Container(
              width: 335,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: MyColors.mainColor.withOpacity(0.1))),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      await getImage();
                    },
                    child: Container(
                      width: 128,
                      color: Color(0xff1A696CFF),
                      child: Center(
                        child: Text(
                          'Choose File',
                          style: headingStyle.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyColors.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      (image1 != '') ? image1 : 'No file chooosen',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: headingStyle.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC4C4C4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            CustomTextFormField(locationController, TextInputType.streetAddress,
                () {}, 'Location *', "Enter location", () {}, 1),
            SizedBox(
              height: h * 0.02,
            ),
            SizedBox(
              height: h * 0.4,
              width: w,
              child: map.latLng == null
                  ? Center(
                      child: CircularProgressIndicator(
                        color: MyColors.mainColor,
                      ),
                    )
                  : GoogleMap(
                      onMapCreated: (controller) {
                        _controller = controller;
                        map.info();
                      },
                      initialCameraPosition:
                          CameraPosition(target: map.latLng!, zoom: 18),
                      onCameraIdle: () async {
                        await map.info();
                      },
                      markers: <Marker>{
                        Marker(
                          draggable: true,
                          markerId: const MarkerId('Marker'),
                          position: map.latLng!,
                          icon: map.icon != null
                              ? map.icon!
                              : BitmapDescriptor.defaultMarker,
                        )
                      },
                      onCameraMove: ((_position) =>
                          _updatePosition(_position, context)),
                    ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            BlocConsumer<BranchCubit, BranchState>(
              listener: (context, state) {},
              builder: (context, state) {
                return defaultButton(
                    title: 'Submit',
                    onPressed: () {
                      print(map.latLng!.toString().split(',').first);
                      print(map.latLng!.toString().split(',').last);
                      BranchCubit.get(context).addBranch(
                          context: context,
                          name: nameController.text,
                          lat: map.latLng!
                              .toString()
                              .split(',')
                              .first
                              .toString(),
                          lng:
                              map.latLng!.toString().split(',').last.toString(),
                          location: locationController.text,
                          img: image1);
                    },
                    fontSize: 16,
                    height: h * 0.06,
                    width: w * 0.9,
                    color: MyColors.mainColor,
                    textColor: Colors.white);
              },
            )
          ]),
        ),
      ),
    );
  }
}
