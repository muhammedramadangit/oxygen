import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/UI/offers/offer_Item.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  GlobalKey<ScaffoldState> scaffold_Key = GlobalKey<ScaffoldState>();
  final String languages = translator.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: languages == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        key: scaffold_Key,
        drawer: DrawerView(),
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'special_offers',
          showDrawerIcon: true,
          onPressedDrawer: () => scaffold_Key.currentState.openDrawer(),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return OfferItem(
              title: 'عدسات طبية - دي أورو',
              content: 'هذا النص تجريبي لاختيار شكل مميزة معبرا عن محتواه...',
              offerImage: 'assets/images/1.png',
              discountValue: '25',
              expireDate: '22-01-2021',
              cost: '250',
            );
          },
        ),
      ),
    );
  }
}

