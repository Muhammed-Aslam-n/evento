import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/authentication_screens/register/register_section_two.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterSectionOne extends StatelessWidget {
  const RegisterSectionOne({Key? key}) : super(key: key);

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
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "Email",
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
                                  .eventoController.emailEditingController,
                              textInputType: TextInputType.emailAddress,
                              errorText: "Email Required",
                              hintText: "Email",
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "Phone number",
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
                                  .eventoController.phoneNumberController,
                              textInputType: TextInputType.phone,
                              errorText: "Phone number Required",
                              hintText: "Phone number",
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 45.h,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Container(
                                    height: 64.h,
                                    width: 64.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: secondaryColor),
                                    child: IconButton(
                                      onPressed: () {
                                        EventoController.eventoController
                                            .setAppLaunched();
                                        Get.to(() => const RegisterSectionTwo());
                                      },
                                      icon: const Icon(
                                        Icons.keyboard_arrow_right,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
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
