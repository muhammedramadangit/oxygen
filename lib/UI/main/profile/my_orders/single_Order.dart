import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomBottomSheet.dart';
import 'package:oxygen/UI/common/CustomBottonFrame.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';

class SingleOrder extends StatefulWidget {
  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  String _selecedItem;

  void _orderOptions() {
    CustomSheet(
      context: context,
      height: MediaQuery.of(context).size.height / 5,
      widget: Directionality(
        textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          children: [
            Text(
              translator.translate('order_options'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'JannaLT-Bold',
                color: Color(lightThemeColors['text-head']),
              ),
            ),
            ListTile(
              title: Text(
                translator.translate('cancel_order'),
                style: TextStyle(
                    fontSize: 14, color: Color(lightThemeColors['text-head'])),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Directionality(
                      textDirection: language == "ar"
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: AnimatedWidgets(
                        duration: 1.5,
                        horizontalOffset: 0.0,
                        virticaloffset: 150.0,
                        widget: AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/alert.png',
                                  height: 90,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  translator.translate('confirm_cancle_order'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(lightThemeColors['text-head']),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "JannaLT-Bold",
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {},
                                        child: CustomButton(
                                          text: translator.translate("confirm"),
                                          color: Theme.of(context).accentColor,
                                          height: 45,
                                          rightPadding: 15,
                                          leftPadding: 15,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {},
                                        child: CustomButtonFrame(
                                          text: translator.translate("cancel"),
                                          color: Colors.transparent,
                                          framColor:
                                              Theme.of(context).accentColor,
                                          textColor:
                                              Theme.of(context).accentColor,
                                          height: 45,
                                          rightPadding: 15,
                                          leftPadding: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
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
    return AnimatedWidgets(
      duration: 1.5,
      horizontalOffset: 50.0,
      virticaloffset: 0.0,
      widget: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 15,
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Color(lightThemeColors['primary']),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/icons/editeinfo.png',
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#15446464',
                        style: TextStyle(
                          color: Color(lightThemeColors['secondary']),
                          fontFamily: 'JannaLT-Bold',
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.withOpacity(0.2),
                              Colors.grey.withOpacity(0.1),
                              Colors.grey.withOpacity(0.05),
                              Colors.grey.withOpacity(0.025),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'في الانتظار',
                            style: TextStyle(
                              color: Color(lightThemeColors['primary']),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "250 ",
                              style: TextStyle(
                                color: Color(lightThemeColors['primary']),
                                fontSize: 14,
                                fontFamily: 'JannaLT-Bold',
                              ),
                            ),
                            TextSpan(
                              text: "${translator.translate("sar")}",
                              style: TextStyle(
                                color: Color(lightThemeColors['primary']),
                                fontSize: 10,
                                fontFamily: 'JannaLT-Bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          navigator.push(Routes.ORDER_DETAILS);
                        },
                        child: CustomButtonFrame(
                          text: translator.translate("order_details"),
                          color: Colors.white,
                          framColor: Color(lightThemeColors['secondary']),
                          textColor: Color(lightThemeColors['secondary']),
                          height: 35,
                          fontsize: 12,
                          width: MediaQuery.of(context).size.width / 3.5,
                          rightPadding: 0,
                          leftPadding: 0,
                          bottomPadding: 0,
                          topPadding: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //================== secound Column =================
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Image.asset('assets/images/icons/list.png',
                      height: 25, fit: BoxFit.fill),
                  alignment: Alignment.centerLeft,
                  onPressed: _orderOptions,
                ),
                Text(
                  "الخميس 12 مارس 2020",
                  style: TextStyle(
                    color: Color(0xffC8C8C8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
