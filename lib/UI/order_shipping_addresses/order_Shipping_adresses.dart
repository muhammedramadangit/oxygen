import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/order_shipping_addresses/Order_shipping_addresses_item.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class OrderShippingAddresses extends StatefulWidget {
  @override
  _OrderShippingAddressesState createState() => _OrderShippingAddressesState();
}

class _OrderShippingAddressesState extends State<OrderShippingAddresses> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'order_shipping_addresses',
          otherIconWidget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: customImageContainer(imgSrc: 'assets/images/icons/add.png'),
          ),
          onTapOtherIcon: () {
            navigator.push(Routes.NEW_SHIPPING_ADDRESSES);
          },
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      OrderShippingAddressesItem(),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 75,
                color: Colors.white,
                child: AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 0.0,
                  virticaloffset: 50.0,
                  widget: InkWell(
                    onTap: () {
                      navigator.push(Routes.PAYMENT_TYPE);
                    },
                    child: CustomButton(
                      text: translator.translate("order_payment_options"),
                      color: Theme.of(context).accentColor,
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      rightPadding: 15,
                      leftPadding: 15,
                      topPadding: 15,
                      bottomPadding: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
