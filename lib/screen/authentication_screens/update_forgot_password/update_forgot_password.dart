import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/authorization/forgotController.dart';
import 'package:evento/widgets/auth_fields.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:the_validator/the_validator.dart';

class UpdateForgotPassword extends StatelessWidget {
  UpdateForgotPassword({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = EventoForgotController.eventoFpController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 36.h,
                ),
                Image.asset(
                  "assets/images/newImages/loginImagen.png",
                  height: 200,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: loginBorderRadius),
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          CommonText(
                            text: "Change Password",
                            color: primaryColor,
                            size: 26.sp,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                AuthTextField(
                                  minLength: 8,
                                  controller:
                                  controller.fpNewPassword,
                                  textInputType:
                                  TextInputType.visiblePassword,
                                  hintText: "Current Password",
                                  prefixIcon: Icons.lock,
                                  validationBuilder:
                                  ValidationBuilder().build(),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                AuthTextField(
                                  minLength: 8,
                                  controller: controller
                                      .fpConfirmNewPassword,
                                  textInputType:
                                  TextInputType.visiblePassword,
                                  hintText: "Confirm New Password",
                                  obscureText: true,
                                  prefixIcon: Icons.lock,
                                  validationBuilder: FieldValidator.equalTo(
                                      controller.fpNewPassword,
                                      message: "Password mismatch"),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),

                                SizedBox(
                                  height: 42.h,
                                ),
                                Center(
                                  child: commonButton(
                                    text: "Update",
                                    textSize: 14.0,
                                    width: 200.0.w,
                                    bgColor: primaryColor,
                                    onPressed: () {
                                      validateToChangePassword(context);
                                    },
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateToChangePassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      controller.fpUpdatePassword();
      FocusScope.of(context).unfocus();
    }
  }




}
