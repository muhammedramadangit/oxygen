import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/theme/color.dart';

class OfferItem extends StatelessWidget {
  final title;
  final content;
  final offerImage;
  final discountValue;
  final expireDate;
  final cost;
  final String language = translator.currentLanguage;

  OfferItem(
      {this.title,
      this.content,
      this.offerImage,
      this.discountValue,
      this.expireDate,
      this.cost});
  @override
  Widget build(BuildContext context) {
    return AnimatedWidgets(
      duration: 1.5,
      horizontalOffset: 0,
      virticaloffset: 150,
      widget: InkWell(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xffc1c1c1),
                width: 0.1
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: ClipRRect(
                  borderRadius: language == "ar"
                      ? BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                  child: Stack(
                    children: [
                      Image.asset(
                        offerImage,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          color: Color(lightThemeColors['primary']),
                          child: Center(
                            child: Text(
                              "${translator.translate("expires_in")}  $expireDate",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: language == "ar"
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                  child: Stack(
                    children: [
                      //================= محتويات العرض ====================
                      Container(
                        height: MediaQuery.of(context).size.height,
                        //width: MediaQuery.of(context).size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Column(
                          crossAxisAlignment: language == "ar"
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Color(lightThemeColors['text-head']),
                                fontSize: 12,
                                fontFamily: 'JannaLT-Bold',
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              content,
                              style: TextStyle(
                                color: Color(lightThemeColors['text-body']),
                                fontSize: 10,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //================= السعر والخصم ====================
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "$cost ",
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
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width / 8,
                              decoration: BoxDecoration(
                                color: Color(lightThemeColors["secondary"]),
                                borderRadius: language == "ar"
                                    ? BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )
                                    : BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                              ),
                              child: Center(
                                child: Text(
                                  "% $discountValue",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
