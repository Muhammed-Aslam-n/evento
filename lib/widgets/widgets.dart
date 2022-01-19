import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign isCenter;
  final double? height;

  const CommonText({this.text, this.weight, this.size, this.color,this.isCenter = TextAlign.left,this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontFamily: "poppins",
          color: color, fontSize: size, fontWeight: weight ?? FontWeight.w600,),textAlign: isCenter,
    );
  }
}

// class CommonText extends StatelessWidget {
//   final String? text;
//   final Color? color;
//   final double? size;
//   final FontWeight? weight;
//
//   const CommonText({this.text, this.weight, this.size, this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text ?? '',
//       style: TextStyle(
//           color: color ?? Colors.grey.shade800,
//           fontSize: size,
//           fontWeight: weight ?? FontWeight.w400),
//     );
//   }
// }

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


