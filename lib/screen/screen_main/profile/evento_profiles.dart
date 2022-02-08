import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/profile/editCredentialsController.dart';
import 'package:evento/controller/profile/editProfileDetailsController.dart';
import 'package:evento/controller/profile/showProfileDetailsController.dart';
import 'package:evento/screen/screen_main/profile/credentialUpdation.dart';
import 'package:evento/screen/screen_main/profile/updateProfile.dart';
import 'package:evento/screen/screen_main/profile/details_profile.dart';
import 'package:evento/screen/screen_main/profile/reviews_evento.dart';
import 'package:evento/widgets/auth_fields.dart';
import 'package:evento/widgets/build_rating_star.dart';
import 'package:evento/widgets/profiledisplyawidget.dart';
import 'package:evento/widgets/snackbar_common.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventoProfile extends StatelessWidget {
  const EventoProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                profileMenuButton(),
                SizedBox(
                  height: 161.h,
                  width: 161.w,
                  child: Stack(
                    children: [
                      GetBuilder<ShowProfilesDetailsController>(
                          builder: (controller) {
                            return CommonProfileDisplayWidget(
                              url: controller.vendorProfilePicture,
                              color: whiteColor,
                              width: 151.w,
                              height: 151.h,
                            );
                          }
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GetBuilder<ShowProfilesDetailsController>(
                    builder: (controller){
                      return CommonText(
                        text: controller.vendorName,
                        size: 16,
                        weight: FontWeight.w500,
                        color: primaryTextColor,
                      );
                    }
                ),
                SizedBox(
                  height: 11.h,
                ),
                GetBuilder<ShowProfilesDetailsController>(
                    builder: (controller){
                      return CommonText(
                        text: controller.vendorProfession,
                        size: 12,
                        weight: FontWeight.w500,
                        color: placeHolderColor,
                      );
                    }
                ),
                SizedBox(
                  height: 11.h,
                ),
                buildRatingStars(3.0),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(height: 20.h),
                DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TabBar(
                        indicator: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Color(0xFFDFD6F3),
                        ),
                        indicatorColor: Colors.transparent,
                        labelColor: primaryTextColor,
                        unselectedLabelColor: placeHolderColor,
                        tabs: [
                          buildTabBarHeading(text: "Profile"),
                          buildTabBarHeading(text: "Reviews"),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 2,
                        child: const TabBarView(
                          children: <Widget>[
                            DetailsProfile(),
                            ReviewsProfile(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  profileMenuButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: PopupMenuButton(
        color: primaryTextColor,
        offset: const Offset(10, -10),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                Get.back();
                EditProfile().fetchVendorWholeDetailsForUpdation().then((value) => Get.to(() => UpdateProfile()));
              },
              child: const CommonText(
                text: "Update Profile",
                color: whiteColor,
                size: 12,
                weight: FontWeight.w400,
              ),
            ),
            value: 1,
          ),
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                Get.back();
                Get.to(()=> CredentialUpdation());
                // EditProfileCredentialsController.editProfileCredentialsController:
              },
              child: const CommonText(
                text: "Update Credentials",
                color: whiteColor,
                size: 12,
                weight: FontWeight.w400,
              ),
            ),
            value: 1,
          ),
        ],
      ),
    );
  }

  // buildUpdateUsernameBottomSheet(context) {
  //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //   unameUpdateController.clearUpdateUnameCntrlrs();
  //   Get.bottomSheet(
  //     Container(
  //       decoration: const BoxDecoration(
  //           color: whiteColor,
  //           borderRadius: BorderRadius.only(
  //               topLeft: dayContainerRadius, topRight: dayContainerRadius)),
  //       child: SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           child: Form(
  //             key: _formKey,
  //             child: Column(
  //               children: [
  //                 SizedBox(
  //                   height: 40.h,
  //                 ),
  //                 const CommonText(
  //                   text: "Update Username",
  //                   size: 18,
  //                   color: primaryTextColor,
  //                 ),
  //                 SizedBox(
  //                   height: 25.h,
  //                 ),
  //                 AuthTextField(
  //                   hintText: "Current Username",
  //                   controller: unameUpdateController.usernameController,
  //                   minLength: 5,
  //                   prefixIcon: Icons.person,
  //                 ),
  //
  //                 SizedBox(
  //                   height: 5.h,
  //                 ),
  //
  //                 AuthTextField(
  //                   hintText: "New Username",
  //                   controller: unameUpdateController.newUsernameController,
  //                   minLength: 5,
  //                   prefixIcon: Icons.person,
  //                 ),
  //
  //                 SizedBox(
  //                   height: 20.h,
  //                 ),
  //                 TextButton(
  //                     onPressed: () {
  //                       if (_formKey.currentState!.validate()) {
  //                         unameUpdateController.updateUsername();
  //                         Get.back();
  //                         commonSnackBar(
  //                             title: "Password", message: "Password Updated Successfully");
  //                         FocusScope.of(context).unfocus();
  //                       }
  //                       },
  //                     child: const Text(
  //                       "Save",
  //                       style: TextStyle(color: primaryTextColor),
  //                     )),
  //                 SizedBox(
  //                   height: 80.h,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     enableDrag: true,
  //     isDismissible: true,
  //     isScrollControlled: true,
  //   );
  // }
  //
  // buildUpdatePasswordBSheet(context) {
  //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //   final controller = UpdatePassword.updatePasswordController;
  //   controller.clearPControllers();
  //   Get.bottomSheet(
  //     Container(
  //       decoration: const BoxDecoration(
  //           color: whiteColor,
  //           borderRadius: BorderRadius.only(
  //               topLeft: dayContainerRadius, topRight: dayContainerRadius)),
  //       child: SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           child: Form(
  //             key: _formKey,
  //             child: Column(
  //               children: [
  //                 SizedBox(
  //                   height: 40.h,
  //                 ),
  //                 const CommonText(
  //                   text: "Update Password",
  //                   size: 18,
  //                   color: primaryTextColor,
  //                 ),
  //                 SizedBox(
  //                   height: 15.h,
  //                 ),
  //                 AuthTextField(
  //                   hintText: "Current Password",
  //                   controller: controller.currentPassword,
  //                   minLength: 8,
  //                   prefixIcon: Icons.lock,
  //                 ),
  //                 SizedBox(
  //                   height: 20.h,
  //                 ),
  //                 AuthTextField(
  //                   hintText: "New Password",
  //                   controller:
  //                   controller.newPasswordController,
  //                   minLength: 8,
  //                   prefixIcon: Icons.lock,
  //                 ),
  //                 SizedBox(
  //                   height: 20.h,
  //                 ),
  //                 TextButton(
  //                     onPressed: () {
  //                       if (_formKey.currentState!.validate()) {
  //                         controller.updatePassword();
  //                         Get.back();
  //                         commonSnackBar(
  //                             title: "Password", message: "Password Updated Successfully");
  //                         FocusScope.of(context).unfocus();
  //                       }
  //                     },
  //                     child: const Text(
  //                       "Save",
  //                       style: TextStyle(color: primaryTextColor),
  //                     )),
  //                 SizedBox(
  //                   height: 80.h,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     enableDrag: true,
  //     isDismissible: true,
  //     isScrollControlled: true,
  //   );
  // }

  buildTabBarHeading({String? text}) => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: CommonText(
        text: text ?? '',
        size: 14.6,
        weight: FontWeight.w500,
      ),
    ),
  );
}
