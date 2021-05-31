import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/Custom_dialog.dart';
import 'package:oxygen/UI/payment_type/components/pay_type_Item.dart';
import 'package:oxygen/UI/payment_type/components/banks_card.dart';
import 'package:oxygen/UI/payment_type/components/bank_Transfer.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';

class PaymentType extends StatefulWidget {
  @override
  _PaymentTypeState createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  bool _visa = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'order_pay_options',
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 50,
                    virticaloffset: 0,
                    widget: Text(
                      translator.translate('choose_order_payment_options'),
                      style: TextStyle(
                        color: Color(lightThemeColors['text-head']),
                        fontSize: 16,
                        fontFamily: 'JannaLT-Bold',
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  AnimatedWidgets(
                    duration: 2,
                    horizontalOffset: 0.0,
                    virticaloffset: 50.0,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //================ بطاقات بنكية ========================
                        PayTypeItem(
                          title: "bank_cards",
                          description: "pay_by_visa",
                          color: _visa == true
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          textColor: _visa == true
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          onTap: () {
                            setState(() {
                              _visa == false ? _visa = true : null;
                              print('visa');
                            });
                          },
                        ),

                        //================ التحويل البنكي ========================
                        PayTypeItem(
                          title: "bank_transfer",
                          description: "pay_by_bank_transfer",
                          color: _visa == true
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          textColor: _visa == true
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          onTap: () {
                            setState(() {
                              _visa == true ? _visa = false : null;
                              print('7ewalla');
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _visa == true ? BanksCard() : BankTransfer(),
                  ),
                ],
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            message: 'order_has_been_successfully_paid',
                            navRoute: (){},
                          );
                        },
                      );
                    },
                    child: CustomButton(
                      text: translator.translate("pay_the_order"),
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
