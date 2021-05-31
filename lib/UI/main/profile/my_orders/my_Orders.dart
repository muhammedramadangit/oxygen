import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomBottomSheet.dart';
import 'package:oxygen/UI/main/profile/my_orders/single_Order.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final String language = translator.currentLanguage;
  String _selecedItem;

  void _sortOrders() {
    CustomSheet(
      context: context,
      height: MediaQuery.of(context).size.height / 2.5,
      widget: Directionality(
        textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          children: [
            Text(
              translator.translate('sort_orders'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'JannaLT-Bold',
                color: Color(lightThemeColors['text-head']),
              ),
            ),
            ListTile(
              title: Text(
                translator.translate('in_waiting'),
                style: TextStyle(
                    fontSize: 14, color: Color(lightThemeColors['text-head'])),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                translator.translate('confirmed'),
                style: TextStyle(
                    fontSize: 14, color: Color(lightThemeColors['text-head'])),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                translator.translate('canceled'),
                style: TextStyle(
                    fontSize: 14, color: Color(lightThemeColors['text-head'])),
              ),
              onTap: () {},
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
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'my_orders',
          otherIconWidget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: customImageContainer(
              imgSrc: 'assets/images/icons/filter.png',
              imageHeight: 22,
              imageWidth: 22,
            ),
          ),
          onTapOtherIcon: () {
            _sortOrders();
          },
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  SingleOrder(),
                  Divider(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
