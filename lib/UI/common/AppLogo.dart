import 'package:flutter/material.dart';
import 'package:oxygen/theme/color.dart';

class AppLogo extends StatelessWidget {
  final double height;
  final double width;

  AppLogo({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 80,
      width: width ?? 200,
      child: Center(
        child: Image(
          image: AssetImage('assets/images/logo1.png'),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height / 4,
        ),
      ),
    );
  }
}
