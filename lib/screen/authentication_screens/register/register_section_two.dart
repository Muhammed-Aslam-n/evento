import 'package:evento/screen/profile_setup/profile_setup.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/datatext_field.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class RegisterSectionTwo extends StatelessWidget {
  RegisterSectionTwo({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: loginBgColor,
        body: SingleChildScrollView(  
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset("assets/images/loginImages/loginBgVendor.png",height: 200.h,),
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
                              height: 18.h,
                            ),
                            CommonText(
                              text: "Sign Up",
                              color: primaryColor,
                              size: 27.sp,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.w, right: 0.w),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: CommonText(
                                        text: "Phone number",
                                        size: 14.sp,
                                        color: primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    DataTextFields(
                                      controller: EventoController
                                          .eventoController.phoneNumberController,
                                      textInputType: TextInputType.number,
                                      hintText: "Mobile number",
                                      obscureText: false,
                                      validationBuilder: ValidationBuilder().phone().build(),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: CommonText(
                                        text: "Email",
                                        size: 14.sp,
                                        color: primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    DataTextFields(
                                      controller: EventoController
                                          .eventoController.emailEditingController,
                                      textInputType: TextInputType.emailAddress,
                                      hintText: "Login email",
                                      obscureText: false,
                                      validationBuilder: ValidationBuilder().email().build(),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: CommonText(
                                        text: "Password",
                                        size: 14.sp,
                                        color: primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    DataTextFields(
                                      minLength: 8,
                                      controller: EventoController
                                          .eventoController.passwordEditingController,
                                      textInputType: TextInputType.visiblePassword,
                                      hintText: "Enter your password",
                                      obscureText: true,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: CommonText(
                                        text: "Confirm Password",
                                        size: 14.sp,
                                        color: primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    DataTextFields(
                                      minLength: 8,
                                      controller: EventoController.eventoController
                                          .confirmPasswordEditingController,
                                      textInputType: TextInputType.visiblePassword,
                                      hintText: "Re-enter password",
                                      obscureText: true,
                                    ),
                                    SizedBox(
                                      height: 26.h,
                                    ),
                                    Center(
                                      child: commonButton(text: "Join Us",textSize: 14.0,width: 150.0.w,onPressed: ()=>validateFormField(context))
                                    ),
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
        ),
      ),
    );
  }

  validateFormField(BuildContext context) {
    if(_formKey.currentState!.validate()){
      Get.to(() => const SetupProfile());
      FocusScope.of(context).unfocus();
      EventoController.eventoController.clearSignup2Controllers();
    }
  }
}
