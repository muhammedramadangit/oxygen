import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomBottomSheet.dart';
import 'package:oxygen/UI/common/CustomBottonFrame.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/UI/main/shopping_cart/components/Cart_Order_Item.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  final String language = translator.currentLanguage;
  String _selecedItem;
  int count = 2;

  void _discountCoupon() {
    CustomSheet(
      context: context,
      height: MediaQuery.of(context).size.height / 3,
      widget: Directionality(
        textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  translator.translate('add_discount_coupon'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'JannaLT-Bold',
                    color: Color(lightThemeColors['text-head']),
                  ),
                ),
                AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 50.0,
                  virticaloffset: 0.0,
                  widget: CustomTextField(
                    horizontalPadding: 10,
                    verticalPadding: 10,
                    labelSize: 12,
                    leftPadding: 5,
                    rightPadding: 5,
                    secureText: false,
                    label: translator.translate("enter_discount_coupon"),
                    inputType: TextInputType.text,
                    prefixIcon: Container(
                      height: 25,
                      width: 25,
                      child: Center(
                        child: Image.asset(
                          'assets/images/icons/editeinfo.png',
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                          color: Color(0xffC8C8C8),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedWidgets(
                  duration: 1.5,
                  virticaloffset: 50,
                  horizontalOffset: 0,
                  widget: InkWell(
                    onTap: () {},
                    child: CustomButton(
                      topPadding: 15,
                      bottomPadding: 15,
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      color: Color(lightThemeColors['secondary']),
                      text: translator.translate("confirm"),
                    ),
                  ),
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
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        key: scaffold_key,
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'my_cart',
          showDrawerIcon: true,
          onPressedDrawer: () => scaffold_key.currentState.openDrawer(),
        ),
        drawer: DrawerView(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4.8 * count,
                    child: ListView.builder(
                      itemCount: count,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            CartOrder(
                              imgSrc: 'assets/images/1.png',
                              name: 'عدسات طبية - دي أوريو',
                              description: 'هذا النص تجريبي لاختيار شكل',
                              cost: "250 ",
                            ),
                            AnimatedWidgets(
                              duration: 1.5,
                              horizontalOffset: 50.0,
                              virticaloffset: 0.0,
                              widget: Divider(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  //=============== Discount Coupon ================
                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 50.0,
                    virticaloffset: 0.0,
                    widget: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translator.translate('discount_coupon'),
                                style: TextStyle(
                                  color: Color(lightThemeColors['text-head']),
                                  fontFamily: 'JannaLT-Bold',
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                translator.translate('oxygen_discount'),
                                style: TextStyle(
                                  color: Color(lightThemeColors['text-body']),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              _discountCoupon();
                            },
                            child: CustomButtonFrame(
                              topPadding: 0,
                              leftPadding: 0,
                              rightPadding: 0,
                              bottomPadding: 0,
                              height: 40,
                              width: MediaQuery.of(context).size.width / 5,
                              color: Colors.transparent,
                              framColor: Color(lightThemeColors['secondary']),
                              textColor: Color(lightThemeColors['secondary']),
                              text: translator.translate('new'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 50.0,
                    virticaloffset: 0.0,
                    widget: Divider(),
                  ),
                  //================= تفاصيل الطلب ================
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //================ مجموع الطلب ===================
                        AnimatedWidgets(
                          duration: 1.5,
                          horizontalOffset: 0.0,
                          virticaloffset: 50.0,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                translator.translate('all_total'),
                                style: TextStyle(
                                  color: Color(lightThemeColors['text-body']),
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '500 ${translator.translate("sar")}',
                                style: TextStyle(
                                  color: Color(lightThemeColors['text-body']),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //================ الضريبة ===================
                        AnimatedWidgets(
                          duration: 1.5,
                          horizontalOffset: 0.0,
                          virticaloffset: 50.0,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${translator.translate('tax')} (15%)",
                                style: TextStyle(
                                  color: Color(lightThemeColors['text-body']),
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '25 ${translator.translate("sar")}',
                                style: TextStyle(
                                  color: Color(lightThemeColors['text-body']),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),

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
                                    '525 ${translator.translate("sar")}'),
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

                  SizedBox(height: 15),
                  AnimatedWidgets(
                    duration: 1.5,
                    virticaloffset: 50,
                    horizontalOffset: 0,
                    widget: InkWell(
                      onTap: () {
                        navigator.push(Routes.ORDER_SHIPPING_ADRESSES);
                      },
                      child: CustomButton(
                        topPadding: 0,
                        leftPadding: 0,
                        rightPadding: 0,
                        bottomPadding: 0,
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        color: Color(lightThemeColors['secondary']),
                        text: translator.translate('track_shopping'),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
