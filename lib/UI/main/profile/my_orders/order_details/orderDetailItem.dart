import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';

class OrderDetailItem extends StatefulWidget {
  @override
  _OrderDetailItemState createState() => _OrderDetailItemState();
}

class _OrderDetailItemState extends State<OrderDetailItem> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  @override
  Widget build(BuildContext context) {
    return AnimatedWidgets(
      duration: 1.5,
      horizontalOffset: 50.0,
      virticaloffset: 0.0,
      widget: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 3.2,
                    //margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عدسات طبية - دي أوريو',
                        style: TextStyle(
                          color: Color(lightThemeColors['text-head']),
                          fontFamily: 'JannaLT-Bold',
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'هذا النص تجريبي لاختيار شكل',
                        style: TextStyle(
                          color: Color(lightThemeColors['text-body']),
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 5,
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
                          child: RichText(
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
                                    fontSize: 12,
                                    fontFamily: 'JannaLT-Bold',
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                Text(
                  '2 X',
                  textDirection:
                      language == "ar" ? TextDirection.ltr : TextDirection.rtl,
                  style: TextStyle(
                    color: Color(lightThemeColors['primary']),
                    fontFamily: 'JannaLT-Bold',
                    fontSize: 14,
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
