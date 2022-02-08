import 'package:dio/dio.dart';
import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/api_helper/models/home/short_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeControllerAPI{

  Dio? _dio;
  HomeControllerAPI(){
    _dio = Dio();
  }
  static const secureStorage = FlutterSecureStorage();

  // .
  Future<VendorShortDetails?>fetchVendorProfileDetails() async{
    debugPrint("FETCHING LOGGED VENDOR DETAILS");
    try{

      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      debugPrint("fetchVendorProfileDetails() : Access token is $accessToken");
      Response vendorProDetails = await _dio!.get(vendorHomeProfileURL,options: Options(headers: {'Authorization':'Bearer $accessToken'}));
      // debugPrint("The response of fetchVendorProfileDetails()  is $vendorProDetails");
        VendorShortDetails vendorShortDetails = VendorShortDetails.fromJson(vendorProDetails.data['vendor']);
        debugPrint("Completed FetchingProfileDetails");
      return vendorShortDetails;
    } on DioError catch(dioError){
      debugPrint("Error Caught on fetchVendorProfileDetails()");
      debugPrint(dioError.response!.statusMessage);
      debugPrint(dioError.response!.statusCode.toString());
      if(dioError.response!.statusCode == 401 || dioError.response!.statusCode == 403){
        await refreshToken();
      }
    }
  }



  refreshToken() async {
    debugPrint("fetchVendorProfileDetails(): REFRESH TOKEN CALLED");
    String? oldRefreshToken =
    await secureStorage.read(key: refreshTokenStorageKey);
    final response = await _dio!
        .post(refreshTokenUrl, data: {'refresh': '$oldRefreshToken'});
    var newAccessToken = response.data['access'];
    var newRefreshToken = response.data['refresh'];
      await secureStorage.write(
          key: accesstokenStorageKey, value: newAccessToken);
      await secureStorage.write(
          key: refreshTokenStorageKey, value: newRefreshToken);
        debugPrint("NEW REFRESH TOKEN CAUGHT on fetchVendorProfileDetails()");
        // await fetchVendorProfileDetails();
        // saveVendorProfileDetails();
  }

}