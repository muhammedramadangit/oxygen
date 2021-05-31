import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oxygen/theme/color.dart';

class ShareSheet extends StatefulWidget {
  @override
  _ShareSheetState createState() => _ShareSheetState();
}

class _ShareSheetState extends State<ShareSheet> {
  List<Map<String, Object>> _shareList = [
    {
      "title": "message",
      "iconImg": "assets/images/icons/messageshr.png",
      "onTap": () {},
    },
    {
      "title": "whatsapp",
      "iconImg": "assets/images/icons/whatsappshr.png",
      "onTap": () {},
    },
    {
      "title": "messenger",
      "iconImg": "assets/images/icons/messengershr.png",
      "onTap": () {},
    },
    {
      "title": "facebook",
      "iconImg": "assets/images/icons/facebookshr.png",
      "onTap": () {},
    },
    {
      "title": "instagram",
      "iconImg": "assets/images/icons/instagramshr.png",
      "onTap": () {},
    },
    {
      "title": "dribbble",
      "iconImg": "assets/images/icons/dribbbleshr.png",
      "onTap": () {},
    },
    {
      "title": "pinterest",
      "iconImg": "assets/images/icons/pinterestshr.png",
      "onTap": () {},
    },
    {
      "title": "flipboard",
      "iconImg": "assets/images/icons/flipboardshr.png",
      "onTap": () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: StaggeredGridView.countBuilder(
        staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.3),
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        crossAxisCount: 4,
        itemCount: _shareList.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              InkWell(
                onTap: _shareList[index]['onTap'],
                child: Container(
                  height: 75,
                  width: 75,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(lightThemeColors['text-body']),
                        width: 0.5),
                  ),
                  child: Center(
                      child: Image.asset(
                    _shareList[index]['iconImg'],
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              SizedBox(height: 8),
              Text(
                _shareList[index]['title'],
                style: TextStyle(
                  fontSize: 12,
                  color: Color(lightThemeColors['text-head']),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
