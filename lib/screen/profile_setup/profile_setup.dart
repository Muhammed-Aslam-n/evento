import 'package:evento/screen/subscription_payment/subscription_methods.dart';
import 'package:flutter/material.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetupProfile extends StatelessWidget {
  const SetupProfile({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CommonText(
                    text: "Setup Profile",
                    color: primaryColor,
                    size: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CommonProfileDisplayWidget(height: 130.h,width: 130.w,color: whiteColor,),
                //     : const SizedBox(
                //   height: 150,
                //   width: 150,
                //   child: CircleAvatar(
                //     backgroundImage: AssetImage(
                //         "assets/images/profile/noProfilePictureImage.png"),
                //   ),
                // ),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
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
                        minLength: 9,
                        controller:
                            EventoController.eventoController.userNameController,
                        textInputType: TextInputType.name,
                        hintText: "your username",
                      ),
                      SizedBox(
                        height: 10.h,
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
                          }),
                      SizedBox(
                        height: 10.h,
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
                        minLength: 9,
                        controller:
                            EventoController.eventoController.placeController,
                        textInputType: TextInputType.name,
                        hintText: "enter your place",
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.h,
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
                        minLength: 9,
                        controller: EventoController
                            .eventoController.cityEditingController,
                        textInputType: TextInputType.phone,
                        hintText: "name of your city",
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20.h,
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
                        minLength: 9,
                        controller:
                            EventoController.eventoController.districtController,
                        textInputType: TextInputType.phone,
                        hintText: "your district",
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20.h,
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
                        minLength: 9,
                        controller:
                            EventoController.eventoController.userStateController,
                        textInputType: TextInputType.phone,
                        hintText: "enter your state",
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Center(
                        child: commonButton(
                          text: "Choose Your Plan",
                          onPressed: () {

                            if(_formKey.currentState!.validate()){
                              // Get.to(() => const RegisterSectionOne());
                              showSubscriptionBottomSheet();
                            }else{
                              debugPrint("EE Kappal Aadi Ulayilla Sir....");
                            }
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
