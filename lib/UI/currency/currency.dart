import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/theme/color.dart';

class Currency extends StatefulWidget {
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final String language = translator.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          key: scaffoldKey,
          appBar: customAppBar(
            context: context,
            appBarTilteKey: 'currency',
            showDrawerIcon: true,
            onPressedDrawer: () => scaffoldKey.currentState.openDrawer(),
          ),
          drawer: DrawerView(),
          body: Column(
            children: [
              customListTile(
                title_Key: 'SAR',
                onTap: () {},
              ),
              customDivider(),
              customListTile(
                title_Key: 'UAE',
                onTap: () {},
              ),
              customDivider(),
              customListTile(
                title_Key: 'OMR',
                onTap: () {},
              ),
              customDivider(),
              customListTile(
                title_Key: 'EGP',
                onTap: () {},
              ),
              customDivider(),
              customListTile(
                title_Key: 'USD',
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}

Widget customListTile({
  Function onTap,
  String title_Key,
}) {
  return AnimatedWidgets(
    duration: 1.5,
    horizontalOffset: 50,
    virticaloffset: 0,
    widget: ListTile(
      onTap: onTap,
      title: Text(
        translator.translate(title_Key),
        style: TextStyle(
          color: Color(lightThemeColors['text-head']),
          fontSize: 15,
          //fontFamily: 'JannaLT-Bold',
          //fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget customDivider() {
  return AnimatedWidgets(
    duration: 1.5,
    horizontalOffset: 50,
    virticaloffset: 0,
    widget: Divider(
      color: Color(lightThemeColors['text-body']),
      endIndent: 15,
      indent: 15,
      height: 3,
    ),
  );
}
