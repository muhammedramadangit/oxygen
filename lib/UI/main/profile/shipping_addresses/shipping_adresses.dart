import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/main/profile/shipping_addresses/addressItem.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';

class ShippingAddresses extends StatefulWidget {
  @override
  _ShippingAddressesState createState() => _ShippingAddressesState();
}

class _ShippingAddressesState extends State<ShippingAddresses> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'Shipping_addresses',
          otherIconWidget: Padding(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              'assets/images/icons/add.png',
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
          ),
          onTapOtherIcon: () {
            navigator.push(Routes.NEW_SHIPPING_ADDRESSES);
          },
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  ShippinAddressesItem(),
                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 50.0,
                    virticaloffset: 0.0,
                    widget: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
