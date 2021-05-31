import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomBottonFrame.dart';
import 'package:oxygen/UI/common/RememberMeButton.dart';
import 'package:oxygen/theme/color.dart';

class OrderShippingAddressesItem extends StatefulWidget {
  @override
  _OrderShippingAddressesItemState createState() =>
      _OrderShippingAddressesItemState();
}

class _OrderShippingAddressesItemState
    extends State<OrderShippingAddressesItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedWidgets(
      duration: 1.5,
      horizontalOffset: 50.0,
      virticaloffset: 0.0,
      widget: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 3.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(width: 15),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        translator.translate('my_home_address'),
                        style: TextStyle(
                          color: Color(lightThemeColors['text-head']),
                          fontFamily: 'JannaLT-Bold',
                          fontSize: 14,
                        ),
                      ),
                      CustomCheckBox(
                        //isChecked: true,
                        verticalPadding: 0,
                      ),
                    ],
                  ),
                  Text(
                    'الرياض ، حي الروضة ، الطريق الاقليمي الاول ، شارع الامام الحسن البصري',
                    style: TextStyle(
                      color: Color(lightThemeColors['text-body']),
                      fontSize: 11,
                      //height: 1.8,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomButtonFrame(
                      text: translator.translate("edit_address"),
                      color: Colors.white,
                      framColor: Color(lightThemeColors['secondary']),
                      textColor: Color(lightThemeColors['secondary']),
                      height: 35,
                      fontsize: 12,
                      fontWeight: FontWeight.w500,
                      width: MediaQuery.of(context).size.width / 4,
                      rightPadding: 0,
                      leftPadding: 0,
                      bottomPadding: 0,
                      topPadding: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
