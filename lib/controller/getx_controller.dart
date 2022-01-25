import 'dart:io';

import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/screen/screen_main/chat/evento_chat.dart';
import 'package:evento/screen/screen_main/home/home_pages/evento_home.dart';
import 'package:evento/screen/screen_main/profile/evento_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class EventoController extends GetxController {
  static EventoController eventoController = Get.find();

  @override
  void onInit() async {
    prefs = await _prefs;
    prefs.clear();
    checkAppLaunched();

    super.onInit();
  }

  //--------------------------------------------------------------------------------
  // Section to check whether the user launching this Application for the first time or not

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  bool? isAppLaunched = false;

  setAppLaunched() async {
    await prefs.setBool(sharedPrefKey, true).then((value) {
      var k = prefs.getBool(sharedPrefKey);
      debugPrint("SharedPreference Collected${k.toString()}");
    });
  }

  checkAppLaunched() async {
    isAppLaunched = prefs.getBool(sharedPrefKey);
    debugPrint(
        "value from SharedPreference is ${isAppLaunched.toString()} You may be set clear() before this function poyi ath sheriyaakk");
  }

  // -----------------------------------------------------------------------------

  // Section to Handle all the User Login / Register  Authentication

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  // SignUp Section TextEditingControllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();

  final professionList = [
    'Photography',
    'Make Up',
    'Decoration',
    'Mehndi',
    'Wedding Card',
    'Catering'
  ];
  String userSelectedProfession = 'Photography'.obs();

  changeDropdownItem(value) {
    userSelectedProfession = value;
    update(['dropDownItem']);
  }

  TextEditingController placeController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController userStateController = TextEditingController();

  int userSelectedProfessionValue = 2;

  changeSubscriptionMode(value) {
    userSelectedProfessionValue = value;
    update(['subscriptionSection']);
  }

  int subscriptionMethodValue = 1;

  changeSubscriptionMethod(value) {
    subscriptionMethodValue = value;
    update(['subscriptionMethod']);
  }

// Home BottomNavigation Items
  int? initialIndex = 0.obs();
  final navigationBarIcons = <Widget>[
    const Icon(
      Icons.home_filled,
      color: primaryTextColor,
    ),
    const Icon(
      Icons.chat_bubble_outline,
      color: primaryTextColor,
    ),
    const Icon(
      Icons.person,
      color: primaryTextColor,
    ),
  ];

  changeInitialIndex(index) {
    initialIndex = index;
    update(['btmNavigation']);
  }

  List mainScreens = [
    const EventoHome(),
    const EventoChat(),
    const EventoProfile(),
  ];

// OrderDetailsPlaceHolders

  String? orderedUserUrl = ''.obs();
  String? orderedUserName = ''.obs();

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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

  pickImage({required int index,required file}) async {
    // XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // file = File(xfile!.path);
    showCaseImages.insert(index, file);
    update(['showCaseSection']);
  }

// Vendor Profile Updating

  // Vendor Description Updating
  TextEditingController descriptionController = TextEditingController().obs();

  // Vendor Username Updating

  TextEditingController currentUsernameController =
      TextEditingController().obs();
  TextEditingController newUsernameController = TextEditingController().obs();

  // Vendor Password Updating
  TextEditingController newPasswordController = TextEditingController().obs();



  // Feedback Section

  TextEditingController feedbackController = TextEditingController().obs();

  clearFeedbackController(){
    feedbackController.clear();
  }








  commonSnackBar(title, message) {
    Get.snackbar(
      title,
      message,
      borderRadius: 12,
      isDismissible: true,
      backgroundColor: const Color(0xFFF8F8F8),
      colorText: greenColor,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      snackPosition: SnackPosition.BOTTOM,
    );
  }



  clearLoginControllers(){
    emailEditingController.clear();
    passwordEditingController.clear();
  }

  clearSignup2Controllers(){
    phoneNumberController.clear();
    emailEditingController.clear();
    passwordEditingController.clear();
    confirmPasswordEditingController.clear();
  }

  clearProfileControllers() {
    firstNameController.clear();
    placeController.clear();
    cityEditingController.clear();
    districtController.clear();
    userStateController.clear();
  }

  clearDescriptionController() {
    descriptionController.clear();
  }

  clearUsernameUpdatingControllers() {
    userNameController.clear();
    newUsernameController.clear();
  }

  clearUpdatePasswordControllers() {
    passwordEditingController.clear();
    newPasswordController.clear();
  }
}
