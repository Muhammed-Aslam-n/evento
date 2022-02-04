import 'dart:io';
import 'package:evento/api_helper/models/profile/profileUpdateModel.dart';
import 'package:evento/api_helper/services/home/profile_details_constants.dart';
import 'package:evento/api_helper/services/profile_updation/profile_updation_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileDetailsController extends GetxController{

  static EditProfileDetailsController editProfileDetailsController = Get.find();
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void onInit(){
    fetchVendorDetails();
    super.onInit();
  }


  static String? vendorName;
  static String? vendorPlace;
  static String? vendorProfilePicture;
  static String? vendorCity;
  static String? vendorState;
  static String? vendorPincode;
  static String? vendorProfession;
  static String? vendorDescription;

  TextEditingController usernameController = TextEditingController(text:vendorName).obs();
  TextEditingController placeController = TextEditingController(text: vendorPlace).obs();
  TextEditingController cityController = TextEditingController(text: vendorCity).obs();
  TextEditingController zipCodeController = TextEditingController(text: vendorPincode).obs();
  TextEditingController userStateController = TextEditingController(text: vendorState).obs();
  TextEditingController descriptionController = TextEditingController(text: vendorDescription).obs();

  fetchVendorDetails() async{
    vendorName = await secureStorage.read(key: vendorNameKey);
    vendorPlace = await secureStorage.read(key: vendorPlaceKey);
    vendorProfilePicture = await secureStorage.read(key: vendorProfileURLKey);
    vendorCity = await secureStorage.read(key: vendorCityKey);
    vendorState = await secureStorage.read(key: vendorStateKey);
    vendorPincode = await secureStorage.read(key: vendorPincodeKey);
    vendorProfession = await secureStorage.read(key: vendorProfessionKey);
    vendorDescription = await secureStorage.read(key: vendorDescription.toString());

    update();
  }



  File file = File('');
  getVendorProfilePicture() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    file = File(xFile!.path);
    update(['vendorProfilePictureSelection']);
  }

  final professionList = [
    'Photography',
    'Make Up',
    'Decoration',
    'Mehndi',
    'Wedding Card',
    'Catering'
  ];
  String? userSelectedProfession;

  changeDropdownItem(value) {
    userSelectedProfession = value;
    update(['dropDownItem']);
  }


  List<String> planDetails = ['Yearly','1188'];

  sendProfileUpdateValues(){
    final profileUpdateMethod = VendorUpdateProfileModel(
      name: usernameController.text,
      category: userSelectedProfession,
      city: cityController.text,
      pincode: zipCodeController.text,
      place: placeController.text,
      state: userStateController.text,
      description: descriptionController.text,
      profilePicture: file,
    );
    UpdateProfileAPI().updateWholeProfile(profileUpdateMethod);
  }












  clearProfileControllers(){
    usernameController.clear();
    placeController.clear();
    cityController.clear();
    zipCodeController.clear();
    userStateController.clear();
    descriptionController.clear();
  }

  @override
  void dispose() {
    usernameController.dispose();
    placeController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    userStateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}