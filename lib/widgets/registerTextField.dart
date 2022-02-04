import 'package:evento/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

class RegisterTextField extends StatelessWidget {
  final String? hintText, errorText;
  final int? minLength;
  final double? hintSize;
  final bool ismaxLength, obscureText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final dynamic validationBuilder;

  RegisterTextField(
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
        this.validationBuilder,})
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
          enabledBorder: underlineInputBorder,
          hintStyle: TextStyle(fontSize: hintSize ?? 13, color: newTextColor),
          // focusedBorder: underlineInputBorder,
          // errorBorder: underlineInputBorder,
          // focusedErrorBorder: underlineInputBorder
        ),
        inputFormatters: inputFormatter,
        validator: validationBuilder ??
            ValidationBuilder().minLength(minLength ?? 3).build(),
      ),
    );
  }
   UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderSide:  const BorderSide(color: primaryColor, width: 1.2),
    borderRadius: BorderRadius.circular(0),
  );
}
