import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/UI/main/home/components/slider.dart';
import 'package:oxygen/UI/main/home/components/Oxygen_Lenses_List/Oxygen_Lenses_List.dart';
import 'package:oxygen/UI/main/home/components/bure_Lenses/Bure_Lenses_List.dart';
import 'package:oxygen/UI/main/home/components/Cosmetics_List/Cosmetics_List.dart';
import 'package:oxygen/UI/main/home/components/Perfumes_List/Perfumes_List.dart';
import 'package:oxygen/UI/main/home/components/Sections_List/Sections_List.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';

import '../drawer/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        key: scaffoldKey,
        appBar: customAppBar(
          context: context,
          appBarTilteKey: '',
          showLogo: true,
          showSearchIcon: true,
          onTapSearchIcon: () {
            navigator.push(Routes.SEARCH);
          },
          showDrawerIcon: true,
          onPressedDrawer: () => scaffoldKey.currentState.openDrawer(),
        ),
        drawer: DrawerView(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlider(
                  showDetails: true,
                ),
                AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 50,
                  virticaloffset: 0,
                  widget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      translator.translate('browse_with_your_section'),
                      style: TextStyle(
                        color: Color(lightThemeColors['text-head']),
                        fontSize: 18,
                        fontFamily: 'JannaLT-Bold',
                      ),
                    ),
                  ),
                ),
                AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 0,
                  virticaloffset: 50,
                  widget: SectionsList(),
                ),

                customTitle(titleKey: 'oxygen_lenses', onTap: () {navigator.push(Routes.SECTIONS_DETAILS);}),
                AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 0,
                  virticaloffset: 50,
                  widget: OxygenLensesList(),
                ),
                customTitle(titleKey: 'bure_lenses', onTap: () {navigator.push(Routes.SECTIONS_DETAILS);}),
                AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 0,
                  virticaloffset: 50,
                  widget: BureLensesList(),
                ),
                customTitle(titleKey: 'cosmetics', onTap: () {navigator.push(Routes.SECTIONS_DETAILS);}),
                AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 0,
                  virticaloffset: 50,
                  widget: CosmeticsList(),
                ),
                customTitle(titleKey: 'perfumes', onTap: () {navigator.push(Routes.SECTIONS_DETAILS);}),
                AnimatedWidgets(
                  duration: 1.5,
                  horizontalOffset: 0,
                  virticaloffset: 50,
                  widget: PerfumesList(),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customTitle({
  String titleKey,
  Function onTap,
}) {
  return AnimatedWidgets(
    duration: 1.5,
    horizontalOffset: 50,
    virticaloffset: 0,
    widget: Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translator.translate(titleKey),
                style: TextStyle(
                  color: Color(lightThemeColors['text-head']),
                  fontSize: 20,
                  fontFamily: 'JannaLT-Bold',
                ),
              ),
              InkWell(
                onTap: onTap,
                child: customImageContainer(imgSrc: 'assets/images/icons/all.png'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
