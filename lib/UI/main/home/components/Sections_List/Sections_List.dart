import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/CustomSingleSection.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';

class SectionsList extends StatefulWidget {
  @override
  _SectionsListState createState() => _SectionsListState();
}

class _SectionsListState extends State<SectionsList> {
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  List<Map<String, dynamic>> _itemList = [
    {
      "imgSrc": "assets/images/oxy.png",
      "title": "عدسات أكسجين",
      "color": Color(lightThemeColors['secondary']),
      "onTap": () {},
    },
    {
      "imgSrc": "assets/images/bure.png",
      "title": "عدسات بيوربلس",
      "color": Color(lightThemeColors['primary']),
      "onTap": () {},
    },
    {
      "imgSrc": "assets/images/cosmotics.png",
      "title": "مستحضرات تجميل",
      "color": Color(0xffff0000),
      "onTap": () {},
    },
    {
      "imgSrc": "assets/images/cosmotics-3.png",
      "title": "عطور",
      "color": Color(lightThemeColors['primary']),
      "onTap": () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      child: ListView.builder(
        padding: translator.currentLanguage == "ar" ? EdgeInsets.only(right: 10) : EdgeInsets.only(left: 10),
        itemCount: _itemList.length,
        scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            return CustomSingleSection(
              imgSrc: _itemList[index]['imgSrc'],
              title:  _itemList[index]['title'],
              shadowColor: _itemList[index]['color'],
              onTap: (){navigator.push(Routes.SECTIONS_DETAILS);},
              margin: 5,
            );
          },
      ),
    );
  }
}
