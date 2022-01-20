import 'package:evento/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EventoController extends GetxController{
  static EventoController eventoController = Get.find();

  @override
  void onInit() async{
    prefs = await _prefs;
    prefs.clear();
    checkAppLaunched();

    super.onInit();
  }




 //--------------------------------------------------------------------------------
 // Section to check whether the user launching this Application for the first time ot not


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  bool? isAppLaunched = false;

  setAppLaunched() async{
    await prefs.setBool(sharedPrefKey, true).then((value) {
      var k = prefs.getBool(sharedPrefKey);
      debugPrint("SharedPreference Collected${k.toString()}");
    });
  }

  checkAppLaunched() async{
    isAppLaunched = prefs.getBool(sharedPrefKey);
    debugPrint("value from SharedPreference is ${isAppLaunched.toString()} You may be set clear() before this function poyi ath sheriyaakk");
  }

  // -----------------------------------------------------------------------------


  // Section to Handle all the User Login / Register  Authentication

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();


  // SignUp Section TextEditingControllers
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();
  var professionController;

  TextEditingController placeController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController userStateController = TextEditingController();







}