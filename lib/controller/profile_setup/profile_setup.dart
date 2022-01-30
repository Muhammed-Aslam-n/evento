import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileSetupController extends GetxController{

  static ProfileSetupController setupProfileController = Get.find();

  TextEditingController usernameController = TextEditingController().obs();
  TextEditingController placeController = TextEditingController().obs();
  TextEditingController cityController = TextEditingController().obs();
  TextEditingController districtController = TextEditingController().obs();
  TextEditingController userStateController = TextEditingController().obs();

  clearProfileControllers(){
    usernameController.clear();
    placeController.clear();
    cityController.clear();
    districtController.clear();
    userStateController.clear();
  }








}