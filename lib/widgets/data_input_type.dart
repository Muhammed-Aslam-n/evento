import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

class DataInputField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final int? minLength, maxLength;
  final double? hintSize, sbHeight;
  final bool obscureText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const DataInputField(
      {Key? key,
        this.labelText,
        this.hintText,
        this.minLength,
        this.maxLength,
        this.hintSize,
        this.obscureText = false,
        this.controller,
        this.textInputType,
        this.prefixIcon,
        this.sbHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sbHeight ?? 60.h,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.name,
        enableSuggestions: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: bssBorderStyle,
            enabledBorder: bssBorderStyle,
            focusedErrorBorder: bssBorderStyle,
            errorBorder: bssBorderStyle,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hintText,
            prefixIcon: Icon(
              prefixIcon,
              color: primaryTextColor,
            ),
            hintStyle: TextStyle(fontSize: hintSize ?? 12),
            filled: true,
            fillColor: Colors.white70,
            focusColor: primaryTextColor,
            prefixIconColor: primaryTextColor),
        validator: ValidationBuilder()
            .minLength(minLength ?? 3)
            .maxLength(maxLength ?? 150)
            .build(),
      ),
    );
  }
}
