import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomBottonFrame.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/UI/main/profile/my_orders/order_details/orderDetailItem.dart';
import 'package:oxygen/theme/color.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final String language = translator.currentLanguage;

  void _cancleOrder() {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection:
              language == "ar" ? TextDirection.rtl : TextDirection.ltr,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              framColor: Theme.of(context).accentColor,
                              textColor: Theme.of(context).accentColor,
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
  }

  void _addRate() {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection:
              language == "ar" ? TextDirection.rtl : TextDirection.rtl,
          child: AnimatedWidgets(
            duration: 1.5,
            horizontalOffset: 0.0,
            virticaloffset: 150.0,
            widget: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              content: Container(
                //height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          translator.translate('add_rate'),
                          style: TextStyle(
                            color: Color(lightThemeColors['text-head']),
                            fontSize: 18,
                            fontFamily: "JannaLT-Bold",
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          translator.translate('Rate_products'),
                          style: TextStyle(
                            color: Color(lightThemeColors['text-body']),
                            fontSize: 15,
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.only(
                                right: 12, top: 10, bottom: 10, left: 8),
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
                                      translator.translate('choose_product'),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffC8C8C8),
                                      ),
                                    )
                                  ],
                                ),
                                CustomIconTap(
                                  widget: Image.asset(
                                      'assets/images/icons/down.png'),
                                  ontap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 150,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/1.png'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Text(
                          translator.translate('عدسات طبية - دي أورو'),
                          style: TextStyle(
                            color: Color(lightThemeColors['text-head']),
                            fontSize: 16,
                            fontFamily: "JannaLT-Bold",
                          ),
                        ),
                        SizedBox(height: 5),
                        RatingBar.builder(
                          initialRating: 3,
                          itemSize: 30,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          unratedColor: Colors.grey[300],
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) {
                            return Image.asset(
                                "assets/images/icons/starac.png");
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        CustomTextField(
                          horizontalPadding: 0,
                          labelSize: 12,
                          leftPadding: 0,
                          rightPadding: 0,
                          lines: 2,
                          secureText: false,
                          label: translator.translate("add_your_rate"),
                          inputType: TextInputType.text,
                          prefixIcon: Container(
                            height: 25,
                            width: 25,
                            child: Center(
                              child: Image.asset(
                                'assets/images/icons/editeinfo.png',
                                height: 25,
                                width: 25,
                                color: Color(0xffC8C8C8),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: CustomButton(
                            text: translator.translate("confirm"),
                            color: Color(lightThemeColors["secondary"]),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            rightPadding: 0,
                            leftPadding: 0,
                            topPadding: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'order_details',
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView(
            children: [
              //================= المنتجات ================
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50.0,
                virticaloffset: 0.0,
                widget: Text(
                  translator.translate('products'),
                  style: TextStyle(
                    color: Color(lightThemeColors['text-head']),
                    fontSize: 16,
                    fontFamily: 'JannaLT-Bold',
                  ),
                ),
              ),
              OrderDetailItem(),
              Divider(),
              OrderDetailItem(),
              Divider(),

              //================= تفاصيل الطلب ================
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50.0,
                virticaloffset: 0.0,
                widget: Text(
                  translator.translate('order_details'),
                  style: TextStyle(
                    color: Color(lightThemeColors['text-head']),
                    fontSize: 16,
                    fontFamily: 'JannaLT-Bold',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //================= اجمالى الطلب =================
                    AnimatedWidgets(
                      duration: 1.5,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            translator.translate('totla_order'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            translator.translate(
                                '500 ${translator.translate("sar")}'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //================ تاريخ الطلب ===================
                    AnimatedWidgets(
                      duration: 1.5,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            translator.translate('order_date'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            translator.translate('25 فبراير 2021'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //================ حالة الطلب ===================
                    AnimatedWidgets(
                      duration: 1.5,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            translator.translate('order_status'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            translator.translate('confirmed'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //================ طريقة الدفع ===================
                    AnimatedWidgets(
                      duration: 1.5,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            translator.translate('pay_type'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            translator.translate('bank_cards'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),

              //==================== عنوان الشحن ===============
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50.0,
                virticaloffset: 0.0,
                widget: Text(
                  translator.translate('shipping_address'),
                  style: TextStyle(
                    color: Color(lightThemeColors['text-head']),
                    fontSize: 16,
                    fontFamily: 'JannaLT-Bold',
                  ),
                ),
              ),
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50.0,
                virticaloffset: 0.0,
                widget: Container(
                  height: MediaQuery.of(context).size.height / 8,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              translator.translate('my_home_address'),
                              style: TextStyle(
                                color: Color(lightThemeColors['text-head']),
                                fontFamily: 'JannaLT-Bold',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'الرياض ، حي الروضة ، الطريق الاقليمي الاول ، شارع الامام الحسن البصري',
                              style: TextStyle(
                                color: Color(lightThemeColors['text-body']),
                                fontSize: 11,
                                //height: 1.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 0.0,
                virticaloffset: 50.0,
                widget: InkWell(
                  onTap: _cancleOrder,
                  child: CustomButton(
                    text: translator.translate("cancel_order"),
                    color: Color(lightThemeColors["secondary"]),
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    rightPadding: 0,
                    leftPadding: 0,
                    topPadding: 15,
                  ),
                ),
              ),

              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 0.0,
                virticaloffset: 50.0,
                widget: InkWell(
                  onTap: _addRate,
                  child: CustomButton(
                    text: translator.translate("add_rate"),
                    color: Color(lightThemeColors["secondary"]),
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    rightPadding: 0,
                    leftPadding: 0,
                    topPadding: 15,
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
