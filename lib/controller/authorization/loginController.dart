import 'package:evento/api_helper/models/login.dart';
import 'package:evento/api_helper/services/login_api_functions/login_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  static LoginController loginController = Get.find();

  TextEditingController emailEditingController =
  TextEditingController(text: "aslam@gmail.com");
  TextEditingController passwordEditingController =
  TextEditingController(text: "Abcd@123");

  // Login Vendor
  loginVendor(context) {
    final model = EventoLogin(
      email: emailEditingController.text,
      password: passwordEditingController.text,
    );
    LoginApiService().loginVendor(context, model);
  }

  clearLoginControllers() {
    emailEditingController.clear();
    passwordEditingController.clear();
  }


  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }
}