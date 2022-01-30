import 'package:evento/controller/profile_setup/profile_setup.dart';
import 'package:evento/screen/subscription_payment/subscription_methods.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/datatext_field.dart';
import 'package:evento/widgets/hovering_utility_widget.dart';
import 'package:evento/widgets/profiledisplyawidget.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetupProfile extends StatelessWidget {
  SetupProfile({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final pSetupController = ProfileSetupController.setupProfileController;

  @override
  Widget build(BuildContext context) {
    pSetupController.clearProfileControllers();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: loginBgColor,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CommonText(
                    text: "Setup Profile",
                    color: primaryColor,
                    size: 22.sp,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                SizedBox(
                  height: 140.h,
                  width: 130.w,
                  child: Stack(
                    children: [
                      CommonProfileDisplayWidget(
                        height: 130.h,
                        width: 130.w,
                        color: whiteColor,
                      ),
                      Positioned(
                        right: 15,
                        bottom: 10,
                        child: HoveringUtilityWidget(
                          icon: Icons.edit,
                          height: 30.h,
                          width: 30.w,
                          iconSize: 20,
                          onPressed: (context) {
                            debugPrint(
                                "Vendor profile picture setting button clicked");
                          },
                        ),
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
                          height: 20.h,
                          child: CommonText(
                            text: "Your name",
                            size: 15.sp,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        DataTextFields(
                          minLength: 3,
                          controller: pSetupController.usernameController,
                          textInputType: TextInputType.name,
                          hintText: "Username",
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        GetBuilder<EventoController>(
                          id: "dropDownItem",
                          builder: (controller) {
                            return SizedBox(
                              height: 60.h,
                              width: MediaQuery.of(context).size.width * 0.87,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: controller.userSelectedProfession,
                                hint: const CommonText(
                                  text: "Select your profession",
                                  color: primaryColor,
                                ),
                                items: controller.professionList
                                    .map(buildDropDownItems)
                                    .toList(),
                                onChanged: (value) {
                                  controller.changeDropdownItem(value ?? '');
                                  debugPrint(controller.userSelectedProfession);
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          height: 23.h,
                          child: CommonText(
                            text: "Place",
                            size: 15.sp,
                            color: primaryColor,
                          ),
                        ),
                        DataTextFields(
                          minLength: 3,
                          controller: pSetupController.placeController,
                          textInputType: TextInputType.name,
                          hintText: "Your place",
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 23.h,
                          child: CommonText(
                            text: "City",
                            size: 15.sp,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        DataTextFields(
                          minLength: 3,
                          controller: pSetupController.cityController,
                          textInputType: TextInputType.phone,
                          hintText: "Your city",
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 23.h,
                          child: CommonText(
                            text: "District",
                            size: 15.sp,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        DataTextFields(
                          minLength: 3,
                          controller: pSetupController.districtController,
                          textInputType: TextInputType.phone,
                          hintText: "Your district",
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 23.h,
                          child: CommonText(
                            text: "State",
                            size: 15.sp,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        DataTextFields(
                          minLength: 3,
                          controller: pSetupController.userStateController,
                          textInputType: TextInputType.phone,
                          hintText: "Your state",
                          obscureText: false,
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
                                  // Get.to(() => const RegisterSectionOne());
                                  showSubscriptionBottomSheet();
                                } else {
                                  debugPrint("EE Kappal Aadi Ulayilla Sir....");
                                }
                              },
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
      ),
    );
  }

  DropdownMenuItem<String> buildDropDownItems(String item) => DropdownMenuItem(
        value: item,
        child: CommonText(
          text: item,
          size: 13,
          color: primaryColor,
        ),
      );

  void showSubscriptionBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: Color(0xFFFAF9F6), borderRadius: loginBorderRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
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
                    borderRadius: BorderRadius.circular(24), color: whiteColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          GetBuilder<EventoController>(
                              id: 'subscriptionSection',
                              builder: (controller) {
                                return Radio(
                                  value: 1,
                                  groupValue:
                                      controller.userSelectedProfessionValue,
                                  onChanged: (value) {
                                    controller
                                        .changeSubscriptionMode(value ?? 1);
                                  },
                                  activeColor: Colors.green,
                                );
                              }),
                        ],
                      ),
                      const CommonText(
                        text: "₹ 99/month",
                      )
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
                    borderRadius: BorderRadius.circular(24), color: whiteColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          GetBuilder<EventoController>(
                            id: 'subscriptionSection',
                            builder: (controller) {
                              return Radio(
                                value: 2,
                                groupValue:
                                    controller.userSelectedProfessionValue,
                                onChanged: (value) {
                                  controller.changeSubscriptionMode(value ?? 2);
                                },
                                activeColor: Colors.green,
                              );
                            },
                          ),
                        ],
                      ),
                      const CommonText(
                        text: "₹ 99/month",
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
                  return Get.to(() => const SubscriptionMethods());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
