// ignore_for_file: prefer_const_constructors

import 'package:develocity/business_logic/provider/map.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  GoogleMapController? _controller;

  void _updatePosition(CameraPosition _position, context) {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(_position));
    Provider.of<MapProvider>(context, listen: false)
        .updateLat(_position.target);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    MapProvider map = Provider.of<MapProvider>(context, listen: true);
    return Scaffold(
        body: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.6,
              width: w,
              child: Stack(
                children: [
                  SizedBox(
                    height: h * 0.6,
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
                  if (map.predictions.isNotEmpty)
                    Positioned(
                      top: h * 0.02,
                      right: w * 0.1,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 5,
                        child: Container(
                          width: w * 0.8,
                          constraints: BoxConstraints(
                            minHeight: h * 0.1,
                            maxHeight: h * 0.55,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(map.predictions.length,
                                    (index) {
                                  return ListTile(
                                    leading: const CircleAvatar(
                                      child: Icon(
                                        Icons.pin_drop,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                        map.predictions[index].description!),
                                    onTap: () async {
                                      var result = await map.googlePlace.details
                                          .get(map.predictions[index].placeId!);
                                      if (result != null &&
                                          result.result != null) {
                                        final lat = result
                                            .result!.geometry!.location!.lat;
                                        final lng = result
                                            .result!.geometry!.location!.lng;
                                        _controller!.moveCamera(
                                            CameraUpdate.newLatLng(
                                                LatLng(lat!, lng!)));
                                        map.latLng = LatLng(lat, lng);
                                        map.clearPlaces();
                                        map.info();
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      }
                                    },
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: w,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: w * 0.05, left: w * 0.05, top: h * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   translateString("Add shipping address", "اضف عنوان الشحن "),
                      //   style: TextStyle(
                      //       color: Colors.grey, fontSize: w * 0.04),
                      // ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/noun-pin.png',
                            scale: 3,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          if (map.street == null)
                            Text(
                              "Add address",
                              style: TextStyle(
                                  color: MyColors.mainColor,
                                  fontSize: w * 0.045,
                                  fontWeight: FontWeight.bold),
                            ),
                          if (map.street != null)
                            Text(
                              map.street!.length > 35
                                  ? map.street!.substring(0, 35)
                                  : map.street!,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .unselectedItemColor,
                                  fontSize: w * 0.035,
                                  fontWeight: FontWeight.bold),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      InkWell(
                        child: AnimatedOpacity(
                          duration: const Duration(seconds: 2),
                          opacity: map.op,
                          child: Container(
                            height: h * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyColors.mainColor,
                            ),
                            child: Center(
                              child: Text(
                                'confirm',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: w * 0.045,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (map.latLng != null) {}
                        },
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  InputBorder form() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: (Colors.grey[200]!), width: 1),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
