import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfile extends GetxController{

  static UpdateProfile updateProfileController = Get.find();

  // Profile Setup Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController userStateController = TextEditingController();








  clearProfileControllers() {
    nameController.clear();
    placeController.clear();
    cityEditingController.clear();
    districtController.clear();
    userStateController.clear();
  }

}