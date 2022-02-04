import 'package:dio/dio.dart';
import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/services/home/profile_details_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeControllerAPI{

  Dio? _dio;
  HomeControllerAPI(){
    _dio = Dio();
  }
  static const secureStorage = FlutterSecureStorage();



  Future saveVendorProfileDetails() async{
    debugPrint("CALLING FUNCTION TO FETCH LOGGED VENDOR DETAILS");
    try{
      refreshToken();
      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      debugPrint("saveVendorProfileDetails() : Access token is $accessToken");
      Response vendorProDetails = await _dio!.get(vendorHomeProfileURL,options: Options(headers: {'Authorization':'Bearer $accessToken'}));
      debugPrint("The response of saveVendorProfileDetails()  is $vendorProDetails");

      await secureStorage.write(key: vendorProfessionKey, value: vendorProDetails.data['vendor']['category']);
      await secureStorage.write(key: vendorNameKey, value: vendorProDetails.data['vendor']['name']);
      await secureStorage.write(key: vendorProfileURLKey, value: vendorProDetails.data['vendor']['profile_picture']);
      await secureStorage.write(key: vendorPlaceKey, value: vendorProDetails.data['vendor']['place']);
      await secureStorage.write(key: vendorCityKey, value: vendorProDetails.data['vendor']['city']);
      await secureStorage.write(key: vendorStateKey, value: vendorProDetails.data['vendor']['state']);
      await secureStorage.write(key: vendorPincodeKey, value: vendorProDetails.data['vendor']['pincode']);
      await secureStorage.write(key: vendorDescriptionKey, value: vendorProDetails.data['vendor']['description']);

      var name = await secureStorage.read(key: vendorNameKey);
      var profilePic = await secureStorage.read(key: vendorProfileURLKey);
      var place = await secureStorage.read(key: vendorPlaceKey);
      var city = await secureStorage.read(key: vendorCityKey);


      debugPrint("Getting Values are $name\n,$profilePic,\n$place,\n$city");


      debugPrint("saveVendorProfileDetails() : STORED LOGGED VENDOR DETAILS");
    } on DioError catch(dioError){
      debugPrint("Error Caught");
      debugPrint(dioError.response!.statusMessage);
      debugPrint(dioError.response!.statusCode.toString());
      // if(dioError.response!.statusCode == 401){
      //   refreshToken();
      // }
    }
  }



  refreshToken() async {
    debugPrint("saveVendorProfileDetails(): REFRESH TOKEN CALLED");
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
        debugPrint("NEW REFRESH TOKEN CAUGHT");
        // saveVendorProfileDetails();
      }
    }
  }

}