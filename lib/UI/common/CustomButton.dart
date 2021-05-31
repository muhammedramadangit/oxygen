import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double width, height, opacity ,radius ,topPadding, bottomPadding , rightPadding, leftPadding, fontsize;
  final String text;
  final Color color ;
  final Color textColor ;
  final FontWeight fontWeight ;
  final Widget title ;

  const CustomButton({Key key, this.width, this.height, this.text, this.opacity, this.radius, this.topPadding, this.bottomPadding, this.rightPadding, this.leftPadding, this.color, this.textColor, this.fontWeight, this.title, this.fontsize})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: widget.bottomPadding ?? 8 , top: widget.topPadding ?? 8 , left: widget.leftPadding??8 , right:  widget.rightPadding ?? 8 ),
      child: Container(
        decoration: BoxDecoration(
            color:widget.color?? Theme.of(context)
                .primaryColor
                .withOpacity(widget.opacity ?? 1),
            borderRadius: BorderRadius.circular(widget.radius??10)),
        width: widget.width ?? 140,
        height: widget.height ?? 40,
        child: Center(
          child: widget.text==null  ?widget.title :Text(
            widget.text ?? "",
            style: TextStyle(
                color: widget.textColor ?? Colors.white, fontSize: widget.fontsize ?? 15, fontWeight:widget.fontWeight??  FontWeight.bold,),
          ),
        ),
      ),
    );
  }
}
