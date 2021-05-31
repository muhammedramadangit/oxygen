import 'package:flutter/material.dart';

Widget customImageContainer({
  double containerHeight,
  double containerWidth,
  double imageHeight,
  double imageWidth,
  String imgSrc,
}) {
  return Container(
    height: containerHeight ?? 25,
    width: containerWidth ?? 25,
    child: Center(
      child: Image.asset(
        imgSrc,
        height: imageHeight ?? 25,
        width: imageWidth ?? 25,
        fit: BoxFit.cover,
      ),
    ),
  );
}
