import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class RateItem extends StatelessWidget {
  final String name;
  final String comment;
  final double rate;

  const RateItem({this.name, this.comment, this.rate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    rate.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'JannaLT-Bold',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 6.5,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        translator.translate(name),
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 15,
                          fontFamily: 'JannaLT-Bold',
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: rate,
                        itemSize: 25,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        unratedColor: Colors.grey[300],
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) {
                          return Image.asset(
                              "assets/images/icons/starac.png");
                        },
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        translator.translate(comment),
                        style: TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
