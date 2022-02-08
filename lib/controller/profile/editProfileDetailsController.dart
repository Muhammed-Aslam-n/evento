// import 'dart:io';
// import 'package:evento/api_helper/models/profile/profileUpdateModel.dart';
// import 'package:evento/api_helper/models/profile/show_whole_profile_model.dart';
// import 'package:evento/api_helper/services/profile/profile_updation/profile_updation_api.dart';
// import 'package:evento/api_helper/services/profile/show_profile_api.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class EditProfileDetailsController extends GetxController{
//
//   static EditProfileDetailsController editProfileDetailsController = Get.find();
//   static FlutterSecureStorage secureStorage = const FlutterSecureStorage();
//
//   VendorWholeDetails? model;
//
//   TextEditingController usernameController = TextEditingController().obs();
//   TextEditingController placeController = TextEditingController().obs();
//   TextEditingController cityController = TextEditingController().obs();
//   TextEditingController zipCodeController = TextEditingController().obs();
//   TextEditingController userStateController = TextEditingController().obs();
//   TextEditingController descriptionController = TextEditingController().obs();
//
//   dynamic profileString = "";
//
//   Future fetchVendorWholeDetailsForUpdation() async{
//     model =  await ShowWholeProfileAPI().fetchVendorWholeProfileDetails();
//     // debugPrint("On Init Mode of ProfileDetails Show page is  ${model?.profilePicture}");
//     showVendorWholeDetailsForUpdation();
//   }
//
//
//   showVendorWholeDetailsForUpdation(){
//
//     usernameController.text = model?.name as String;
//     placeController.text = model?.place as String;
//     profileString = model?.profilePicture;
//     cityController.text = model?.city as String;
//     userStateController.text = model?.state as String;
//     zipCodeController.text = model?.pincode as String;
//     userSelectedProfession = model?.category as String;
//     descriptionController.text = model?.description as String;
//     debugPrint("${descriptionController.text},${userSelectedProfession},${cityController.text},${profileString},${userStateController.text},${descriptionController.text}");
//
//     update(["UpdateWholeProfile"]);
//   }
//
//
//
//   File file = File('');
//   getVendorProfilePicture() async {
//     XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     file = File(xFile!.path);
//     profileString = file;
//     debugPrint("New FILE IS $file and runtime type is ${file.runtimeType}");
//     update(['vendorUpdateProfilePictureSelection']);
//   }
//
//   final professionList = [
//     'Photography',
//     'Make Up',
//     'Decoration',
//     'Mehndi',
//     'Wedding Card',
//     'Catering'
//   ];
//   String? userSelectedProfession;
//
//   changeDropdownItem(value) {
//     userSelectedProfession = value;
//     update(['dropDownItem']);
//   }
//
//
//   List<String> planDetails = ['Yearly','1188'];
//
//   sendProfileUpdateValues(){
//     debugPrint("Getting FILE in sendProfile is $profileString");
//     final profileUpdateMethod = VendorUpdateProfileModel(
//       name: usernameController.text,
//       category: userSelectedProfession,
//       city: cityController.text,
//       pincode: zipCodeController.text,
//       place: placeController.text,
//       state: userStateController.text,
//       description: descriptionController.text,
//       profilePicture: File(profileString),
//     );
//     UpdateProfileAPI().updateWholeProfile(profileUpdateMethod);
//   }

// }




import 'dart:io';

import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/models/profile/profileUpdateModel.dart';
import 'package:evento/api_helper/models/profile/show_whole_profile_model.dart';
import 'package:evento/api_helper/services/profile/profile_updation/profile_updation_api.dart';
import 'package:evento/api_helper/services/profile/show_profile_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends GetxController{

  static EditProfile editProfile = Get.find();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  String? logStatus;

  @override
  void onInit() {
    checkLogStatus();
    super.onInit();
  }

  Future checkLogStatus() async {
    logStatus = await secureStorage.read(key: didUserLoggedKey);
    if (logStatus == loggedStatus) {
      model = await ShowWholeProfileAPI().fetchVendorWholeProfileDetails();
      showVendorDetails();
    }
  }

  VendorWholeDetails? model;

  TextEditingController usernameController = TextEditingController().obs();
  TextEditingController placeController = TextEditingController().obs();
  TextEditingController cityController = TextEditingController().obs();
  TextEditingController zipCodeController = TextEditingController().obs();
  TextEditingController userStateController = TextEditingController().obs();
  TextEditingController descriptionController = TextEditingController().obs();

  dynamic profileString = "";

  Future fetchVendorWholeDetailsForUpdation() async{
    model =  await ShowWholeProfileAPI().fetchVendorWholeProfileDetails();
    showVendorDetails();
  }

  showVendorDetails(){
    usernameController.text = model?.name??"nothingYet";
    placeController.text = model?.place??'nothingYet';
    profileString = model?.profilePicture;
    cityController.text = model?.city ??'nothingYet';
    userStateController.text = model?.state ??'nothingYet';
    zipCodeController.text = model?.pincode ??'nothingYet';
    userSelectedProfession = model?.category??'nothingYet';
    descriptionController.text = model?.description ??'nothingYet';

    update(["UpdateWholeProfile"]);

  }

  File file = File('');
  getVendorProfilePicture() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    file = File(xFile!.path);
    profileString = file;
    debugPrint("New FILE IS $file and runtime type is ${file.runtimeType}");
    update(['UpdateWholeProfile']);
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
    update(['UpdateWholeProfile']);
  }


  List<String> planDetails = ['Yearly','1188'];

  sendProfileUpdateValues(){
    debugPrint("Getting FILE in sendProfile is $profileString");
    final profileUpdateMethod = VendorUpdateProfileModel(
      name: usernameController.text,
      category: userSelectedProfession,
      city: cityController.text,
      pincode: zipCodeController.text,
      place: placeController.text,
      state: userStateController.text,
      description: descriptionController.text,
    );
    UpdateProfileAPI().updateWholeProfile(profileUpdateMethod,profileString);
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