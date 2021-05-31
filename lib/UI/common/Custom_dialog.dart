import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomBottonFrame.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/theme/color.dart';

class CustomDialog extends StatefulWidget {
  final String message;
  final bool showAlert;
  final Function navRoute;
  final Widget actionWidget;
  CustomDialog(
      {this.message, this.navRoute, this.showAlert, this.actionWidget});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), widget.navRoute);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedWidgets(
      duration: 1,
      horizontalOffset: 0.0,
      virticaloffset: 150.0,
      widget: CupertinoAlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.height / 3.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.showAlert == true
                  ? Image.asset('assets/images/alert.png',height: 90, fit: BoxFit.fill)
                  : Image.asset('assets/images/done.png',height: 90, width: 90, fit: BoxFit.cover),
              SizedBox(height: 30),
              Text(
                translator.translate(widget.message),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(lightThemeColors['text-head']),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "JannaLT-Bold",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
