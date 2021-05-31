import 'package:flutter/material.dart';

class CustomIconTap extends StatefulWidget {
  final Function ontap;
  final Widget widget;

  CustomIconTap({this.ontap, this.widget});

  @override
  _CustomIconTapState createState() => _CustomIconTapState();
}

class _CustomIconTapState extends State<CustomIconTap> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        child: Center(
          child: widget.widget,
        ),
      ),
    );
  }
}
