import 'dart:io';
import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/services/register/register_vendor.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/screen/authentication_screens/login/login_home.dart';
import 'package:evento/screen/screen_main/chat/evento_chat.dart';
import 'package:evento/screen/screen_main/holder/evento_pageholder.dart';
import 'package:evento/screen/screen_main/home/home_pages/evento_home.dart';
import 'package:evento/screen/screen_main/profile/evento_profiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class EventoController extends GetxController {
  static EventoController eventoController = Get.find();

  // Vendor Description Updating
  TextEditingController descriptionController = TextEditingController().obs();

  // Feedback Section
  TextEditingController feedbackController = TextEditingController().obs();

  @override
  void onInit() async {
    prefs = await _prefs;
    checkAppLaunched();
    await redirectToHomeOrLoginPage();
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
        "value from SharedPreference is ${isAppLaunched.toString()}");
  }

  Widget? redirectingPage;
  String? isLogged;

  redirectToHomeOrLoginPage() async {
    isLogged =
        await VendorRegisterApi.secureStorage.read(key: didUserLoggedKey);
    debugPrint("DID USER LOGGED OR NOT : $isLogged");
    if (isLogged == loggedStatus) {
      redirectingPage = const EventoHolder();
    } else {
      redirectingPage = LoginHome();
    }
    debugPrint("Value of isLogged is $isLogged");
  }
  // -----------------------------------------------------------------------------


  // SubscriptionMethodSelecting

  int subscriptionMethodValue = 1;

  changeSubscriptionMethod(value) {
    subscriptionMethodValue = value;
    update(['subscriptionMethod']);
  }


  //------------------------------------
  // Home BottomNavigation Items
  int? initialIndex = 0.obs();
  final navigationBarIcons = <Widget>[
    const Icon(
      Icons.home_filled,
      color: whiteColor,
    ),
    const Icon(
      Icons.chat_bubble_outline,
      color: whiteColor,
    ),
    const Icon(
      Icons.person,
      color: whiteColor,
    ),
  ];

  changeInitialIndex(index) {
    initialIndex = index;
    update(['btmNavigation']);
  }

  List mainScreens = [
    EventoHome(),
    const EventoChat(),
    EventoProfile(),
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

// Vendor Profile Updating

  clearFeedbackController() {
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  clearDescriptionController() {
    descriptionController.clear();
  }
}
