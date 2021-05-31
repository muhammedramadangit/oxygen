import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/theme/color.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
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
            appBarTilteKey: language == 'ar' ? 'arabic' : 'english',
            showDrawerIcon: true,
            onPressedDrawer: () => scaffoldKey.currentState.openDrawer(),
          ),
          drawer: DrawerView(),
          body: Column(
            children: [
              customListTile(
                title_Key: 'arabic',
                onTap: () {},
              ),
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50,
                virticaloffset: 0,
                widget: Divider(
                  color: Color(lightThemeColors['text-body']),
                  endIndent: 15,
                  indent: 15,
                  height: 3,
                ),
              ),
              customListTile(
                title_Key: 'english',
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
