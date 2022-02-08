import 'package:dio/dio.dart';
import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/models/profile/show_whole_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShowWholeProfileAPI{

  Dio? _dio;
  ShowWholeProfileAPI(){
    _dio = Dio();
  }
  FlutterSecureStorage secureStorage  = const FlutterSecureStorage();

  Future<VendorWholeDetails?>fetchVendorWholeProfileDetails() async{
    // debugPrint("CALLING FUNCTION TO FETCH LOGGED VENDOR DETAILS");
    try{
      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      // debugPrint("FetchVendorWholeProfileDetails() : Access token is $accessToken");
      Response vendorProDetails = await _dio!.get(vendorWholeProfileFetchURL,options: Options(headers: {'Authorization':'Bearer $accessToken'}));
      // debugPrint("The response of FetchVendorWholeProfileDetails()  is $vendorProDetails");
      VendorWholeDetails vendorShortDetails = VendorWholeDetails.fromJson(vendorProDetails.data['vendor']);
      debugPrint("Completed FetchingProfileWholeDetails");
      return vendorShortDetails;
    } on DioError catch(dioError){
      debugPrint("Error Caught");
      debugPrint(dioError.response!.statusMessage);
      debugPrint(dioError.response!.statusCode.toString());
      if(dioError.response!.statusCode == 401 || dioError.response!.statusCode == 403){
        await refreshToken();
      }
    }
  }

  refreshToken() async {
    debugPrint("FetchVendorWholeProfileDetails(): REFRESH TOKEN CALLED");
    String? oldAccessToken =
    await secureStorage.read(key: accesstokenStorageKey);
    String? oldRefreshToken =
    await secureStorage.read(key: refreshTokenStorageKey);
    debugPrint("Old Refresh Token is $oldRefreshToken");
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
        debugPrint("NEW REFRESH TOKEN CAUGHT on FetchVendorWholeProfileDetails");
        // saveVendorProfileDetails();
        // await fetchVendorWholeProfileDetails();
      }
    }
  }




}