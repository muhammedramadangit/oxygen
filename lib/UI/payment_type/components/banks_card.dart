import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class BanksCard extends StatefulWidget {
  @override
  _BanksCardState createState() => _BanksCardState();
}

class _BanksCardState extends State<BanksCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          AnimatedWidgets(
            duration: 1.5,
            horizontalOffset: 50,
            virticaloffset: 0,
            widget: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translator.translate('visa_data'),
                    style: TextStyle(
                      color: Color(lightThemeColors['text-head']),
                      fontSize: 16,
                      fontFamily: 'JannaLT-Bold',
                    ),
                  ),
                  customImageContainer(
                    imgSrc: 'assets/images/payment.png',
                    containerWidth: 140,
                    imageWidth: 140,
                  ),
                ],
              ),
            ),
          ),
          AnimatedWidgets(
            duration: 1.5,
            virticaloffset: 0.0,
            horizontalOffset: 150.0,
            widget: CustomTextField(
              horizontalPadding: 0,
              labelSize: 12,
              leftPadding: 0,
              rightPadding: 0,
              secureText: false,
              label: translator.translate("enter_the_card_number"),
              inputType: TextInputType.number,
            ),
          ),
          AnimatedWidgets(
            duration: 1.5,
            virticaloffset: 0.0,
            horizontalOffset: 150.0,
            widget: CustomTextField(
              horizontalPadding: 0,
              verticalPadding: 0,
              labelSize: 12,
              leftPadding: 0,
              rightPadding: 0,
              secureText: false,
              label: translator.translate("name_of_the_card_holder"),
              inputType: TextInputType.text,
            ),
          ),
          AnimatedWidgets(
            duration: 1.5,
            virticaloffset: 0.0,
            horizontalOffset: 150.0,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                    width: MediaQuery.of(context).size.width / 1.6,
                    horizontalPadding: 0,
                    labelSize: 12,
                    leftPadding: 0,
                    rightPadding: 0,
                    secureText: false,
                    label: translator.translate("card_expiration_date"),
                    inputType: TextInputType.datetime,
                    suffixIcon: CustomIconTap(
                      widget: Image.asset('assets/images/icons/date.png'),
                      ontap: () {},
                    )),
                CustomTextField(
                  width: MediaQuery.of(context).size.width / 3.8,
                  horizontalPadding: 0,
                  labelSize: 14,
                  leftPadding: 0,
                  rightPadding: 0,
                  secureText: false,
                  label: "CVV",
                  inputType: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
