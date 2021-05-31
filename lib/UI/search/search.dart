import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/UI/categories/Category_Item.dart';
import 'package:oxygen/theme/color.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();
  final String language = translator.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        key: scaffold_key,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          leadingWidth: 0,
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: CustomTextField(
              horizontalPadding: 10,
              labelSize: 12,
              leftPadding: 0,
              rightPadding: 0,
              secureText: false,
              label: translator.translate("search_what_you_want"),
              inputType: TextInputType.text,
              prefixIcon: Container(
                height: 25,
                width: 25,
                child: Center(
                  child: Image.asset(
                    'assets/images/icons/search.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                    color: Color(0xFFC8C8C8),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            InkWell(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 12),
                child: customImageContainer(
                    imgSrc: 'assets/images/icons/clear.png'),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Column(
            children: [
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50,
                virticaloffset: 0,
                widget: Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'نتائج البحث ',
                              style: TextStyle(
                                color: Color(lightThemeColors['text-head']),
                                fontSize: 18,
                                fontFamily: 'JannaLT-Bold',
                              ),
                            ),
                            TextSpan(
                              text: "( 15 )",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                                fontFamily: 'JannaLT-Bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: StaggeredGridView.countBuilder(
                    staggeredTileBuilder: (index) =>
                        StaggeredTile.count(2, 2.4),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 4,
                    itemCount: 4,
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
            ],
          ),
        ),
      ),
    );
  }
}
