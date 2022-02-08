import 'dart:io';
import 'package:evento/api_helper/models/profile_setup_model.dart';
import 'package:evento/api_helper/services/setup_profile_api/setup_profile_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupController extends GetxController{

  static ProfileSetupController setupProfileController = Get.find();

  TextEditingController usernameController = TextEditingController(text: "Aslam").obs();
  TextEditingController placeController = TextEditingController(text: "Atholi").obs();
  TextEditingController cityController = TextEditingController(text: "Atholi").obs();
  TextEditingController zipCodeController = TextEditingController(text: "673315").obs();
  TextEditingController userStateController = TextEditingController(text: "Kerala").obs();
  TextEditingController descriptionController = TextEditingController(text: "HIIIIII ALLL I AM SUPER STAAAR......").obs();

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

  int userSelectedProfessionValue = 2;

  changeSubscriptionMode(value) {
    userSelectedProfessionValue = value;
    update(['subscriptionSection']);
  }

  List<String> planDetails = ['Yearly','1188'];

  sendProfileSetupValues(){
    final profileSetupMethod = VendorProfileSetup(
      fullName: usernameController.text,
      category: userSelectedProfession,
      city: cityController.text,
      pincode: zipCodeController.text,
      place: placeController.text,
      state: userStateController.text,
      description: descriptionController.text,
      subscriptionType: planDetails[0],
      subscriptionAmount: planDetails[1],
    );
    SetupProfileAPI().setupVendorProfile(vendorProfileSetupModel: profileSetupMethod, imageFile: file);
  }


  clearProfileControllers(){
    usernameController.clear();
    placeController.clear();
    cityController.clear();
    zipCodeController.clear();
    userStateController.clear();
  }

  @override
  void dispose() {
    usernameController.dispose();
    placeController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    userStateController.dispose();
    super.dispose();
  }


}