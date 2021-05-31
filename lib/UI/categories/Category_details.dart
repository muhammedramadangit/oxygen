import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomBottomSheet.dart';
import 'package:oxygen/UI/main/home/components/slider.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/UI/categories/components/shareSheet.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryName, imgSrc;

  const CategoryDetails({this.categoryName, this.imgSrc});

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  bool _isFaved = false;
  String _selecedItem;

  void _shareOptions() {
    CustomSheet(
      context: context,
      height: MediaQuery.of(context).size.height / 2.2,
      widget: Directionality(
        textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: AnimatedWidgets(
          duration: 1.5,
          horizontalOffset: 0,
          virticaloffset: 50,
          widget: ShareSheet(),
        ),
      ),
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selecedItem = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: widget.categoryName,
          showShareIcon: true,
          onPressedShareIcon: () {
            _shareOptions();
          },
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //=============== image Slider =============
                  ImageSlider(
                    showDetails: false,
                    sliderImgSrc: AssetImage(widget.imgSrc),
                  ),

                  //================ Category Details =================
                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 50,
                    virticaloffset: 0,
                    widget: Container(
                      height: MediaQuery.of(context).size.height / 4.7,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                translator.translate(widget.categoryName),
                                style: TextStyle(
                                  color: Color(lightThemeColors['text-head']),
                                  fontSize: 20,
                                  fontFamily: 'JannaLT-Bold',
                                ),
                              ),
                              _isFaved == false
                                  ? Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${translator.translate("available")} 5 ${translator.translate("pieces")}",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width /
                                          4.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xffC8C8C8),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          translator.translate("not_available"),
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                              //================= Rating Bar ======================
                              Row(
                                children: [
                                  RatingBar.builder(
                                    itemSize: 25,
                                    initialRating: 3,
                                    minRating: 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    unratedColor: Colors.grey[300],
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1),
                                    itemBuilder: (context, _) {
                                      return Image.asset(
                                          "assets/images/icons/starac.png");
                                    },
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  //SizedBox(width: 10),
                                  FlatButton(
                                    onPressed: () {
                                      navigator.push(Routes.RATES_PAGE);
                                    },
                                    child: Text(
                                      '${translator.translate('rates')} (45)',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15,
                                        fontFamily: 'JannaLT-Bold',
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                          //============== Favourite Icon ====================
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isFaved = !_isFaved;
                                    print('يابا احلى وش الغضب عليك !!');
                                  });
                                },
                                child: Container(
                                  child: _isFaved == false
                                      ? customImageContainer(
                                          imgSrc:
                                              'assets/images/icons/addtfave.png',
                                          containerHeight: 70,
                                          containerWidth: 70,
                                          imageHeight: 70,
                                          imageWidth: 70,
                                        )
                                      : customImageContainer(
                                          imgSrc:
                                              'assets/images/icons/fullfaved.png',
                                          containerHeight: 70,
                                          containerWidth: 70,
                                          imageHeight: 70,
                                          imageWidth: 70,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Divider(),

                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 50,
                    virticaloffset: 0,
                    widget: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translator.translate('product_description'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-head']),
                              fontSize: 18,
                              fontFamily: 'JannaLT-Bold',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            translator.translate(
                                'هذا النص هو مثال لنص يمكن ان يستبدل فى نفس المساحة لقد تم توليد هذا النص من مولد النص العربي، حيث يمكنك توليد مثل هذا النص أو العديد من النصوص الاخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق'),
                            style: TextStyle(
                              color: Color(lightThemeColors['text-body']),
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //=================== Add to cart ==========================
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 0,
                virticaloffset: 50,
                widget: Container(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "250 ",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18,
                                      fontFamily: 'JannaLT-Bold',
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${translator.translate("sar")}",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 13,
                                      fontFamily: 'JannaLT-Bold',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "250 ",
                                    style: TextStyle(
                                      color:
                                          Color(lightThemeColors['text-body']),
                                      fontSize: 18,
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: 'JannaLT-Regular',
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${translator.translate("sar")}",
                                    style: TextStyle(
                                      color:
                                          Color(lightThemeColors['text-body']),
                                      fontSize: 13,
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: 'JannaLT-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          navigator.push(Routes.MAIN_PAGE, arguments: 1);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 2.2,
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: language == "ar"
                                  ? BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    )
                                  : BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    )),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                customImageContainer(imgSrc: 'assets/images/icons/cart.png'),
                                Text(
                                  translator.translate('add_to_cart'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
