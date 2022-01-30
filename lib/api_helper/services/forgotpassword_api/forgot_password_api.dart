import 'package:dio/dio.dart';
import 'package:evento/api_helper/api_constants.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/controller/authorization/forgotController.dart';
import 'package:evento/screen/authentication_screens/forgot_password/forgot_otp_section.dart';
import 'package:evento/screen/authentication_screens/update_forgot_password/update_forgot_password.dart';
import 'package:evento/widgets/snackbar_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

final controller = EventoForgotController.eventoFpController;

class ForgotPasswordAPI {
  Dio? _dio;
  static const secureStorage = FlutterSecureStorage();

  ForgotPasswordAPI() {
    _dio = Dio();
  }

  Future sendPhoneNumber(vendorPhoneNumber) async {
    await secureStorage.write(key: resendOTPhoneNumberKey, value: vendorPhoneNumber);
    debugPrint("Phone number entering is $vendorPhoneNumber");
    try {
      Response fpResponse = await _dio!.post(
        fpPhoneNumberSendingURL,
        data: {
          'phone_number': '$vendorPhoneNumber',
        },
      );
      if (fpResponse.data['error'] != null) {
        commonSnackBar(
          title: "Forgot Password",
          message: "Some Error occurred",
          color: whiteColor,
          bgColor: warningColors,
        );
      } else {
        commonSnackBar(
          title: "Forgot Password",
          message: "OTP has been sent to your Number",
          bgColor: greenColor,
          color: whiteColor,
        );
        Get.off(() => ForgotPasswordOtpSection())!.then((value) => controller.fpPhoneNumber.clear());
      }
    } on DioError catch (dioError) {
      debugPrint("Some Error Occurred");
      commonSnackBar(
        title: "Forgot Password",
        message: "Some Error occurred",
        color: whiteColor,
        bgColor: warningColors,
      );
    }
  }

  Future verifyOTP(phoneNumber,otp) async {
    debugPrint("Phone number IN verify otp is $phoneNumber");
    debugPrint("OTP number IN verify otp is $otp");
    try{
      Response verifyOtpResponse = await _dio!.post(fpOtpVerificationURL,data: {'phone_number':'$phoneNumber','otp':'$otp'});
      if(verifyOtpResponse.data['errors'] != null){
        commonSnackBar(title: "OTP Verification",message: "Something went wrong",);
      }
      else{
        commonSnackBar(title: "OTP Verification",message: "Verification Success",color: whiteColor,bgColor: greenColor);
        Get.off(()=>UpdateForgotPassword())!.then((value) => controller.fpPhoneNumber.clear());
      }
    }on DioError catch(dioError){
      commonSnackBar(title: "OTP Verification",message: "Something went wrong",color: whiteColor,bgColor: warningColors);
    }
  }



  resendForgotOTP() async{
    var resendOTPNumber = await secureStorage.read(key: resendOTPhoneNumberKey);
    debugPrint("Phone number entering is $resendOTPNumber");
    try {
      Response fpResponse = await _dio!.post(
        fpPhoneNumberSendingURL,
        data: {
          'phone_number': '$resendOTPNumber',
        },
      );
      if (fpResponse.data['error'] != null) {
        commonSnackBar(
          title: "Forgot Password",
          message: "Some Error occurred",
          color: whiteColor,
          bgColor: warningColors,
        );
      } else {
        commonSnackBar(
          title: "Forgot Password",
          message: "OTP has been sent to your Number",
          bgColor: greenColor,
          color: whiteColor,
        );
        Get.off(() => ForgotPasswordOtpSection());
      }
    } on DioError catch (dioError) {
      debugPrint("Some Error Occurred");
      commonSnackBar(
        title: "Forgot Password",
        message: "Some Error occurred",
        color: whiteColor,
        bgColor: warningColors,
      );
    }
  }



  Future updateForgotPassword({phoneNumber,newPassword}) async{
    debugPrint("The new Password to Update is $newPassword");
    try{
      Response updateFPswrdResponse = await _dio!.post(updateFPaswdURL,data: {'phone_number':'$phoneNumber','password':'$newPassword'});
      if(updateFPswrdResponse.data['errors'] != null){
        commonSnackBar(title: "Update Password",message: "Something went wrong",color: whiteColor,bgColor: warningColors);
      }else{
        commonSnackBar(title: "Update Password",message: "Password Updated Successfully",color: whiteColor,bgColor: greenColor);
        Get.offAndToNamed('login')!.then((value) => controller.clearNewPasswordControllers());
      }

    }on DioError catch(dioError){
      debugPrint("Error Occurred");
      commonSnackBar(title: "Update Password",message: "Something went wrong",color: whiteColor,bgColor: warningColors);
    }
  }



}
