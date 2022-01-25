import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/authentication_screens/forgot_password/forgot_password_section1.dart';
import 'package:evento/screen/authentication_screens/register/register_section_one.dart';
import 'package:evento/screen/screen_main/holder/evento_pageholder.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/datatext_field.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:evento/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 36.h,
                  ),
                  Image.asset(
                    "assets/images/loginImages/loginBgVendor.png",
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: whiteColor, borderRadius: loginBorderRadius),
                      child: Padding(
                        padding: EdgeInsets.only(left: 22.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 28.h,
                            ),
                            CommonText(
                              text: "Log In",
                              color: primaryColor,
                              size: 32.sp,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Email",
                                    size: 16.sp,
                                    color: primaryColor,
                                  ),
                                  DataTextFields(
                                    controller: EventoController
                                        .eventoController
                                        .emailEditingController,
                                    textInputType: TextInputType.emailAddress,
                                    hintText: "Your email id",
                                    validationBuilder:
                                        ValidationBuilder().email().build(),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CommonText(
                                    text: "Password",
                                    size: 16.sp,
                                    color: primaryColor,
                                  ),
                                  DataTextFields(
                                    minLength: 8,
                                    controller: EventoController
                                        .eventoController
                                        .passwordEditingController,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    hintText: "Password",
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 25.w),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () => Get.to(() =>
                                            const ForgotPasswordSectionOne()),
                                        child: CommonText(
                                          text: "Forgot password?",
                                          size: 11.sp,
                                          weight: FontWeight.w400,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                  Center(
                                    child: commonButton(
                                      text: "Login",
                                      textSize: 14.0,
                                      width: 150.0.w,
                                      onPressed: () {
                                        validateToLogin(context);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0.h,
                                  ),
                                  Center(
                                    child: Wrap(
                                      children: [
                                        CommonText(
                                          text: "Don't have an account?",
                                          size: 11.sp,
                                          weight: FontWeight.w400,
                                          color: placeHolderColor,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            navigateToSignup(context);
                                          },
                                          child: CommonText(
                                            text: "\t\tSignUp",
                                            size: 11.sp,
                                            weight: FontWeight.w400,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateToLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Get.offAll(() => const EventoHolder());
      FocusScope.of(context).unfocus();
      EventoController.eventoController.emailEditingController.clear();
      EventoController.eventoController.passwordEditingController.clear();
    }
  }

  void navigateToSignup(BuildContext context) {
    Get.to(() => RegisterSectionOne());
    FocusScope.of(context).unfocus();
    EventoController.eventoController.emailEditingController.clear();
    EventoController.eventoController.passwordEditingController.clear();
  }
}
