import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/categories/Category_Item.dart';

class CosmeticsList extends StatefulWidget {
  @override
  _CosmeticsListState createState() => _CosmeticsListState();
}

class _CosmeticsListState extends State<CosmeticsList> {
  final String language = translator.currentLanguage;
  
  List<Map<String, dynamic>> _itemList = [
    {
      "imgSrc": "assets/images/6.png",
      "name": "Duo Leo",
      "title": "كريم مرطب - ديو ليو",
      "subTitle": "هذا النص تجريبي لاختيار شكل",
      "cost": "250 ",
      "onTapCategory": () {},
      "onTapCart": () {},
    },
    {
      "imgSrc": "assets/images/7.png",
      "name": "Benrova",
      "title": "كريم بنروفا - مرطب للجمال",
      "subTitle": "هذا النص تجريبي لاختيار شكل",
      "cost": "250 ",
      "onTapCategory": () {},
      "onTapCart": () {},
    },
    {
      "imgSrc": "assets/images/6.png",
      "name": "Duo Leo",
      "title": "كريم مرطب - ديو ليو",
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
