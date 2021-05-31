import 'package:flutter/material.dart';
import 'package:oxygen/theme/color.dart';

class CustomButtonFrame extends StatefulWidget {
  final double width,
      height,
      opacity,
      radius,
      topPadding,
      bottomPadding,
      rightPadding,
      leftPadding,
      fontsize;
  final String text;
  final Color color;
  final Color textColor;
  final Color framColor;
  final FontWeight fontWeight;
  final Widget title;

  const CustomButtonFrame(
      {Key key,
      this.width,
      this.height,
      this.text,
      this.opacity,
      this.radius,
      this.topPadding,
      this.bottomPadding,
      this.rightPadding,
      this.leftPadding,
      this.color,
      this.textColor,
      this.fontWeight,
      this.title,
      this.fontsize,
      this.framColor})
      : super(key: key);

  @override
  _CustomButtonFrameState createState() => _CustomButtonFrameState();
}

class _CustomButtonFrameState extends State<CustomButtonFrame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: widget.bottomPadding ?? 8,
          top: widget.topPadding ?? 8,
          left: widget.leftPadding ?? 8,
          right: widget.rightPadding ?? 8),
      child: Container(
        decoration: BoxDecoration(
            color: widget.color ??
                Theme.of(context).primaryColor.withOpacity(widget.opacity ?? 1),
            border: Border.all(
                color: widget.framColor ?? Color(lightThemeColors["primary"])),
            borderRadius: BorderRadius.circular(widget.radius ?? 10)),
        width: widget.width ?? 140,
        height: widget.height ?? 40,
        child: Center(
          child: widget.text == null
              ? widget.title
              : Text(
                  widget.text ?? "",
                  style: TextStyle(
                    color: widget.textColor ?? Theme.of(context).primaryColor,
                    fontSize: widget.fontsize ?? 15,
                    fontWeight: widget.fontWeight ?? FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
