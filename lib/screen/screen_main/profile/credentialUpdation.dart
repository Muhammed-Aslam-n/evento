import 'package:evento/constants/colors.dart';
import 'package:evento/controller/profile/editCredentialsController.dart';
import 'package:evento/widgets/auth_fields.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/registerTextField.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CredentialUpdation extends StatelessWidget {
  CredentialUpdation({Key? key}) : super(key: key);
  final editCredentialController =
      EditProfileCredentialsController.editProfileCredentialsController;
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  const CommonText(
                    text: "Update Credentials",
                    color: primaryTextColor,
                    size: 17,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GetBuilder<EditProfileCredentialsController>(
                    builder: (controller) {
                      return ListTile(
                        leading: Icon(
                          Linecons.mail,
                          color: controller.style1[1],
                        ),
                        title: Text(
                          "Email",
                          style: TextStyle(color: controller.style1[1]),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            controller.style1[0],
                            color: controller.style1[1],
                          ),
                          onPressed: () {
                            controller.changeEmailIcon();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 0.h,
                  ),
                  GetBuilder<EditProfileCredentialsController>(
                    builder: (visibilityController) {
                      return Visibility(
                        visible: visibilityController.isVisible1,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 200.h,
                          width: double.maxFinite,
                          child: Form(
                            key: _formKey1,
                            child: Column(
                              children: [
                                Expanded(
                                  child: RegisterTextField(
                                    controller: editCredentialController
                                        .currentEmailController,
                                    validationBuilder:
                                        ValidationBuilder().email().build(),
                                    textInputType: TextInputType.emailAddress,
                                    hintText: "Current Email",
                                  ),
                                ),
                                Expanded(
                                  child: RegisterTextField(
                                    controller: editCredentialController
                                        .newEmailController,
                                    validationBuilder:
                                        ValidationBuilder().email().build(),
                                    textInputType: TextInputType.emailAddress,
                                    hintText: "New Email",
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Flexible(
                                  child: commonButton(
                                    text: "Change",
                                    width: 100.w,
                                    textSize: 11.0,
                                    height: 20.h,
                                    onPressed: () {
                                      validateToUpdateEmail(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<EditProfileCredentialsController>(
                    builder: (controller) {
                      return ListTile(
                        leading: Icon(
                          Entypo.key,
                          color: controller.style2[1],
                        ),
                        title: Text(
                          "Password",
                          style: TextStyle(color: controller.style2[1]),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            controller.style2[0],
                            color: controller.style2[1],
                          ),
                          onPressed: () {
                            controller.changePassIcon();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<EditProfileCredentialsController>(
                    builder: (visibilityController) {
                      return Visibility(
                        visible: visibilityController.isVisible2,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 200.h,
                          width: double.maxFinite,
                          child: Center(
                            child: Form(
                              key: _formKey2,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: RegisterTextField(
                                      controller: editCredentialController
                                          .currentPassword,
                                      minLength: 8,
                                      textInputType: TextInputType.visiblePassword,
                                      hintText: "Current Password",
                                    ),
                                  ),
                                  Expanded(
                                    child: RegisterTextField(
                                      controller:
                                          editCredentialController.newPassword,
                                      minLength: 8,
                                      textInputType: TextInputType.visiblePassword,
                                      hintText: "New Password",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Flexible(
                                    child: commonButton(
                                      text: "Change",
                                      width: 100.w,
                                      textSize: 11.0,
                                      height: 20.h,
                                      onPressed: () {
                                        validateToUpdatePassword(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<EditProfileCredentialsController>(
                    builder: (controller) {
                      return ListTile(
                        leading: Icon(
                          LineariconsFree.phone_handset,
                          color: controller.style3[1],
                        ),
                        title: Text(
                          "Phone number",
                          style: TextStyle(color: controller.style3[1]),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            controller.style3[0],
                            color: controller.style3[1],
                          ),
                          onPressed: () {
                            controller.changePhoneIcon();
                          },
                        ),
                      );
                    },
                  ),
                  GetBuilder<EditProfileCredentialsController>(
                    builder: (visibilityController) {
                      return Visibility(
                        visible: visibilityController.isVisible3,
                        maintainAnimation: true,
                        maintainSize: true,
                        maintainState: true,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 200.h,
                          width: double.maxFinite,
                          child: Center(
                            child: Form(
                              key: _formKey3,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: RegisterTextField(
                                      controller: editCredentialController
                                          .currentPhonenumber,
                                      minLength: 8,
                                      textInputType: TextInputType.phone,
                                      hintText: "Current Phone number",
                                    ),
                                  ),
                                  Expanded(
                                    child: RegisterTextField(
                                      controller: editCredentialController
                                          .newPhonenumber,
                                      minLength: 8,
                                      textInputType: TextInputType.phone,
                                      hintText: "New Phone number",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Flexible(
                                    child: commonButton(
                                      text: "Change",
                                      width: 100.w,
                                      textSize: 11.0,
                                      height: 20.h,
                                      onPressed: () {
                                        validateToUpdatePhoneNumber(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateToUpdateEmail(BuildContext context) {
    if (_formKey1.currentState!.validate()) {
      editCredentialController.getNewEmailFromUI();
      FocusScope.of(context).unfocus();
    }
  }

  void validateToUpdatePassword(BuildContext context) {
    if (_formKey2.currentState!.validate()) {
      editCredentialController.getNewPasswordFromUI();
      FocusScope.of(context).unfocus();
    }
  }

  void validateToUpdatePhoneNumber(BuildContext context) {
    if (_formKey2.currentState!.validate()) {
      editCredentialController.getNewPasswordFromUI();
      FocusScope.of(context).unfocus();
    }
  }
}
