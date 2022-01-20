import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/screen/screen_main/chat/evento_chat.dart';
import 'package:evento/screen/screen_main/home/evento_home.dart';
import 'package:evento/screen/screen_main/profile/evento_profile.dart';
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

  final professionList = ['Photography','Make Up','Decoration','Mehndi','Wedding Card','Catering'];
  String userSelectedProfession = 'Photography'.obs();

  changeDropdownItem(value){
    userSelectedProfession = value;
    update(['dropDownItem']);
  }

  TextEditingController placeController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController userStateController = TextEditingController();

  int userSelectedProfessionValue = 2;
  changeSubscriptionMode(value){
    userSelectedProfessionValue = value;
    update(['subscriptionSection']);
  }


  int subscriptionMethodValue = 1;
  changeSubscriptionMethod(value){
    subscriptionMethodValue = value;
    update(['subscriptionMethod']);
  }

// Home BottomNavigation Items
int? initialIndex = 0.obs();
final navigationBarIcons = <Widget>[
  const Icon(Icons.home_filled,color: primaryTextColor,),
  const Icon(Icons.chat_bubble_outline,color: primaryTextColor,),
  const Icon(Icons.person,color: primaryTextColor,),
];
changeInitialIndex(index){
  initialIndex = index;
  update(['btmNavigation']);
}

List mainScreens = [
  const EventoHome(),
  const EventoChat(),
  const EventoProfile(),

];






}