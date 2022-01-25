
import 'package:evento/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

class DataTextFields extends StatelessWidget {
  final String? hintText, errorText;
  final int? minLength, maxLength;
  final double? hintSize;
  final bool ismaxLength, obscureText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final dynamic validationBuilder;

  const DataTextFields(
      {Key? key,
        this.hintText,
        this.errorText,
        this.controller,
        this.minLength,
        this.ismaxLength = false,
        this.textInputType,
        this.maxLength,
        this.obscureText = false,
        this.hintSize,
        this.inputFormatter,
        this.validationBuilder})
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
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(fontSize: hintSize ?? 12),
          focusedBorder:  const UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 1.0),
          ),
        ),
        inputFormatters: inputFormatter,
        validator: validationBuilder ??
            ValidationBuilder().minLength(minLength ?? 3).build(),
      ),
    );
  }
}