import 'package:evento/api_helper/services/home/home_api_service.dart';
import 'package:evento/api_helper/services/home/profile_details_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  static HomeController homeController = Get.find();
  static const secureStorage = FlutterSecureStorage();
  String? vendorName = ''.obs();
  String? vendorProfileURL = ''.obs();

  @override
  void onInit() {
    super.onInit();
  }

  void showVendorDetails() async{
    debugPrint('showVendorDetails(): Called to Show Details');
    vendorName = await secureStorage.read(key: vendorNameKey);
    vendorProfileURL = await secureStorage.read(key: vendorProfileURLKey);
    debugPrint('showVendorDetails(): $vendorName');
    debugPrint('showVendorDetails(): $vendorProfileURL');
    update();
  }




}