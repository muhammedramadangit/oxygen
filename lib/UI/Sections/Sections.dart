import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/UI/common/CustomSingleSection.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';

class Sections extends StatefulWidget {
  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  GlobalKey<ScaffoldState> scaffold_Key = GlobalKey<ScaffoldState>();
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        key: scaffold_Key,
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'sections',
          showDrawerIcon: true,
          onPressedDrawer: () => scaffold_Key.currentState.openDrawer(),
        ),
        drawer: DrawerView(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: StaggeredGridView.countBuilder(
            staggeredTileBuilder: (index) => StaggeredTile.count(2, 1),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 4,
            itemCount: 12,
            itemBuilder: (_, index) {
              return AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 0,
                virticaloffset: 150,
                widget: CustomSingleSection(
                  imgSrc: 'assets/images/oxy.png',
                  title: 'عدسات أكسجين',
                  shadowColor: Theme.of(context).accentColor,
                  onTap: () {navigator.push(Routes.SECTIONS_DETAILS);},
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
