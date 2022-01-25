import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign isCenter;
  final double? height;

  const CommonText(
      {this.text,
        this.weight,
        this.size,
        this.color,
        this.isCenter = TextAlign.left,
        this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontFamily: "poppins",
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.w600,
      ),
      textAlign: isCenter,
    );
  }
}