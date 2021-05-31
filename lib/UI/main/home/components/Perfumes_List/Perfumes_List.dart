import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/categories/Category_Item.dart';

class PerfumesList extends StatefulWidget {
  @override
  _PerfumesListState createState() => _PerfumesListState();
}

class _PerfumesListState extends State<PerfumesList> {
  List<Map<String, dynamic>> _itemList = [
    {
      "imgSrc": "assets/images/8.png",
      "name": "Jo Malone",
      "title": "عطر جو مالون",
      "subTitle": "هذا النص تجريبي لاختيار شكل",
      "cost": "250 ",
      "onTapCategory": () {},
      "onTapCart": () {},
    },
    {
      "imgSrc": "assets/images/9.png",
      "name": "Black Opium",
      "title": "عطر بلاك أوبيم",
      "subTitle": "هذا النص تجريبي لاختيار شكل",
      "cost": "250 ",
      "onTapCategory": () {},
      "onTapCart": () {},
    },
    {
      "imgSrc": "assets/images/8.png",
      "name": "Jo Malone",
      "title": "عطر جو مالون",
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
        padding: translator.currentLanguage == "ar" ? EdgeInsets.only(right: 10) : EdgeInsets.only(left: 10),
        itemCount: _itemList.length,
        scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            return CategoryItem(
            imgSrc: _itemList[index]['imgSrc'],
            name: _itemList[index]['name'],
            title: _itemList[index]['title'],
            subTitle: _itemList[index]['subTitle'],
            cost: _itemList[index]['cost'],
            onTapCategory: _itemList[index]['onTapCategory'],
            onTapCart: _itemList[index]['onTapCart'],
          );
          },
      ),
    );
  }
}
