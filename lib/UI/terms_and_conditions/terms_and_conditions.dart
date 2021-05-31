import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/AppLogo.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/theme/color.dart';

class TermsAndCondition extends StatefulWidget {
  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  GlobalKey<ScaffoldState> scaffold_Key = GlobalKey<ScaffoldState>();
  final String language = translator.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        key: scaffold_Key,
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'terms_and_conditions',
          showDrawerIcon: true,
          onPressedDrawer: () => scaffold_Key.currentState.openDrawer(),
        ),
        drawer: DrawerView(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            //=========== Logo Location ==========
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                bottom: 20,
                right: MediaQuery.of(context).size.width / 4,
                left: MediaQuery.of(context).size.width / 4,
              ),
              child: AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 0.0,
                virticaloffset: 50.0,
                widget: AppLogo(),
              ),
            ),

            AnimatedWidgets(
              duration: 1.5,
              horizontalOffset: 0.0,
              virticaloffset: 50.0,
              widget: Text(
                "هذا النص هو مثال لنص يمكن ان يستبدل فى نفس المساحة, لقد تم توليد هذا النص من مولد النص العربي, حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff2E5B65),
                  height: 2,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
