import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/CustomBottonFrame.dart';
import 'package:oxygen/theme/color.dart';

class ImageSlider extends StatefulWidget {
  bool showDetails = true;
  AssetImage sliderImgSrc;

  ImageSlider({this.showDetails, this.sliderImgSrc});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          //height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: widget.sliderImgSrc ?? AssetImage('assets/images/slidebg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: widget.showDetails == true ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //AppLogo()
              Image(
                image: AssetImage('assets/images/logo1.png'),
                color: Colors.white,
                height: 40,
                width: MediaQuery.of(context).size.width / 3.5,
              ),

              Text(
                translator.translate("your_eyes_talk_about_you"),
                style: TextStyle(
                  color: Color(lightThemeColors['secondary']),
                  fontFamily: 'JannaLT-Bold',
                  fontSize: 18,
                ),
              ),

              InkWell(
                onTap: () {},
                child: CustomButtonFrame(
                  text: translator.translate("browse_products"),
                  color: Colors.transparent,
                  textColor: Colors.white,
                  framColor: Colors.white,
                  fontsize: 12,
                  height: 35,
                  width: MediaQuery.of(context).size.width / 3.5,
                  topPadding: 0,
                  bottomPadding: 0,
                  leftPadding: 0,
                  rightPadding: 0,
                ),
              ),
            ],
          ) : Container(),
        ),
      ],
      options: CarouselOptions(
          viewportFraction: 0.9,
          autoPlay: true,
          height: MediaQuery.of(context).size.height / 4,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
    );
  }
}

/* import 'package:oxygen/models/home/slider/slider_model.dart';
import 'package:oxygen/ui/common/cached_Image.component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<SliderBanners> imgList ;

  const ImageSlider({Key key, this.imgList}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  int _current = 0 ;

  @override
  Widget build(BuildContext context) {
    return   Column(
        children: [
          CarouselSlider(
            items: widget.imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedImage(
                    photoUrl: i.image,
                    loaderDimension: 40,
                    errorWidget: Icon(Icons.error),
                   imageWidget: Container(
                     alignment: Alignment.center,
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 50),
                       child: Text(i.title,textAlign: TextAlign.center,),
                     ),
                     margin: EdgeInsets.symmetric(horizontal: 5.0),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       image: DecorationImage(image: NetworkImage(i.image),fit: BoxFit.cover),
                     ),
                   ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 0.9,
                autoPlay: true,
                height: MediaQuery.of(context).size.height/4.5,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgList.map((url) {
              int index = widget.imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Theme.of(context).primaryColor
                      : Colors.grey[400],
                ),
              );
            }).toList(),
          ),
        ]
    );
  }
}
 */
