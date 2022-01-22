import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<File?> pickMedia({
    @required bool? isGallery,
    Future<File?> Function(File file)? cropImage,
  }) async {
    final source = isGallery??true ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return File(pickedFile!.path);

    if (cropImage == null) {
      debugPrint("-----------Returning This IF-----------");
      return File(pickedFile.path);
    } else {
      final File file = File(pickedFile.path);
      debugPrint("-----------Returning This ELSE-----------${file.path.toString()}");
      return cropImage(file);
    }
  }
}