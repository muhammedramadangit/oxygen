import 'package:flutter/material.dart';

void CustomSheet({BuildContext context, Widget widget, double height}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          child: Container(
            height: height ?? MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/icons/dash.png',width: 60, fit: BoxFit.cover,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 15),
                      //height: height ?? MediaQuery.of(context).size.height / 2 - 40,
                      child: widget,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
