import 'package:dio/dio.dart';
import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/models/profile/profileUpdateModel.dart';
import 'package:evento/api_helper/services/home/home_api_service.dart';
import 'package:evento/constants/colors.dart';
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

  Future updateWholeProfile(
      VendorUpdateProfileModel vendorUpdateProfileModel) async {
    debugPrint("Update Password Called");
    try {
      String? filePath = vendorUpdateProfileModel.profilePicture!.path;
      String? fileName = filePath.split('/').last;
      debugPrint("File Path $filePath");
      debugPrint("File Name $fileName");
      FormData formData = FormData.fromMap(
        {
          "name": vendorUpdateProfileModel.name,
          "category": vendorUpdateProfileModel.category,
          "place": vendorUpdateProfileModel.place,
          "city": vendorUpdateProfileModel.city,
          "state": vendorUpdateProfileModel.state,
          "pincode": vendorUpdateProfileModel.pincode,
          "profile_picture": await MultipartFile.fromFile(
            filePath,
            filename: fileName,
            contentType: MediaType("image", fileName.split(".").last),
          ),
        },
      );
      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      Response updateWholeProfileResponse = await _dio!.post(
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
              (value) => HomeControllerAPI().saveVendorProfileDetails().then(
                    (value) => Get.back(),
                  ),
            );
        debugPrint(
            "The Response AFTER WHOLE PROFILE IS  $updateWholeProfileResponse");
      } else {
        commonSnackBar(
            title: "Setup",
            message: updateWholeProfileResponse.data['error'].toString(),
            color: whiteColor,
            bgColor: warningColors);
      }
    } on DioError catch (dioError) {
      debugPrint('Whole ProfileUpdate Error Caught');
      debugPrint(dioError.toString());
      if (dioError.response!.statusCode == 401) {
        refreshToken(vendorUpdateProfileModel);
      } else {
        debugPrint(
            "The Response of WHOLE PROFILE UPDATE API call is ${dioError.response!.statusMessage}");
      }
    }
  }

  Future updatePassword(newPassword) async {
    debugPrint("Update Password Called");
    try {} on DioError catch (dioError) {
      debugPrint('Error Caught');
    }
  }

  Future updateEmail(newEmail) async {
    debugPrint("Update Password Called");
    try {} on DioError catch (dioError) {
      debugPrint('Error Caught');
    }
  }

  Future updatePhoneNumber(newPhoneNumber) async {
    debugPrint("Update Password Called");
    try {} on DioError catch (dioError) {
      debugPrint('Error Caught');
    }
  }

  refreshToken(model) async {
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
      if (newRefreshToken != oldRefreshToken &&
          newAccessToken != oldAccessToken) {
        updateWholeProfile(model);
      }
    }
  }
}
