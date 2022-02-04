import 'package:evento/constants/colors.dart';
import 'package:evento/controller/authorization/forgotController.dart';
import 'package:evento/controller/authorization/registerController.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/controller/profile/editCredentialsController.dart';
import 'package:evento/controller/profile/editProfileDetailsController.dart';
import 'package:evento/controller/profile/showProfileDetailsController.dart';
import 'package:evento/screen/authentication_screens/forgot_password/forgot_otp_section.dart';
import 'package:evento/screen/authentication_screens/forgot_password/forgot_password_section1.dart';
import 'package:evento/screen/authentication_screens/forgot_password/register_otp_section.dart';
import 'package:evento/screen/authentication_screens/login/login_home.dart';
import 'package:evento/screen/authentication_screens/register/register_section_one.dart';
import 'package:evento/screen/profile_setup/profile_setup.dart';
import 'package:evento/screen/screen_main/holder/evento_pageholder.dart';
import 'package:evento/screen/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'api_helper/services/fetching/fetchdetails.dart';
import 'controller/authorization/loginController.dart';
import 'controller/home_controller/home_controller.dart';
import 'controller/profile_setup/profile_setup.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(EventoController());
  Get.put(HomeController());
  Get.put(ShowProfilesDetailsController());
  Get.put(EventoForgotController());
  Get.put(FetchVendorAPI());
  Get.put(LoginController());
  Get.put(EditProfileDetailsController());
  Get.put(EditProfileCredentialsController());
  Get.put(ProfileSetupController());
  Get.put(RegisterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evento - We build smiles',
        theme: ThemeData(
          primaryColor: primaryColor
        ),
        home: SplashScreen(),
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/login', page: () => LoginHome()),
          GetPage(name: '/reg1', page: () => RegisterSectionOne()),
          GetPage(name: '/holder', page: () => const EventoHolder()),
          GetPage(name: '/forgot1', page: () => ForgotPasswordSectionOne()),
          GetPage(name: '/forgot2', page: () => ForgotPasswordOtpSection()),
          GetPage(name: '/registerVendorOTP', page: () => const RegisterVendorOTPSection()),
          GetPage(name: '/profileSetup', page: () => SetupProfile()),
        ],
      ),
      designSize: const Size(375, 812),
    );
  }
}
