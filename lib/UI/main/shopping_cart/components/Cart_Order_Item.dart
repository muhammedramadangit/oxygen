import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class CartOrder extends StatefulWidget {
  final String name;
  final String description;
  final String cost;
  final String imgSrc;

  const CartOrder({this.name, this.description, this.cost, this.imgSrc});

  @override
  _CartOrderState createState() => _CartOrderState();
}

class _CartOrderState extends State<CartOrder> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  int _total = 1;

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
        margin: EdgeInsets.symmetric(vertical: 5),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.asset(
                            widget.imgSrc,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: language == "ar"
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width / 8,
                              decoration: BoxDecoration(
                                color: Color(0xffac0909),
                                borderRadius: language == "ar"
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                      )
                                    : BorderRadius.only(
                                        topRight: Radius.circular(15),
                                      ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/icons/del.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.cover,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: Color(lightThemeColors['text-head']),
                          fontFamily: 'JannaLT-Bold',
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        widget.description,
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
                                  text: widget.cost,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _total = _total + 1;
                    });
                  },
                  child: customImageContainer(imgSrc: 'assets/images/icons/add.png'),
                ),
                Text(
                  "${_total.toString()}",
                  style: TextStyle(
                    color: Color(lightThemeColors['primary']),
                    fontSize: 15,
                    fontFamily: 'JannaLT-Bold',
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _total > 0 ? _total = _total - 1 : null;
                      print('مش شغال يا مولانا');
                    });
                  },
                  child: customImageContainer(imgSrc: 'assets/images/icons/minus.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
