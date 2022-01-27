import 'package:evento/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

class AuthTextField extends StatelessWidget {
  final String? hintText, errorText;
  final int? minLength;
  final IconData? prefixIcon;
  final double? hintSize;
  final bool ismaxLength, obscureText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final dynamic validationBuilder;

  const AuthTextField(
      {Key? key,
      this.hintText,
      this.errorText,
      this.controller,
      this.minLength,
      this.ismaxLength = false,
      this.textInputType,
      this.obscureText = false,
      this.hintSize,
      this.inputFormatter,
      this.validationBuilder,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0.h,
      width: MediaQuery.of(context).size.width * 0.87,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          errorText: errorText,
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: newTextColor, width: 0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          hintStyle: TextStyle(fontSize: hintSize ?? 13, color: newTextColor),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: primaryColor, width: 1.2),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: warningColors, width: 1.2),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: primaryColor, width: 1.2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        inputFormatters: inputFormatter,
        validator: validationBuilder ??
            ValidationBuilder().minLength(minLength ?? 3).build(),
      ),
    );
  }
}
