import 'package:evento/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

commonSnackBar(
    {String? title, String? message, Color? color, Color? bgColor}) async {
  Get.snackbar(
    title ?? '',
    message ?? '',
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    snackPosition: SnackPosition.BOTTOM,
    colorText: color ?? const Color(0xFF58BC8A),
    backgroundColor: bgColor ?? whiteColor,
  );
}