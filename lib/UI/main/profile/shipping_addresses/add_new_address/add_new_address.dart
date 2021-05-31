import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/UI/common/Custom_dialog.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'dart:io';

class AddNewAddress extends StatefulWidget {
  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  /* Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  double mapBottomPadding = 0;
  double searchSheetHeight = (Platform.isIOS) ? 300 : 275;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  ); */

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'new_address',
          showSearchIcon: true,
          onTapSearchIcon: () {},
        ),
        body: Stack(
          children: [
            //============= map position ====================
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2 + 50,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: Colors.brown[100],
                    )
                    /* GoogleMap(
                    padding: EdgeInsets.only(bottom: mapBottomPadding),
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      mapController = controller;

                      setState(() {
                        mapBottomPadding = (Platform.isAndroid) ? 280 : 270;
                      });
                    },
                  ), */
                    ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: CustomIconTap(
                widget: customImageContainer(
                  imgSrc: 'assets/images/icons/gps.png',
                  containerHeight: 65,
                  containerWidth: 65,
                  imageHeight: 65,
                  imageWidth: 65,
                ),
                ontap: () {},
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                    color: Color(lightThemeColors['primary']),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 0.0,
                  virticaloffset: 50.0,
                  widget: Text(
                    'الرياض ، حي الروضة ، الطريق الاقليمي الاول ، شارع الامام الحسن على البصري',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  children: [
                    Text(
                      translator.translate('address_details'),
                      style: TextStyle(
                        color: Color(lightThemeColors['text-head']),
                        fontSize: 16,
                        fontFamily: 'JannaLT-Bold',
                      ),
                    ),
                    SizedBox(height: 5),
                    AnimatedWidgets(
                      duration: 1.5,
                      virticaloffset: 0.0,
                      horizontalOffset: 150.0,
                      widget: CustomTextField(
                        horizontalPadding: 10,
                        labelSize: 12,
                        leftPadding: 5,
                        rightPadding: 5,
                        secureText: false,
                        label: translator.translate("address_name"),
                        inputType: TextInputType.text,
                      ),
                    ),
                    AnimatedWidgets(
                      duration: 1.5,
                      virticaloffset: 0.0,
                      horizontalOffset: 150.0,
                      widget: CustomTextField(
                        horizontalPadding: 10,
                        labelSize: 12,
                        leftPadding: 5,
                        rightPadding: 5,
                        lines: 3,
                        secureText: false,
                        label: translator.translate("enter_detailed_address"),
                        inputType: TextInputType.text,
                      ),
                    ),
                    AnimatedWidgets(
                      duration: 1.5,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog(
                                message: 'address_added_successfully',
                                navRoute: () => Navigator.pop(context),
                              );
                            },
                          );
                        },
                        child: CustomButton(
                          text: translator.translate("save_address"),
                          color: Color(lightThemeColors["secondary"]),
                          height: 45,
                          width: double.infinity,
                          rightPadding: 15,
                          leftPadding: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
