import 'package:evento/api_helper/models/registration.dart';
import 'package:evento/api_helper/services/register/register_vendor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  static RegisterController registerEventoController = Get.find();

  TextEditingController nameController = TextEditingController(text: "Aslam");
  TextEditingController userNameController = TextEditingController(text: "Aslam");
  TextEditingController phoneNumberController = TextEditingController(text: "9645541338");
  TextEditingController confirmPwdCntrlr = TextEditingController(text: "Abcd@123");
  TextEditingController signupEmailCntrlr = TextEditingController(text: "aslam@gmail.com");
  TextEditingController signupPassCntrlr = TextEditingController(text: "Abcd@123");


  bool isPostingProgress = false.obs();

  changePostingState() {
    isPostingProgress == true
        ? isPostingProgress = false
        : isPostingProgress = true;
    debugPrint("Value of Register Progress is $isPostingProgress");
    update(["registrationStateChange"]);
  }

  registerVendor(context) async {
    // debugPrint(regDetailList.toString());
    final model = EventoRegistration(
      name: nameController.text,
      username: userNameController.text,
      email: signupEmailCntrlr.text,
      phoneNumber: phoneNumberController.text,
      password: signupPassCntrlr.text,
      password2: confirmPwdCntrlr.text,
    );
    VendorRegisterApi().createVendor(model, context);
  }

  bool isVerifying = false.obs();

  changeVerifyingState() {
    isVerifying == true ? isVerifying = false : isVerifying = true;
    debugPrint("Value of OTP Progress is $isVerifying");
    update(['verificationOTPStateChange']);
  }

  verifyVendorWithOtpAfterRegistration(otpPassword) {
    VendorRegisterApi().verifyRegisteredOtp(otpPassword);
  }

  resendOTP() {
    VendorRegisterApi().resendOTP();
  }

  clearSignupControllers() {
    nameController.clear();
    userNameController.clear();
    phoneNumberController.clear();
    signupEmailCntrlr.clear();
    signupPassCntrlr.clear();
    confirmPwdCntrlr.clear();
  }

}