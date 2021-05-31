import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomBottomSheet.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class BankTransfer extends StatefulWidget {
  @override
  _BankTransferState createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  final String language = translator.currentLanguage;
  String _selecedItem;

  void _bankBottomSheet() {
    CustomSheet(
      context: context,
      height: MediaQuery.of(context).size.height / 2.2,
      widget: Directionality(
        textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  translator.translate('choose_bank'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'JannaLT-Bold',
                    color: Color(lightThemeColors['text-head']),
                  ),
                ),
                ListTile(
                  title: Text(
                    translator.translate("Al_Rajhi_Bank"),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(lightThemeColors['text-head'])),
                  ),
                  leading: Image.asset(
                    'assets/images/raghi.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                  onTap: () => _selectItem('Al_Rajhi_Bank'),
                ),
                ListTile(
                  title: Text(
                    translator.translate("National_Commercial_Bank"),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(lightThemeColors['text-head'])),
                  ),
                  leading: Image.asset(
                    'assets/images/fahli.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                  onTap: () => _selectItem('National_Commercial_Bank'),
                ),
                ListTile(
                  title: Text(
                    translator.translate("the_National_Bank"),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(lightThemeColors['text-head'])),
                  ),
                  leading: Image.asset(
                    'assets/images/belad.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                  onTap: () => _selectItem('the_National_Bank'),
                ),
                ListTile(
                  title: Text(
                    translator.translate("Development_Bank"),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(lightThemeColors['text-head'])),
                  ),
                  leading: Image.asset(
                    'assets/images/enmaa.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                  onTap: () => _selectItem('Development_Bank'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selecedItem = name;
    });
  }

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
                    translator.translate('card_transfer_data'),
                    style: TextStyle(
                      color: Color(lightThemeColors['text-head']),
                      fontSize: 16,
                      fontFamily: 'JannaLT-Bold',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigator.push(Routes.OUR_BANK_ACCOUNTS);
                    },
                    child: Container(
                      width: language == "ar"
                          ? MediaQuery.of(context).size.width / 3.1
                          : MediaQuery.of(context).size.width / 2.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customImageContainer(
                              imgSrc: 'assets/images/icons/accounts.png'),
                          Text(
                            translator.translate('our_bank_accounts'),
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              fontFamily: 'JannaLT-Bold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ============ choose bank ============
          AnimatedWidgets(
            duration: 1.5,
            virticaloffset: 0.0,
            horizontalOffset: 150.0,
            widget: InkWell(
              onTap: () {
                _bankBottomSheet();
              },
              child: Container(
                height: 45,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(
                    right: 12.0, top: 10.0, bottom: 10.0, left: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[50],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          translator.translate(_selecedItem != null
                              ? _selecedItem
                              : 'choose_bank'),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _selecedItem != null
                                ? Color(lightThemeColors['primary'])
                                : Color(0xffC8C8C8),
                          ),
                        )
                      ],
                    ),
                    CustomIconTap(
                      widget: customImageContainer(
                          imgSrc: 'assets/images/icons/down.png'),
                      ontap: () {
                        _bankBottomSheet();
                      },
                    ),
                  ],
                ),
              ),
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
              label: translator.translate("account_holder_name"),
              inputType: TextInputType.text,
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
              label: translator.translate("account_number"),
              inputType: TextInputType.number,
            ),
          ),

          AnimatedWidgets(
            duration: 1.5,
            virticaloffset: 0.0,
            horizontalOffset: 150.0,
            widget: InkWell(
              onTap: () {},
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[50],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icons/upload.png',
                      height: 35,
                      width: 40,
                      fit: BoxFit.fill,
                    ),
                    /* customImageContainer(
                      imgSrc: 'assets/images/icons/upload.png',
                      containerHeight: 33,
                      containerWidth: 35,
                      imageHeight: 33,
                      imageWidth: 35,
                    ), */
                    Text(
                      translator.translate('upload_hawalla_image'),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
