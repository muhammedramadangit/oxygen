import 'package:flutter/material.dart';
import 'package:oxygen/theme/color.dart';

class CustomSkipBottom extends StatelessWidget {
  final Function onTap;
  final double radius = 7;
  final double height;
  final double width;
  final double rightPadding;
  final double leftPadding;
  final double topPadding;
  final double bottonPadding;

  const CustomSkipBottom({
    this.onTap,
    this.height,
    this.width,
    this.rightPadding,
    this.leftPadding,
    this.topPadding,
    this.bottonPadding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 25,
        height: height ?? 25,
        margin: EdgeInsets.only(
          right: rightPadding ?? 15,
          left: leftPadding ?? 15,
          top: topPadding ?? 15,
          bottom: bottonPadding ?? 15,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/icons/skip.png',
            width: width ?? 25,
            height: height ?? 25,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
