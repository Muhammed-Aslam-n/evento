import 'package:flutter/material.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../home.dart';

class SetupProfile extends StatelessWidget {
  const SetupProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 43.h,
                ),
                CommonText(
                  text: "Setup Profile",
                  color: primaryColor,
                  size: 32.sp,
                ),
                SizedBox(
                  height: 13.h,
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
                        height: 3.h,
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
                        height: 3.h,
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
                        height: 3.h,
                      ),
                      DataTextFields(
                        minLength: 9,
                        controller: EventoController
                            .eventoController.confirmPasswordEditingController,
                        textInputType: TextInputType.phone,
                        errorText: "Confirm password Required",
                        hintText: "re-enter password",
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const EventoHome());
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size(137.w, 48.h)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                                side: const BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                          child: CommonText(
                            text: "Join Us",
                            size: 20.sp,
                            weight: FontWeight.w500,
                            color: secondaryColor,
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
      ),
    );
  }
}
