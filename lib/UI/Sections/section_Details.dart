import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/categories/Category_Item.dart';

class SectionDetails extends StatefulWidget {
  final String sectionTitle;

  const SectionDetails({this.sectionTitle});

  @override
  _SectionDetailsState createState() => _SectionDetailsState();
}

class _SectionDetailsState extends State<SectionDetails> {
  GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();
  final String language = translator.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        key: scaffold_key,
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'عدسات أكسجين',
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: StaggeredGridView.countBuilder(
            staggeredTileBuilder: (index) => StaggeredTile.count(2, 2.4),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 4,
            itemCount: 6,
            itemBuilder: (_, index) {
              return AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 0,
                virticaloffset: 150,
                widget: CategoryItem(
                  imgSrc: "assets/images/1.png",
                  name: "De Oro",
                  title: "عدسات طبية - دي أوريو",
                  subTitle: "هذا النص تجريبي لاختيار شكل",
                  cost: "250 ",
                  onTapCategory: () {},
                  onTapCart: () {},
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
