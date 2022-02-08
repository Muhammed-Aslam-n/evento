import 'dart:io';

import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/models/profile/show_whole_profile_model.dart';
import 'package:evento/api_helper/services/profile/profile_updation/profile_updation_api.dart';
import 'package:evento/api_helper/services/profile/show_profile_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ShowProfilesDetailsController extends GetxController{

  static ShowProfilesDetailsController showProfilesDetailsController = Get.find();

  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();


  @override
  void onInit(){
    checkLogStatus();
    super.onInit();
  }


  VendorWholeDetails? model;

  String? vendorName;
  String? vendorPlace;
  String? vendorProfilePicture;
  String? vendorCity;
  String? vendorState;
  String? vendorPincode;
  String? vendorProfession;
  String? logStatus;

  Future checkLogStatus() async{
    logStatus = await secureStorage.read(key: didUserLoggedKey);
    if(logStatus == loggedStatus){
      model =  await ShowWholeProfileAPI().fetchVendorWholeProfileDetails();
      debugPrint("On Init Mode of ProfileDetails Show page is  ${model?.profilePicture}");
      showVendorWholeDetails();
    }
  }
  // List<dynamic> sample = List.generate(6, (index) => '').obs();
  showVendorWholeDetails() async{
    vendorName = model?.name;
    vendorPlace = model?.place;
    vendorProfilePicture = model?.profilePicture;
    vendorCity = model?.city;
    vendorState = model?.state;
    vendorPincode = model?.pincode;
    vendorProfession = model?.category;
    showCaseImages[0] = model?.showCase1??'';
    showCaseImages[1] = model?.showCase2??'';
    showCaseImages[2] = model?.showCase3??'';
    showCaseImages[3] = model?.showCase4??'';
    showCaseImages[4] = model?.showCase5??'';
    update();
  }

  // ShowCase image Updating
  File? file = File('');

  List<dynamic> showCaseImages = List.generate(6, (index) => '').obs();

  displayUploadedImage({required int index, required File file}) async {
    showCaseImages[index] = file.path;
    debugPrint("After adding is $showCaseImages");
    update(['showCaseSection']);
  }


  updateShowcaseImage(file, index){
    UpdateProfileAPI().updateShowCase(file, index);
  }






}