import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/UI/categories/Category_details.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class CategoryItem extends StatefulWidget {
  final String imgSrc, name, title, subTitle, cost;
  final Color barColor;
  final Function onTapCategory, onTapCart;

  const CategoryItem({
    this.imgSrc,
    this.name,
    this.title,
    this.subTitle,
    this.cost,
    this.barColor,
    this.onTapCategory,
    this.onTapCart,
  });

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  bool _isFaved = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CategoryDetails(
                      categoryName: widget.title,
                      imgSrc: widget.imgSrc,
                    )));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 3.3,
        width: MediaQuery.of(context).size.width / 2.3,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Color(lightThemeColors['text-body']),
            width: 0.1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 7,
                child: Stack(
                  children: [
                    Image.asset(
                      widget.imgSrc,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 22,
                        width: MediaQuery.of(context).size.width / 4.5,
                        decoration: BoxDecoration(
                          color: widget.barColor ??
                              Color(lightThemeColors['primary']),
                          borderRadius: language == "ar"
                              ? BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                )
                              : BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                        ),
                        child: Center(
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isFaved = !_isFaved;
                          });
                        },
                        child: _isFaved == false
                            ? Image.asset(
                                'assets/images/icons/addfave.png',
                                height: 25,
                                width: 26,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'assets/images/icons/faved.png',
                                height: 25,
                                width: 26,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Color(lightThemeColors['text-head']),
                          fontFamily: 'JannaLT-Bold',
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.subTitle,
                        style: TextStyle(
                          color: Color(lightThemeColors['text-body']),
                          fontSize: 10,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: language == "ar"
                                ? EdgeInsets.only(right: 15)
                                : EdgeInsets.only(left: 15),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.cost,
                                    style: TextStyle(
                                      color: Color(lightThemeColors['primary']),
                                      fontSize: 14,
                                      fontFamily: 'JannaLT-Bold',
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${translator.translate("sar")}",
                                    style: TextStyle(
                                      color: Color(lightThemeColors['primary']),
                                      fontSize: 10,
                                      fontFamily: 'JannaLT-Bold',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: widget.onTapCart,
                            child: Container(
                              height: 40,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Color(lightThemeColors['secondary']),
                                borderRadius: language == "ar"
                                    ? BorderRadius.only(
                                        topRight: Radius.circular(15),
                                      )
                                    : BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                      ),
                              ),
                              child: Center(
                                child: customImageContainer(
                                    imgSrc: 'assets/images/icons/cart.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
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
