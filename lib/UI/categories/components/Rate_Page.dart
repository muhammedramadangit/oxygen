import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/categories/components/rate_item.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';

class RatePage extends StatefulWidget {
  @override
  _RatePageState createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  final String language = translator.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: translator.translate('rates'),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (_, index) {
            return AnimatedWidgets(
              duration: 1.5,
              horizontalOffset: 50,
              virticaloffset: 0,
              widget: RateItem(
                name: 'محمد رمضان',
                rate: 4.5,
                comment: 'هذا النص هو مثال لنص يمكن ان يستبدل فى نفس المساحة لقد تم توليد هذا النص',
              ),
            );
          },
        ),
      ),
    );
  }
}
