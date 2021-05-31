import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AppLogo.dart';
import 'package:oxygen/UI/common/CustomBottomSheet.dart';
import 'package:oxygen/UI/common/CustomSkipButton.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/theme/color.dart';

Widget customAppBar({
  @required BuildContext context,
  @required String appBarTilteKey,
  final bool showDrawerIcon = false,
  final bool showLogo = false,
  final bool showSearchIcon = false,
  final bool showShareIcon = false,
  Function onPressedDrawer,
  Function onPressedShareIcon,
  Color bgColor,
  Widget otherIconWidget,
  Function onTapOtherIcon,
  Function onTapSearchIcon,
}) {
  return AppBar(
    backgroundColor: bgColor ?? Colors.white,
    elevation: 0,
    centerTitle: true,
    leading: showDrawerIcon == true
        ? drawerIcon(
            context: context,
            onPressed: onPressedDrawer,
            color: bgColor == Colors.transparent
                ? Colors.white
                : Theme.of(context).accentColor,
          )
        : CustomSkipBottom(
            leftPadding: 17,
            topPadding: 17,
            bottonPadding: 17,
            onTap: () => Navigator.pop(context),
          ),
    title: showLogo == true
        ? AppLogo(height: 40, width: 100)
        : Text(
            translator.translate(appBarTilteKey),
            style: TextStyle(
              fontSize: 15,
              color: bgColor == Colors.transparent
                  ? Colors.white
                  : Color(lightThemeColors['text-head']),
              fontFamily: 'JannaLT-Bold',
            ),
          ),
    actions: [
      showSearchIcon == true
          ? InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: customImageContainer(
                  imgSrc: 'assets/images/icons/search.png',
                ),
              ),
              onTap: onTapSearchIcon,
            )
          : Container(),
      showShareIcon == true
          ? InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: customImageContainer(
                  imgSrc: 'assets/images/icons/share.png',
                ),
              ),
              onTap: onPressedShareIcon,
            )
          : Container(),
      InkWell(
        onTap: onTapOtherIcon,
        child: Container(
          child: otherIconWidget,
        ),
      ),
    ],
  );
}

Widget drawerIcon({
  BuildContext context,
  Function onPressed,
  Color color,
}) {
  return InkWell(
      onTap: onPressed,
      child: Container(
        height: 25,
        width: 25,
        child: Center(
          child: Image.asset(
            "assets/images/icons/menu.png",
            height: 25,
            width: 25,
            fit: BoxFit.cover,
            color: color,
          ),
        ),
      ));
}

void _cityBottomSheet(
  BuildContext context,
  String _selecedItem,
) {
  CustomSheet(
    context: context,
    widget: Directionality(
      textDirection: translator.currentLanguage == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 3,
                width: 50,
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                translator.translate('choose_ur_city'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(lightThemeColors['text-head']),
                ),
              ),
              ListTile(
                title: Text(
                  'الرياض',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(lightThemeColors['text-head'])),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'مكة المكرمة',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(lightThemeColors['text-head'])),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
