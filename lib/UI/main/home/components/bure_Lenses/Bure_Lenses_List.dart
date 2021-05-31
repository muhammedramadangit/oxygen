import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/categories/Category_Item.dart';
import 'package:oxygen/theme/color.dart';

class BureLensesList extends StatefulWidget {
  @override
  _BureLensesListState createState() => _BureLensesListState();
}

class _BureLensesListState extends State<BureLensesList> {
  final String language = translator.currentLanguage;
  List<Map<String, dynamic>> _itemList = [
    {
      "imgSrc": "assets/images/5.png",
      "name": "Blue",
      "title": "عدسات طبية - بلو",
      "subTitle": "هذا النص تجريبي لاختيار شكل",
      "cost": "250 ",
      "onTapCategory": () {},
      "onTapCart": () {},
    },
    {
      "imgSrc": "assets/images/5.png",
      "name": "Amarilo",
      "title": "عدسات طبية - أمارليو",
      "subTitle": "هذا النص تجريبي لاختيار شكل",
      "cost": "250 ",
      "onTapCategory": () {},
      "onTapCart": () {},
    },
    {
      "imgSrc": "assets/images/5.png",
      "name": "Amarilo",
      "title": "عدسات طبية - أمارليو",
      "subTitle": "هذا النص تجريبي لاختيار شكل",
      "cost": "250 ",
      "onTapCategory": () {},
      "onTapCart": () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.3,
      child: ListView.builder(
        padding: language == "ar" ? EdgeInsets.only(right: 10) : EdgeInsets.only(left: 10),
        itemCount: _itemList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return CategoryItem(
            imgSrc: _itemList[index]['imgSrc'],
            name: _itemList[index]['name'],
            title: _itemList[index]['title'],
            subTitle: _itemList[index]['subTitle'],
            cost: _itemList[index]['cost'],
            onTapCategory: _itemList[index]['onTapCategory'],
            onTapCart: _itemList[index]['onTapCart'],
            barColor: Color(lightThemeColors['secondary']),
          );
        },
      ),
    );
  }
}
