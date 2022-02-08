import 'dart:io';
import 'package:dio/dio.dart';
import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/models/profile/profileUpdateModel.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/controller/home_controller/home_controller.dart';
import 'package:evento/controller/profile/editCredentialsController.dart';
import 'package:evento/controller/profile/showProfileDetailsController.dart';
import 'package:evento/widgets/snackbar_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http_parser/http_parser.dart';

class UpdateProfileAPI {
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Dio? _dio;

  UpdateProfileAPI() {
    _dio = Dio();
  }

  Future updateWholeProfile(VendorUpdateProfileModel vendorUpdateProfileModel,
      dynamic imageFile) async {
    try {
      // debugPrint("Getting Path is ${vendorUpdateProfileModel.profilePicture}");
      refreshToken();
      String? filePath;
      String? fileName;
      FormData formData = FormData();
      if (imageFile.runtimeType.toString() == '_File') {
        filePath = imageFile.path;
        fileName = filePath?.split('/').last;
        debugPrint("File Path ${filePath?.split("=").last}");
        debugPrint("File Name ${fileName?.split("=").last}");
        formData = FormData.fromMap(
          {
            "name": vendorUpdateProfileModel.name,
            "category": vendorUpdateProfileModel.category,
            "place": vendorUpdateProfileModel.place,
            "city": vendorUpdateProfileModel.city,
            "state": vendorUpdateProfileModel.state,
            "pincode": vendorUpdateProfileModel.pincode,
            "description": vendorUpdateProfileModel.description,
            "profile_picture": await MultipartFile.fromFile(
              filePath!,
              filename: fileName,
              contentType: MediaType("image", fileName!.split(".").last),
            ),
          },
        );
      } else {
        formData = FormData.fromMap(
          {
            "name": vendorUpdateProfileModel.name,
            "category": vendorUpdateProfileModel.category,
            "place": vendorUpdateProfileModel.place,
            "city": vendorUpdateProfileModel.city,
            "state": vendorUpdateProfileModel.state,
            "pincode": vendorUpdateProfileModel.pincode,
            "description": vendorUpdateProfileModel.description,
          },
        );
      }

      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      Response updateWholeProfileResponse = await _dio!.put(
        vendorWholeProfileUpdateURL,
        data: formData,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      if (updateWholeProfileResponse.data['error'] == null) {
        commonSnackBar(title: "Setup", message: "Success");
        await secureStorage
            .write(key: didUserLoggedKey, value: loggedStatus)
            .then(
              (value) => ShowProfilesDetailsController
                  .showProfilesDetailsController
                  .checkLogStatus()
                  .then(
                    (value) => HomeController.homeController.checkLogStatus(),
                  ),
            );
        // debugPrint(
        //     "The Response AFTER WHOLE PROFILE IS  $updateWholeProfileResponse");
      } else {
        commonSnackBar(
            title: "Setup",
            message: updateWholeProfileResponse.data['error'].toString(),
            color: whiteColor,
            bgColor: warningColors);
      }

      Get.back();
      Get.back();
    } on DioError catch (dioError) {
      debugPrint('Whole ProfileUpdate Error Caught');
      debugPrint(dioError.toString());
      if (dioError.response!.statusCode == 401) {
        await refreshToken().then(
            (value) => updateWholeProfile(vendorUpdateProfileModel, imageFile));
      } else {
        debugPrint(
            "The Response of WHOLE PROFILE UPDATE API call is ${dioError.response!.statusMessage}");
      }
    }
  }

  updateShowCase(File file, int index) async {
    debugPrint("Update ShowCase Called");
    try {
      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      String? filePath = file.path;
      String? fileName = file.path.split('/').last;
      debugPrint("File Path $filePath");
      debugPrint("File Name $fileName");
      FormData formData = FormData.fromMap({
        "image${index + 1}": await MultipartFile.fromFile(filePath,
            filename: fileName,
            contentType: MediaType('image', fileName.split(".").last))
      });

      Response showcaseUpdateResponse = await _dio!.put(vendorShowCaseUpdateURL,
          data: formData,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      debugPrint(
          "The Response after updating ShowCase is $showcaseUpdateResponse");

      if (showcaseUpdateResponse.data['error'] == null) {
        return commonSnackBar(title: "Showcase", message: "Success");
      }
    } on DioError catch (dioError) {
      debugPrint("ShowCase Image Uploading Error Caught");
      debugPrint(dioError.toString());
      if (dioError.response?.statusCode == 401) {
        await refreshToken().then((value) => updateShowCase(file, index));
        debugPrint("New Update Token Caught inside Update ShowCase");
      }
    }
  }

  Future updateEmail({currentEmail, newEmail}) async {
    debugPrint("Update Password Called");
    try {} on DioError catch (dioError) {
      debugPrint('Error Caught');
    }
  }

  Future updatePassword({currentPassword, newPassword}) async {
    debugPrint("Update Password Called");
    debugPrint("Passwords are $currentPassword , $newPassword");
    try {
      final model = {
        'current_password': currentPassword,
        'new_password': newPassword,
      };
      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      Response updatePassResponse = await _dio!.put(vendorPasswordUpdateURL,data: model,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      debugPrint("The Response of UpdatePassword is $updatePassResponse");
      if (updatePassResponse.data['error'] != null) {
        commonSnackBar(
          title: "Password",
          message: updatePassResponse.data['error'],
          color: whiteColor,
          bgColor: warningColors,
        );
      } else {
        commonSnackBar(
          title: "Password",
          message: "Password Updated Successfully",
          color: whiteColor,
          bgColor: greenColor,
        );
      }
    } on DioError catch (dioError) {
      debugPrint('Error Caught');
      debugPrint(dioError.response!.statusMessage);
      debugPrint(dioError.response!.statusCode.toString());
      commonSnackBar(
          title: "Password",
          message: "Something went wrong",
          color: whiteColor,
          bgColor: warningColors,);
    }
  }

  Future updatePhoneNumber({currenytPnum, newPhoneNumber}) async {
    debugPrint("Update Password Called");
    try {} on DioError catch (dioError) {
      debugPrint('Error Caught');
    }
  }

  Future refreshToken() async {
    debugPrint("UPDATE WHOLE PROFILE : REFRESH TOKEN CALLED");
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
    }
  }
}
