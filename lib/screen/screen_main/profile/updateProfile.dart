import 'package:evento/controller/profile/editProfileDetailsController.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/hovering_utility_widget.dart';
import 'package:evento/widgets/profiledisplyawidget.dart';
import 'package:evento/widgets/registerTextField.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:evento/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({Key? key}) : super(key: key);
  final updateController = EditProfile.editProfile;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBgColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CommonText(
                    text: "Update Profile",
                    color: primaryColor,
                    size: 22.sp,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                SizedBox(
                  height: 140.h,
                  width: 130.w,
                  child: Stack(
                    children: [
                      GetBuilder<EditProfile>(
                          id: "UpdateWholeProfile",
                          builder: (controller) {
                            return CommonProfileDisplayWidget(
                              height: 130.h,
                              width: 130.w,
                              url: controller.profileString,
                              color: whiteColor,
                            );
                          }),
                      updateController.file.path == ''
                          ? Positioned(
                              right: 5,
                              bottom: 20,
                              child: HoveringUtilityWidget(
                                icon: Icons.edit,
                                height: 30.h,
                                width: 30.w,
                                iconSize: 20,
                                onPressed: (context) {
                                  updateController.getVendorProfilePicture();
                                  debugPrint(
                                      "Vendor profile picture setting button clicked");
                                },
                              ),
                            )
                          : Positioned(
                              right: 15,
                              bottom: 10,
                              child: HoveringUtilityWidget(
                                icon: Icons.edit,
                                height: 30.h,
                                width: 30.w,
                                iconSize: 20,
                                onPressed: (context) {
                                  updateController.getVendorProfilePicture();
                                  debugPrint(
                                      "Vendor profile picture setting button clicked");
                                },
                              ),
                            )
                    ],
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        RegisterTextField(
                          minLength: 3,
                          controller: updateController.usernameController,
                          textInputType: TextInputType.name,
                          hintText: "Full name",
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        SizedBox(
                          height: 60.h,
                          width: MediaQuery.of(context).size.width * 0.87,
                          child: GetBuilder<EditProfile>(
                            id: "UpdateWholeProfile",
                            builder: (controller) {
                              return DropdownButton<String>(
                                isExpanded: true,
                                underline: const Divider(
                                  color: primaryColor,
                                  thickness: 1.2,
                                ),
                                value: controller.userSelectedProfession,
                                hint: const CommonText(
                                  text: "Select your profession",
                                  color: newTextColor,
                                  size: 13,
                                  weight: FontWeight.w400,
                                ),
                                items: controller.professionList
                                    .map(buildDropDownItems)
                                    .toList(),
                                onChanged: (value) {
                                  controller.changeDropdownItem(value ?? '');
                                  debugPrint(controller.userSelectedProfession);
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RegisterTextField(
                                    minLength: 3,
                                    controller:
                                        updateController.placeController,
                                    textInputType: TextInputType.name,
                                    hintText: "Your place",
                                    obscureText: false,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RegisterTextField(
                                    minLength: 3,
                                    controller: updateController.cityController,
                                    textInputType: TextInputType.text,
                                    hintText: "Your city",
                                    obscureText: false,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  RegisterTextField(
                                    minLength: 3,
                                    controller:
                                        updateController.userStateController,
                                    textInputType: TextInputType.name,
                                    hintText: "State",
                                    obscureText: false,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  RegisterTextField(
                                    minLength: 3,
                                    controller:
                                        updateController.zipCodeController,
                                    textInputType: TextInputType.phone,
                                    hintText: "Pin Code",
                                    obscureText: false,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: primaryColor),
                            ),
                          ),
                          margin: EdgeInsets.only(top: 10.h, right: 10),
                          padding: EdgeInsets.only(left: 10.w, top: 10.h),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: updateController.descriptionController,
                            maxLines: 5,
                            decoration: const InputDecoration.collapsed(
                              hintText: "About you",
                              border: InputBorder.none,
                            ),
                            validator:
                                ValidationBuilder().minLength(50).build(),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: commonButton(
                            text: "Update",
                            width: 170.w,
                            textSize: 14.0,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                updateController.sendProfileUpdateValues();
                                FocusScope.of(context).unfocus();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildDropDownItems(String item) => DropdownMenuItem(
        value: item,
        child: CommonText(
          text: item,
          size: 13,
          color: Colors.black87,
          weight: FontWeight.w500,
        ),
      );
}
