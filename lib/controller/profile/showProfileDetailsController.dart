import 'dart:io';

import 'package:evento/api_helper/services/home/profile_details_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ShowProfilesDetailsController extends GetxController{

  static ShowProfilesDetailsController showProfilesDetailsController = Get.find();

  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  String? vendorName;
  String? vendorPlace;
  String? vendorProfilePicture;
  String? vendorCity;
  String? vendorState;
  String? vendorPincode;
  String? vendorProfession;


  fetchVendorDetails() async{
    vendorName = await secureStorage.read(key: vendorNameKey);
    vendorPlace = await secureStorage.read(key: vendorPlaceKey);
    vendorProfilePicture = await secureStorage.read(key: vendorProfileURLKey);
    vendorCity = await secureStorage.read(key: vendorCityKey);
    vendorState = await secureStorage.read(key: vendorStateKey);
    vendorPincode = await secureStorage.read(key: vendorPincodeKey);
    vendorProfession = await secureStorage.read(key: vendorProfessionKey);
    update();
  }

  // ShowCase image Updating
  File? file = File('');

  List<dynamic> showCaseImages = <dynamic>[
    'assets/images/showCaseImage/ShowCase1.jfif',
    'assets/images/showCaseImage/ShowCase2.jfif',
    'assets/images/showCaseImage/ShowCase3.jfif',
    'assets/images/showCaseImage/ShowCase4.jfif',
    'assets/images/showCaseImage/ShowCase5.jfif',
    'assets/images/showCaseImage/ShowCase6.jfif',
  ].obs();

  pickImage({required int index, required file}) async {
    // XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // file = File(xfile!.path);
    showCaseImages.insert(index, file);
    update(['showCaseSection']);
  }





}