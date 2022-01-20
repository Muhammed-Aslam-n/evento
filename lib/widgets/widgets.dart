import 'package:evento/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

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

class DataTextFields extends StatelessWidget {
  final String? hintText, errorText;
  final int? minLength,maxLength;
  final bool ismaxLength,obscureText;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const DataTextFields(
      {Key? key,
        this.hintText,
        this.errorText,
        this.controller,
        this.minLength,
        this.ismaxLength = false, this.textInputType, this.maxLength,this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType??TextInputType.name,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          focusedBorder:const UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 1.0),
          ),
        ),
        validator: Validators.compose(
          [
            Validators.required("$hintText is required"),
            Validators.minLength(
                minLength ?? 1,"$hintText must be greater than $minLength characters"),
            ismaxLength
                ? Validators.maxLength(maxLength??3,"$hintText must be less than ${maxLength??3} digits")
                : Validators.maxLength(150,"$hintText must be less than 150")
          ],
        ),
      ),
    );
  }
}
