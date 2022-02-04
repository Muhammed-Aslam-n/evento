import 'package:evento/controller/profile_setup/profile_setup.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/hovering_utility_widget.dart';
import 'package:evento/widgets/profiledisplyawidget.dart';
import 'package:evento/widgets/registerTextField.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetupProfile extends StatelessWidget {
  SetupProfile({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final pSetupController = ProfileSetupController.setupProfileController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
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
                        text: "Setup Profile",
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
                          GetBuilder<ProfileSetupController>(
                            id: 'vendorProfilePictureSelection',
                            builder: (controller) {
                              return controller.file.path == ''
                                  ? Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: ExactAssetImage(
                                                  "assets/images/loginImages/noProfileImage.png"))),
                                    )
                                  : controller.file.runtimeType.toString() ==
                                          '_File'
                                      ? CircleAvatar(
                                          backgroundImage:
                                              FileImage(controller.file),
                                          radius: 150,
                                        )
                                      : CommonProfileDisplayWidget(
                                          height: 130.h,
                                          width: 130.w,
                                          url: controller.file.path,
                                          color: whiteColor,
                                        );
                            },
                          ),
                          GetBuilder<ProfileSetupController>(
                            id: 'vendorProfilePictureSelection',
                            builder: (controller) {
                              return controller.file.path == ''
                                  ? Positioned(
                                      right: 15,
                                      bottom: 30,
                                      child: HoveringUtilityWidget(
                                        icon: Icons.edit,
                                        height: 30.h,
                                        width: 30.w,
                                        iconSize: 20,
                                        onPressed: (context) {
                                          pSetupController
                                              .getVendorProfilePicture();
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
                                          pSetupController
                                              .getVendorProfilePicture();
                                          debugPrint(
                                              "Vendor profile picture setting button clicked");
                                        },
                                      ),
                                    );
                            },
                          ),
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
                              controller: pSetupController.usernameController,
                              textInputType: TextInputType.name,
                              hintText: "Full name",
                            ),
                            SizedBox(
                              height: 13.h,
                            ),
                            SizedBox(
                              height: 60.h,
                              width: MediaQuery.of(context).size.width * 0.87,
                              child: GetBuilder<ProfileSetupController>(
                                id: "dropDownItem",
                                builder: (controller) {
                                  return DropdownButton<String>(
                                    isExpanded: true,
                                    underline: const Divider(
                                      color: primaryColor,
                                      thickness: 1.2,
                                    ),
                                    value:
                                        pSetupController.userSelectedProfession,
                                    hint: const CommonText(
                                      text: "Select your profession",
                                      color: newTextColor,
                                      size: 13,
                                      weight: FontWeight.w400,
                                    ),
                                    items: pSetupController.professionList
                                        .map(buildDropDownItems)
                                        .toList(),
                                    onChanged: (value) {
                                      pSetupController
                                          .changeDropdownItem(value ?? '');
                                      debugPrint(pSetupController
                                          .userSelectedProfession);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RegisterTextField(
                                        minLength: 3,
                                        controller:
                                            pSetupController.placeController,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RegisterTextField(
                                        minLength: 3,
                                        controller:
                                            pSetupController.cityController,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      RegisterTextField(
                                        minLength: 3,
                                        controller: pSetupController
                                            .userStateController,
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
                                            pSetupController.zipCodeController,
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
                                  bottom: BorderSide(
                                      width: 1.0, color: primaryColor),
                                ),
                              ),
                              margin: EdgeInsets.only(top: 10.h, right: 10),
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: const TextField(
                                maxLines: 5,
                                decoration: InputDecoration.collapsed(
                                    hintText: "About you",
                                    border: InputBorder.none),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: commonButton(
                                  width: 210.w,
                                  height: 55.0.h,
                                  textSize: 14.0,
                                  text: "Choose Your Plan",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      showSubscriptionBottomSheet(context);
                                    } else {
                                      debugPrint(
                                          "EE Kappal Aadi Ulayilla Sir....");
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

  void showSubscriptionBottomSheet(context) {
    Get.bottomSheet(
      GetBuilder<ProfileSetupController>(
        id: 'subscriptionSection',
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFAF9F6), borderRadius: loginBorderRadius),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: "Choose Your Plan",
                        color: secondaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Container(
                      width: 375.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CommonText(
                                  text: "Monthly",
                                  color: secondaryColor,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: pSetupController
                                      .userSelectedProfessionValue,
                                  onChanged: (value) {
                                    pSetupController
                                        .changeSubscriptionMode(value ?? 1);
                                    pSetupController.planDetails.clear();
                                    pSetupController.planDetails.add('Monthly');
                                    pSetupController.planDetails.add('99');
                                  },
                                  activeColor: Colors.green,
                                )
                              ],
                            ),
                            CommonText(
                              text: "₹ 99",
                              size: 22.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 375.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CommonText(
                                  text: "Yearly",
                                  color: secondaryColor,
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: pSetupController
                                      .userSelectedProfessionValue,
                                  onChanged: (value) {
                                    pSetupController
                                        .changeSubscriptionMode(value ?? 2);
                                    pSetupController.planDetails.clear();
                                    pSetupController.planDetails.add('Yearly');
                                    pSetupController.planDetails.add('1188');
                                  },
                                  activeColor: Colors.green,
                                )
                              ],
                            ),
                            CommonText(
                              text: "₹ 1188",
                              size: 22.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    commonButton(
                      text: "Continue to Checkout",
                      textSize: 14.0,
                      width: 300.0.w,
                      onPressed: () {
                        Get.back();
                        pSetupController.sendProfileSetupValues();
                        // return Get.to(() => const SubscriptionMethods());
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
