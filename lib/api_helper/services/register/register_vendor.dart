import 'package:dio/dio.dart';
import 'package:evento/api_helper/models/registration.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/controller/authorization/registerController.dart';
import 'package:evento/screen/authentication_screens/forgot_password/register_otp_section.dart';
import 'package:evento/widgets/snackbar_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final controller = RegisterController.registerEventoController;

class VendorRegisterApi {
  Dio? _dio;
  static const secureStorage = FlutterSecureStorage();

  VendorRegisterApi() {
    _dio = Dio();
  }

  Future createVendor(EventoRegistration eventoModel, context) async {
    try {
      debugPrint(eventoModel.name);
      debugPrint(eventoModel.username);
      debugPrint(eventoModel.phoneNumber);
      debugPrint(eventoModel.email);
      debugPrint(eventoModel.password);
      debugPrint(eventoModel.password2);

      Response response = await _dio!.post(
        registerUrl,
        data: eventoModel.toJson(),
      );

      debugPrint("Complete error is ${response.data}");
      final Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('error')) {
        final responseBody = responseData['error'] as Map<String, dynamic>;
        if (responseBody['username'] != null) {
          controller.changePostingState();
          return commonSnackBar(
            title: "Authentication",
            message: responseBody['username'][0],
            color: whiteColor,
            bgColor: warningColors,
          );
        } else if (responseBody['email'] != null) {
          controller.changePostingState();
          return commonSnackBar(
            title: "Authentication",
            message: responseBody['email'][0],
            color: whiteColor,
            bgColor: warningColors,
          );
        } else if (responseBody['phone_number'] != null) {
          controller.changePostingState();
          return commonSnackBar(
            title: "Authentication",
            message: responseBody['phone_number'][0],
            color: whiteColor,
            bgColor: warningColors,
          );
        }
      } else {
        await secureStorage.write(
            key: keyOfLastRegVendorPhonenum, value: eventoModel.phoneNumber);
        await secureStorage
            .write(key: didUserLoggedKey, value: logoutStatus)
            .then(
          (value) {
            debugPrint(
                "URL TO SEND CONFIRMATION OTP AFTER REGISTRATION IS CALLED");
            return sendOtpAfterRegistration();
          },
        );
        controller.changePostingState();
        // Get.offNamedUntil('/forgot2', (route) => false);
      }
    } on DioError catch (dioError) {
      controller.changePostingState();
      debugPrint("----------------ERROR CAUGHT--------------------------");
      debugPrint(dioError.toString());
      commonSnackBar(
          title: "Registration",
          message: "Something went wrong",
          bgColor: warningColors,
          color: whiteColor);
    }
  }

  Future sendOtpAfterRegistration() async {
    String? vendorPhoneNumber =
        await secureStorage.read(key: keyOfLastRegVendorPhonenum);
    try {
      Response regOTPResponse = await _dio!.post(verifyWithOtpAfterRegisterURL,
          data: {'phone_number': '$vendorPhoneNumber'});
      debugPrint("The Response of Registered OTP is ${regOTPResponse.data}");
      if (regOTPResponse.data['error'] != null) {
        commonSnackBar(title: "Verification", message: "Invalid Phone number");
      } else {
        Get.offAll(() => const RegisterVendorOTPSection());
      }
    } on DioError catch (error) {
      commonSnackBar(title: "Verification", message: "Something went wrong");
      debugPrint("Error Caught");
      debugPrint(error.message);
    }
  }

  Future verifyRegisteredOtp(otpPassword) async {
    String? vendorPhoneNumber =
        await secureStorage.read(key: keyOfLastRegVendorPhonenum);
    try {
      Response cnfrmRegOTPResponse = await _dio!.post(confirmRegistrationOTPURL,
          data: {'otp': otpPassword, 'phone_number': vendorPhoneNumber});
      debugPrint(
          "The Response of Registered OTP Verification is ${cnfrmRegOTPResponse.data}");
      if (cnfrmRegOTPResponse.data['success'] == 'otp verified') {
        await secureStorage.delete(key: keyOfLastRegVendorPhonenum);
        await secureStorage.delete(key: didUserLoggedKey);
        await secureStorage.write(key: didUserLoggedKey, value: logoutStatus);
        debugPrint("Both Verification Success");
        Get.offNamed('login');
      } else {
        debugPrint("Both Verification FAILED");
        commonSnackBar(
            title: "Verification",
            message: "OTP Mismatch",
            bgColor: warningColors,
            color: whiteColor);
      }
    } on DioError catch (dioError) {
      commonSnackBar(
          title: "Verification",
          message: "Something went wrong",
          bgColor: warningColors,
          color: whiteColor);
      debugPrint(dioError.message);
    }

  }

  Future resendOTP() async {
    String? vendorPhoneNumber =
        await secureStorage.read(key: keyOfLastRegVendorPhonenum);
    try {
      Response retryOTPResponse = await _dio!
          .post(verifyWithOtpAfterRegisterURL, data: {
        'phone_number': '$vendorPhoneNumber'
      }).then((value) => commonSnackBar(
              title: "Verification", message: "OTP Sent Successfully"));
      debugPrint(
          "The Response of Resend Registered OTP is ${retryOTPResponse.data}");
      if (retryOTPResponse.data['error'] != null) {
        commonSnackBar(title: "Verification", message: "Invalid Phone number");
      }
    } on DioError catch (dioError) {
      commonSnackBar(title: "Verification", message: "Something went wrong");
      debugPrint(dioError.message);
    }
  }
}
