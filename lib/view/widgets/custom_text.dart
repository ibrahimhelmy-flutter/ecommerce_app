import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;
  final int maxLine;
  final double height;
  const CustomText({
    Key key,
    this.text = "",
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.fontWeight,
    this.maxLine,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            height: height),
        maxLines: maxLine,
      ),
    );
  }
}
