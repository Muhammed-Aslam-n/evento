import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/models/home/short_detail_model.dart';
import 'package:evento/api_helper/services/home/home_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  Future onInit() async {
     await checkLogStatus();
    super.onInit();
  }

  static HomeController homeController = Get.find();
  static const secureStorage = FlutterSecureStorage();
  String? vendorName;
  String? vendorProfileURL;
  String? logStatus;
  VendorShortDetails? model;

  checkLogStatus() async {

    logStatus = await secureStorage.read(key: didUserLoggedKey);
    if (logStatus == loggedStatus) {
      model = await HomeControllerAPI().fetchVendorProfileDetails();
      vendorName = model?.name;
      vendorProfileURL = model?.profilePicture;
      debugPrint("Function Called after Registering also and The Resultant value is ${model!.name}, and ${model!.profilePicture} in CheckLog ");
      update();
    }
  }

}
