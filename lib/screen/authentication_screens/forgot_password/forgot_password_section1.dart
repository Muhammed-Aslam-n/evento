import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/authorization/forgotController.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/datatext_field.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordSectionOne extends StatelessWidget {
  ForgotPasswordSectionOne({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = EventoForgotController.eventoFpController;

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
              Image.asset(
                  "assets/images/loginImages/forgottPasswordImage.png"),
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
                                text: "Phone number",
                                size: 16.sp,
                                color: primaryColor,
                              ),
                              DataTextFields(
                                minLength: 10,
                                controller: controller.fpPhoneNumber,
                                textInputType: TextInputType.phone,
                                hintText: "Mobile number",
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              const CommonText(
                                text: "OTP will be sent to this number",
                                color: warningColors,
                                weight: FontWeight.w400,
                                size: 11,
                              ),
                              SizedBox(
                                height: 65.h,
                              ),
                              Center(
                                child: commonButton(
                                  text: "Send OTP",
                                  textSize: 14.0,
                                  width: 150.0.w,
                                  onPressed: () {
                                    validateForm(context);
                                  },
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

  validateForm(context) {
    if (_formKey.currentState!.validate()) {
      controller.fpNumberVerification();
      FocusScope.of(context).unfocus();
    }
  }
}
