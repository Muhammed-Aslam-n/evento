import 'dart:io';
import 'package:dio/dio.dart';
import 'package:evento/api_helper/models/profile_setup_model.dart';
import 'package:evento/api_helper/services/profile/show_profile_api.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/controller/home_controller/home_controller.dart';
import 'package:evento/controller/profile/editProfileDetailsController.dart';
import 'package:evento/controller/profile/showProfileDetailsController.dart';
import 'package:evento/widgets/snackbar_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http_parser/http_parser.dart';
import '../../api_constants/api_constants.dart';

class SetupProfileAPI {
  static SetupProfileAPI setupProfileAPI = Get.find();
  static const secureStorage = FlutterSecureStorage();
  Dio? _dio;

  SetupProfileAPI() {
    _dio = Dio();
  }

  Future setupVendorProfile({
    required VendorProfileSetup vendorProfileSetupModel,
    required File imageFile,
  }) async {
    try {
      if (imageFile.path.isNotEmpty) {
        String? filePath = imageFile.path;
        String? fileName = imageFile.path.split('/').last;
        debugPrint("File Path $filePath");
        debugPrint("File Name $fileName");
        FormData formData = FormData.fromMap(
          {
            "name": vendorProfileSetupModel.fullName,
            "category": vendorProfileSetupModel.category,
            "place": vendorProfileSetupModel.place,
            "city": vendorProfileSetupModel.city,
            "state": vendorProfileSetupModel.state,
            "pincode": vendorProfileSetupModel.pincode,
            "subscription_type": vendorProfileSetupModel.subscriptionType,
            "subscription_amount": vendorProfileSetupModel.subscriptionAmount,
            "description":vendorProfileSetupModel.description,
            "profile_picture": await MultipartFile.fromFile(
              filePath,
              filename: fileName,
              contentType: MediaType("image", fileName.split(".").last),
            ),
          },
        );
        var accessToken = await secureStorage.read(key: accesstokenStorageKey);
        Response setupProfileResponse = await _dio!.post(vendorProfileSetupURL,
            data: formData,
            options:
                Options(headers: {'Authorization': 'Bearer $accessToken'}));

        if (setupProfileResponse.data['error'] == null) {
          commonSnackBar(title: "Setup", message: "Success");
          await secureStorage.write(key: didUserLoggedKey, value: loggedStatus);
          await HomeController.homeController.onInit();
          await ShowProfilesDetailsController.showProfilesDetailsController.checkLogStatus();
          await EditProfile.editProfile.checkLogStatus();
          Get.offNamedUntil('/holder', (route) => false);

        } else {
          commonSnackBar(
              title: "Setup",
              message: setupProfileResponse.data['error'].toString(),color: whiteColor,bgColor: warningColors);
        }
      } else {
        return commonSnackBar(
            title: "Profile", message: "Please select profile picture ");
      }
    } on DioError catch (dioError) {
      debugPrint("Error Caught");
      debugPrint(dioError.toString());
      if (dioError.response!.statusCode == 401) {
        refreshToken(vendorProfileSetupModel, imageFile);
      } else {
        debugPrint(
            "The Response of the API call is ${dioError.response!.statusMessage}");
      }
    }
  }

  refreshToken(model, img) async {
    debugPrint("SETUP PROFILE : REFRESH TOKEN CALLED");
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
        setupVendorProfile(vendorProfileSetupModel: model, imageFile: img);
      }
    }
  }
}

// var request = http.MultipartRequest(
//   "POST",
//   Uri.parse(
//     vendorProfileSetupURL,
//   ),
// );
// request.fields["name"] = vendorProfileSetupModel.fullName!;
// request.fields["category"] = vendorProfileSetupModel.category!;
// request.fields["place"] = vendorProfileSetupModel.place!;
// request.fields["city"] = vendorProfileSetupModel.city!;
// request.fields["state"] = vendorProfileSetupModel.state!;
// request.fields["pincode"] = vendorProfileSetupModel.pincode!;
// request.fields["subscription_type"] =
//     vendorProfileSetupModel.subscriptionType!;
// request.fields["subscription_amount"] =
//     vendorProfileSetupModel.subscriptionAmount!;
// var accessToken = await secureStorage.read(key: accesstokenStorageKey);
// Map<String, String> requestHeaders = {
//   'Authorization': 'Bearer $accessToken',
//   'Content-Type': 'application/json',
//   'Content_Disposition': 'attachment:filename=${imagePath.path}'
// };
// String? fileName = imagePath.path.split('/').last;
// request.files.add(
//   http.MultipartFile(
//     'profile_picture',
//     imagePath.readAsBytes().asStream(),
//     imagePath.lengthSync(),
//     filename: fileName,
//     contentType: MediaType('image', 'jpg'),
//   ),
// );
// request.headers.addAll(requestHeaders);
// request.send();
// await secureStorage
//     .write(key: didUserLoggedKey, value: loggedStatus).then((value) => HomeControllerAPI().saveVendorProfileDetails());
