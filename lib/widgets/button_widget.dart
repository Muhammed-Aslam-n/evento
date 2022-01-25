import 'package:evento/constants/colors.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget commonButton(
    {text, height, width, color, textSize, textColor, onPressed}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
            Size(width ?? 250.w, height ?? 48.h)),
        backgroundColor:
        MaterialStateProperty.all<Color>(color ?? secondaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: CommonText(
        text: text,
        size: textSize ?? 20.sp,
        weight: FontWeight.w500,
        color: whiteColor,
      ),
    );