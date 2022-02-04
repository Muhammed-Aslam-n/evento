import 'package:backdrop/backdrop.dart';
import 'package:evento/api_helper/services/login_api_functions/login_api_service.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/controller/home_controller/home_controller.dart';
import 'package:evento/screen/feedback/evento_feedback.dart';
import 'package:evento/screen/screen_main/home/order/order_details_page.dart';
import 'package:evento/widgets/appointment_shortcard_widget.dart';
import 'package:evento/widgets/appointment_widget.dart';
import 'package:evento/widgets/floating_button.dart';
import 'package:evento/widgets/profiledisplyawidget.dart';
import 'package:evento/widgets/show_simple_dialogue.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:get/get.dart';
import '../../operations/edit_available_slots.dart';

class EventoHome extends StatelessWidget {
  const EventoHome({Key? key}) : super(key: key);
  static HomeController basicProfController = HomeController.homeController;

  @override
  Widget build(BuildContext context) {
    basicProfController.showVendorDetails();
    return BackdropScaffold(
     headerHeight: 300,
      appBar: BackdropAppBar(
        actions: [
          TextButton(
            onPressed: () {
              LoginApiService().refreshToken();
            },
            child: const Text(
              "Refresh Token",
              style: TextStyle(color: whiteColor),
            ),
          )
        ],
        backgroundColor: primaryColor,
      ),
      backLayer: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => const EventoFeedback());
                },
                child: const CommonText(
                  text: "Feedback",
                  color: whiteColor,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ShowSimpleDialogue(
                        title: "Privacy Policy",
                        mdFileName: 'privacy_policy.md',
                      );
                    },
                  );
                },
                child: const CommonText(
                  text: "Privacy Policy",
                  color: whiteColor,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ShowSimpleDialogue(
                        title: "Terms and Conditions",
                        mdFileName: 'terms_conditions.md',
                      );
                    },
                  );
                },
                child: const CommonText(
                  text: "Terms and Conditions",
                  color: whiteColor,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {},
                child: const CommonText(
                  text: "Rate App",
                  color: whiteColor,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {},
                child: const CommonText(
                  text: "Share",
                  color: whiteColor,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () async {
                  await LoginApiService().logoutVendor();
                  debugPrint("Logging Out...");
                },
                child: const CommonText(
                  text: "Logout",
                  color: whiteColor,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
      frontLayer: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 85.h,
                  width: 326.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFFEDEDED),
                  ),
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return ListTile(
                        title: const CommonText(
                          text: "Hello",
                          color: Color(0xFFC1C1B7),
                          weight: FontWeight.w400,
                        ),
                        subtitle: CommonText(
                          text: controller.vendorName,
                          weight: FontWeight.w400,
                        ),
                        trailing: CommonProfileDisplayWidget(
                          url: controller.vendorProfileURL,
                        ),
                      );
                    }
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              const CommonText(
                text: "You've got",
                color: primaryTextColor,
                weight: FontWeight.w600,
                size: 20,
              ),
              SizedBox(
                height: 17.h,
              ),
              GestureDetector(
                onTap: () {
                  EventoController.eventoController.orderedUserUrl =
                      sampleProfileImageUrl;
                  EventoController.eventoController.orderedUserName =
                      "Galileo Galilei";
                  Get.to(() => const OrderDetails());
                },
                child: CommonAppointmentWidget(
                  containerHeight: 138.h,
                  containerWidth: 326.w,
                  imageWidth: 55.w,
                  imageHeight: 56.h,
                  title: "Galileo Galilei",
                  subtitle: "Vlafil Jn.",
                  isTrailing: true,
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              CommonAppointmentWidget(
                containerHeight: 110.h,
                containerWidth: 326.w,
                imageWidth: 40.w,
                imageHeight: 43.h,
                dayText: 'Tomorrow',
                dayCardTextSize: 12.5,
                title: sampleName[0],
                subtitle: "Godis Jn.",
                size: 13,
              ),
              SizedBox(
                height: 23.h,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 4 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 6,
                itemBuilder: (context, index) => AppointmentShortCardWidget(
                  containerHeight: 77.h,
                  containerWidth: 158.w,
                  imageWidth: 34.w,
                  imageHeight: 42.h,
                  contentWidth: 0.w,
                  title: sampleName[index + 1],
                  dayText: sampleDates[index],
                  size: 9.sp,
                  tileGape: -5,
                  dayCardHeight: 24.h,
                  dayCardTextSize: 10,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.h),
        child: FloatingAButton(
          icon: LineariconsFree.calendar_full,
          fabBackground: primaryTextColor,
          iconColor: whiteColor,
          toolTip: "Edit your Slots",
          onPressed: (context) {
            Get.to(() => const EditAvailableSlots());
            debugPrint("Edit Slot Button Clicked");
          },
        ),
      ),
    );
  }
}
