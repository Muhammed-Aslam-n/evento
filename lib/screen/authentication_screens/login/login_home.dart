import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/authentication_screens/forgot_password/forgot_password_section1.dart';
import 'package:evento/screen/authentication_screens/register/register_section_one.dart';
import 'package:evento/screen/screen_main/holder/evento_pageholder.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: [
              SizedBox(
                height: 36.h,
              ),
              FittedBox(child: Image.asset("assets/images/loginImages/loginBgVendor.png",)),
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
                        Padding(
                          padding: EdgeInsets.only(left: 32.w, right: 36.w),
                          child: Form(
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
                                  minLength: 9,
                                  controller: EventoController
                                      .eventoController.emailEditingController,
                                  textInputType: TextInputType.emailAddress,
                                  hintText: "Your email id",
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
                                  minLength: 9,
                                  controller: EventoController
                                      .eventoController.passwordEditingController,
                                  textInputType: TextInputType.visiblePassword,
                                  hintText: "Password",
                                  obscureText: true,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: ()=>Get.to(()=>const ForgotPasswordSectionOne()),
                                    child: CommonText(
                                      text: "Forgot password?",
                                      size: 13.sp,
                                      weight: FontWeight.w400,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                Center(
                                  child: commonButton(text: "Login",textSize: 14.0,width: 150.0.w,onPressed: ()=>Get.to(()=>const EventoHolder()))
                                ),
                                SizedBox(height: 20.0.h,),
                                Wrap(
                                  children: [
                                    CommonText(
                                      text: "Don't have an account?",
                                      size: 14.sp,
                                      weight: FontWeight.w400,
                                      color: placeHolderColor,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _validate();
                                        if(_formKey.currentState!.validate()){
                                          Get.to(() => const RegisterSectionOne());
                                        }else{
                                          debugPrint("EE Kappal Aadi Ulayilla Sir....");
                                        }
                                      },
                                      child: CommonText(
                                        text: "\t\tSignUp",
                                        size: 14.sp,
                                        weight: FontWeight.w400,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
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
    );
  }
  void _validate() {
    _formKey.currentState?.validate();
  }
}
