import 'package:dio/dio.dart';
import 'package:evento/api_helper/models/login.dart';
import 'package:evento/api_helper/services/home/home_api_service.dart';
import 'package:evento/api_helper/services/register/register_vendor.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/controller/authorization/loginController.dart';
import 'package:evento/widgets/snackbar_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../api_constants/api_constants.dart';

final controller = LoginController.loginController;

class LoginApiService {
  Dio? _dio;
  static const secureStorage = FlutterSecureStorage();

  LoginApiService() {
    _dio = Dio();
  }

  Future loginVendor(context, EventoLogin loginModel) async {
    try {
      Response response = await _dio!.post(
        loginUrl,
        data: loginModel,
      );
      if (response.statusCode == 200) {
        await secureStorage.write(
            key: accesstokenStorageKey, value: response.data['access']);
        await secureStorage.write(
            key: refreshTokenStorageKey, value: response.data['refresh']);
        await secureStorage.write(key: didUserLoggedKey, value: logoutStatus);

        if(response.data['is_verified'] == false){
          Get.offNamedUntil('/forgot2', (route) => false);
        }else{
          checkIfVendorSubscribed();
        }
        debugPrint("Stored Access token successfully");
        debugPrint("Login was Successful");
      }
    } on DioError catch (dioError) {
      Future.delayed(const Duration(milliseconds: 20));
      commonSnackBar(
        title: "Login",
        message: "Username or Password incorrect",
        bgColor: warningColors,
        color: whiteColor,
      );
      debugPrint("Login Exception Caught");
      debugPrint("--------------------------");
      debugPrint(dioError.message.toString());
      debugPrint(dioError.response!.statusMessage.toString());
      debugPrint(dioError.response!.statusCode.toString());
      debugPrint("--------------------------");
    }
  }

  refreshToken() async {
    String? oldAccessToken =
        await secureStorage.read(key: accesstokenStorageKey);
    String? oldRefreshToken =
        await secureStorage.read(key: refreshTokenStorageKey);
    final response = await _dio!
        .post(refreshTokenUrl, data: {'refresh': '$oldRefreshToken'});
    var newAccessToken = response.data['access'];
    var newRefreshToken = response.data['refresh'];
    if (oldAccessToken != newAccessToken) {
      await secureStorage.write(
          key: accesstokenStorageKey, value: newAccessToken);
      await secureStorage.write(
          key: refreshTokenStorageKey, value: newRefreshToken);
      if (newRefreshToken != oldRefreshToken &&
          newAccessToken != oldAccessToken) {
        debugPrint('REFRESH TOKEN & ACCESS TOKEN BOTH ARE REFRESHED');
        debugPrint("ATTEMPTING TO CHECK FOR VENDOR QUALIFICATION");
        checkIfVendorSubscribed();
      }
      debugPrint("REKSHAPPETTU MONE.... SAADHANAM KAYYILUND");
    }
  }

  Future checkIfVendorSubscribed() async {
    var accessToken = await secureStorage.read(key: accesstokenStorageKey);
    debugPrint(
        "checkIfVendorSubscribed : AccessToken from Storage is $accessToken");
    debugPrint("Check for Subscribed Vendor is Called");
    try {
      Response isSubsrbdResponse = await _dio!.get(checkVendorSubscribedURL,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      debugPrint(
          "Response of the Subscribed or not Function is $isSubsrbdResponse");
      debugPrint(
          "Status code of the Response of subscriber or not fn is  ${isSubsrbdResponse.statusCode}");
      if (isSubsrbdResponse.statusCode == 200) {
        if (isSubsrbdResponse.data['error'] != null) {
          Get.offNamedUntil('/profileSetup', (route) => false);
        } else {
          debugPrint('Function to saveUSER DETAILS CALLED');
          await HomeControllerAPI().saveVendorProfileDetails();
          await secureStorage.write(key: didUserLoggedKey, value: loggedStatus);
          Get.offNamedUntil('/holder', (route) => false);
        }
      } else {
        commonSnackBar(title: "Authentication", message: "Unknown Response...");
      }
    } on DioError catch (dioError) {
      if (dioError.response!.statusCode == 401) {
        commonSnackBar(
            title: "Authentication",
            message: "AccessToken Expired...!",
            color: whiteColor,
            bgColor: warningColors);
        refreshToken();
      } else {
        commonSnackBar(
            title: "Authentication",
            message:
                "Authentication failed due to Unknown Error...please try again later",
            color: whiteColor,
            bgColor: warningColors);
      }
      debugPrint("Error Caught");
      debugPrint(dioError.response!.statusCode.toString());
    }
  }

  logoutVendor() async {
    await secureStorage.deleteAll();
    await secureStorage
        .write(key: didUserLoggedKey, value: logoutStatus)
        .then((value) => Get.offNamed('login'));
  }



}
