import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/screen_main/profile/details_profile.dart';
import 'package:evento/screen/screen_main/profile/reviews_evento.dart';
import 'package:evento/widgets/build_rating_star.dart';
import 'package:evento/widgets/data_input_type.dart';
import 'package:evento/widgets/hovering_utility_widget.dart';
import 'package:evento/widgets/profiledisplyawidget.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:evento/widgets/widget.dart';
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
                      CommonProfileDisplayWidget(
                        url: sampleProfileImageUrl2,
                        color: whiteColor,
                        width: 151.w,
                        height: 151.h,
                      ),
                      Positioned(
                        right: 15,
                        bottom: 25,
                        child: HoveringUtilityWidget(
                          height: 30.h,
                          width: 30.h,
                          icon: Icons.edit,
                          iconColor: primaryTextColor,
                          iconSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const CommonText(
                  text: "Emiliana Dizuza",
                  size: 16,
                  weight: FontWeight.w500,
                  color: primaryTextColor,
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
                buildUpdateUsernameBottomSheet();
              },
              child: const CommonText(
                text: "Update Username",
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
                buildUpdatePasswordBSheet();
              },
              child: const CommonText(
                text: "Update Password",
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

  buildUpdateUsernameBottomSheet() {
    EventoController.eventoController.clearUsernameUpdatingControllers();
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: dayContainerRadius, topRight: dayContainerRadius)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                const CommonText(
                  text: "Update Username",
                  size: 18,
                  color: primaryTextColor,
                ),
                SizedBox(
                  height: 25.h,
                ),
                DataInputField(
                  hintText: "Current Username",
                  controller:
                      EventoController.eventoController.userNameController,
                  minLength: 5,
                  maxLength: 15,
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: 5.h,
                ),
                DataInputField(
                  hintText: "New Username",
                  controller:
                      EventoController.eventoController.newUsernameController,
                  minLength: 5,
                  maxLength: 15,
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                      EventoController.eventoController.commonSnackBar(
                          "Username", "Username Updated Successfully");
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: primaryTextColor),
                    )),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        ),
      ),
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
    );
  }

  buildUpdatePasswordBSheet() {
    EventoController.eventoController.clearUpdatePasswordControllers();
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: dayContainerRadius, topRight: dayContainerRadius)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                const CommonText(
                  text: "Update Password",
                  size: 18,
                  color: primaryTextColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                DataInputField(
                  hintText: "Current Password",
                  controller: EventoController
                      .eventoController.passwordEditingController,
                  minLength: 5,
                  maxLength: 8,
                  prefixIcon: Icons.password_outlined,
                ),
                SizedBox(
                  height: 5.h,
                ),
                DataInputField(
                  hintText: "New Password",
                  controller:
                      EventoController.eventoController.newPasswordController,
                  minLength: 5,
                  maxLength: 8,
                  prefixIcon: Icons.password_outlined,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                      EventoController.eventoController.commonSnackBar(
                          "Password", "Password Updated Successfully");
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: primaryTextColor),
                    )),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        ),
      ),
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
    );
  }

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
