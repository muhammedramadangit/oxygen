import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CustomSingleSection extends StatefulWidget {
  final String imgSrc, title;
  final Color shadowColor;
  final Function onTap;
  double margin;

  CustomSingleSection({this.imgSrc, this.title, this.shadowColor, this.margin, this.onTap});

  @override
  _CustomSingleSectionState createState() => _CustomSingleSectionState();
}

class _CustomSingleSectionState extends State<CustomSingleSection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width / 2.2,
        margin: EdgeInsets.all(widget.margin ?? 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Image.asset(
                widget.imgSrc,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: widget.shadowColor.withOpacity(0.5),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  translator.translate(widget.title),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'JannaLT-Bold',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
