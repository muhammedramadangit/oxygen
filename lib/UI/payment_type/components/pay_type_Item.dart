import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class PayTypeItem extends StatelessWidget {
  final Color color, textColor;
  final String title, description;
  final Function onTap;

  const PayTypeItem({this.color, this.textColor, this.title, this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).primaryColor,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              translator.translate(title),
              style: TextStyle(
                color:textColor,
                fontSize: 14,
                fontFamily: 'JannaLT-Bold',
              ),
            ),
            Text(
              translator.translate(description),
              style: TextStyle(
                color:textColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
