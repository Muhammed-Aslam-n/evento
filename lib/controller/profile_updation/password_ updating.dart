import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePassword extends GetxController{
  static UpdatePassword updatePasswordController = Get.find();


  // Vendor Password Updating
  TextEditingController currentPassword = TextEditingController().obs();
  TextEditingController newPasswordController = TextEditingController().obs();


  clearPControllers(){
    currentPassword.clear();
    newPasswordController.clear();
  }

  @override
  void dispose() {
    currentPassword.dispose();
    newPasswordController.dispose();
    super.dispose();
  }


}