import 'package:evento/screen/screen_main/holder/evento_pageholder.dart';
import 'package:evento/screen/profile_setup/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterSectionTwo extends StatelessWidget {
  const RegisterSectionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 36.h,
              ),
              Image.asset("assets/images/loginImages/loginBgVendor.png"),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                        text: "Sign Up",
                        color: primaryColor,
                        size: 32.sp,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.w, right: 36.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "Username",
                                size: 16.sp,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DataTextFields(
                              minLength: 9,
                              controller: EventoController
                                  .eventoController.userNameController,
                              textInputType: TextInputType.name,
                              errorText: "Username Required",
                              hintText: "your username",
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "Password",
                                size: 16.sp,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DataTextFields(
                              minLength: 9,
                              controller: EventoController
                                  .eventoController.passwordEditingController,
                              textInputType: TextInputType.visiblePassword,
                              errorText: "Password Required",
                              hintText: "enter your password",
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "Confirm Password",
                                size: 16.sp,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DataTextFields(
                              minLength: 9,
                              controller: EventoController.eventoController
                                  .confirmPasswordEditingController,
                              textInputType: TextInputType.phone,
                              errorText: "Confirm password Required",
                              hintText: "re-enter password",
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Center(
                              child: commonButton(text: "Join Us",textSize: 14.0,width: 150.0.w,onPressed: ()=>Get.to(()=>const SetupProfile()))
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
