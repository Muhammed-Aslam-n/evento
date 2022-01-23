import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/screen/screen_main/holder/evento_pageholder.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpSection extends StatelessWidget {
  const ForgotPasswordOtpSection({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextStyle? createStyle(Color color) {
      ThemeData theme = Theme.of(context);
      return theme.textTheme.headline3?.copyWith(color: color);
    }

    final otpTextStyles = List.filled(6, createStyle(primaryTextColor));
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
              Image.asset("assets/images/loginImages/forgottPasswordImage.png"),
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
                        text: "Forgot Password",
                        color: primaryColor,
                        size: 24.sp,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 36.w),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Enter your OTP",
                                size: 16.sp,
                                color: primaryColor,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              OtpTextField(
                                numberOfFields: 6,
                                borderColor: secondaryColor,
                                focusedBorderColor: primaryColor,
                                styles: otpTextStyles,
                                showFieldAsBox: false,
                                borderWidth: 4.0,
                                onCodeChanged: (String code) {
                                  debugPrint(code.toString());
                                },
                                //runs when every textfield is filled
                                onSubmit: (String verificationCode) {
                                  Get.to(()=>const EventoHolder());
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 65.h,
                              ),
                              Center(
                                child: commonButton(
                                  text: "Resend OTP",
                                  textSize: 14.0,
                                  width: 150.0.w,
                                  onPressed: (){
                                    debugPrint("OTP SENT");
                                  }
                                ),
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                            ],
                          ),
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
