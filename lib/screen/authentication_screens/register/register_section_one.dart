import 'package:evento/constants/colors.dart';
import 'package:evento/controller/authorization/registerController.dart';
import 'package:evento/widgets/auth_fields.dart';
import 'package:evento/widgets/auth_platform_widget.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:form_validator/form_validator.dart';
import 'package:the_validator/the_validator.dart';
import 'package:get/get.dart';

class RegisterSectionOne extends StatelessWidget {
  RegisterSectionOne({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = RegisterController.registerEventoController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 36.h,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    CommonText(
                      text: "Let's Get Started",
                      color: primaryColor,
                      size: 28.sp,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          AuthTextField(
                            minLength: 1,
                            controller: controller.nameController,
                            textInputType: TextInputType.name,
                            hintText: "Name",
                            prefixIcon: Icons.person,
                            obscureText: false,
                            inputFormatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[a-z.A-Z ]'))
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AuthTextField(
                            minLength: 3,
                            controller: controller.userNameController,
                            textInputType: TextInputType.name,
                            hintText: "Username",
                            prefixIcon: Icons.class_,
                            obscureText: false,
                            inputFormatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[a-z.A-Z ]'))
                            ],
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          AuthTextField(
                            controller: controller.phoneNumberController,
                            textInputType: TextInputType.number,
                            hintText: "Mobile number",
                            prefixIcon: Icons.call,
                            obscureText: false,
                            validationBuilder:
                                ValidationBuilder().phone().build(),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          AuthTextField(
                            controller: controller.signupEmailCntrlr,
                            textInputType: TextInputType.emailAddress,
                            hintText: "Email",
                            prefixIcon: Icons.email,
                            obscureText: false,
                            validationBuilder:
                                ValidationBuilder().email().build(),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          AuthTextField(
                            minLength: 8,
                            controller: controller.signupPassCntrlr,
                            textInputType: TextInputType.visiblePassword,
                            hintText: "Password",
                            prefixIcon: Entypo.key,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          AuthTextField(
                              minLength: 8,
                              controller: controller.confirmPwdCntrlr,
                              textInputType: TextInputType.visiblePassword,
                              hintText: "Confirm Password",
                              prefixIcon: Icons.vpn_key,
                              obscureText: true,
                              validationBuilder: FieldValidator.equalTo(
                                  controller.signupPassCntrlr,
                                  message: "Password mismatch")),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          const CommonText(
                            text: "Or, Signup with...",
                            color: placeHolderColor,
                            size: 11,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          LoginOrSigningPlatform(
                            height: 40,
                            width: 50,
                            onTap: () {
                              debugPrint("Login with Google Clicked");
                            },
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          commonButton(
                            text: "Join Us",
                            color: primaryColor,
                            onPressed: () {
                              validateForm(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GetBuilder<RegisterController>(
                  id: "registrationStateChange",
                  builder: (controller) {
                    debugPrint(
                        "Value of Progress in mainScreen is ${controller.isPostingProgress}");
                    return controller.isPostingProgress
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: SizedBox(
                                    height: 100.h,
                                    width: 100.w,
                                    child: const CircularProgressIndicator(color: primaryColor,))),
                          )
                        : const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  validateForm(context) {
    if (_formKey.currentState!.validate()) {
      controller.changePostingState();
      controller.registerVendor(context);
      FocusScope.of(context).unfocus();
    }
  }
}
