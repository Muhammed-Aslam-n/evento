import 'package:evento/api_helper/services/forgotpassword_api/forgot_password_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventoForgotController extends GetxController{

   static EventoForgotController eventoFpController = Get.find();


  // Forgot Password Controllers

  TextEditingController fpPhoneNumber = TextEditingController();
  TextEditingController fpOTP = TextEditingController();

  TextEditingController fpNewPassword = TextEditingController();
  TextEditingController fpConfirmNewPassword = TextEditingController();


  fpNumberVerification() {
    ForgotPasswordAPI().sendPhoneNumber(fpPhoneNumber.text);
  }

  // page 2

   fpVerifyNumberUsingOTP(otp){
    ForgotPasswordAPI().verifyOTP(fpPhoneNumber.text,otp);
   }

   fpResendOTP(){
     ForgotPasswordAPI().resendForgotOTP();
   }

   fpUpdatePassword(){
     ForgotPasswordAPI().updateForgotPassword(phoneNumber:fpPhoneNumber.text,newPassword:fpNewPassword.text);
   }

   clearNewPasswordControllers(){
     fpPhoneNumber.clear();
     fpNewPassword.clear();
     fpConfirmNewPassword.clear();
     fpOTP.clear();
   }
}