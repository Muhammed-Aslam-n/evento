import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/register/register_section_one.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({Key? key}) : super(key: key);

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
                        text: "Log In",
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
                            CommonText(
                              text: "Email",
                              size: 16.sp,
                              color: primaryColor,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            DataTextFields(
                              minLength: 9,
                              controller: EventoController
                                  .eventoController.emailEditingController,
                              textInputType: TextInputType.emailAddress,
                              errorText: "Email is Required",
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
                            SizedBox(
                              height: 3.h,
                            ),
                            DataTextFields(
                              minLength: 9,
                              controller: EventoController
                                  .eventoController.passwordEditingController,
                              textInputType: TextInputType.visiblePassword,
                              errorText: "Password Required",
                              hintText: "Password",
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CommonText(
                                text: "Forgot password?",
                                size: 13.sp,
                                weight: FontWeight.w400,
                                color: secondaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 17.h,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(137.w, 48.h)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          whiteColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      side: const BorderSide(color: Colors.red),
                                    ),
                                  ),
                                ),
                                child: CommonText(
                                  text: "Login",
                                  size: 20.sp,
                                  weight: FontWeight.w500,
                                  color: secondaryColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
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
                                    Get.to(() => const RegisterSectionOne());
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
