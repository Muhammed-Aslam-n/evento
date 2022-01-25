import 'package:evento/constants/colors.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/widgets/hovering_utility_widget.dart';
import 'package:evento/widgets/order_details_card.dart';
import 'package:evento/widgets/profiledisplyawidget.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              GetBuilder<EventoController>(
                builder: (controller) => Column(
                  children: [
                    SizedBox(
                      height: 180.h,
                      width: 180.w,
                      child: Stack(
                        children: [
                          CommonProfileDisplayWidget(
                            width: 170.w,
                            height: 170.h,
                            url: controller.orderedUserUrl,
                          ),
                          Positioned(
                              right: 15.w,
                              bottom: 10.h,
                              child: const HoveringUtilityWidget(icon: Icons.chat_bubble_outline,))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    CommonText(
                      text: controller.orderedUserName,
                      size: 25.5.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              OrderDetailsCard(
                title: "Event",
                list: [
                  const CommonText(
                    text: "Eva's Birthday",
                    color: primaryTextColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CommonText(
                    text: "22/01/2022",
                    color: warningColors,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
                isIcon: true,
                icon: Icons.celebration,
                onTap: (context) {
                  debugPrint("Card Pressed");
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              OrderDetailsCard(
                title: "Address",
                list: [
                  const CommonText(
                    text: "Vlafil Road",
                    color: primaryTextColor,
                    size: 13,
                  ),
                  const CommonText(
                    text: "Near Paris Tower",
                    color: primaryTextColor,
                    size: 13,
                  ),
                  const CommonText(
                    text: "Paris - 012353",
                    color: primaryTextColor,
                    size: 13,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
                isIcon: true,
                icon: Icons.location_on_outlined,
                onTap: (context) {
                  debugPrint("Card Pressed");
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              OrderDetailsCard(
                title: "Contact",
                list: [
                  const CommonText(
                    text: "+91 99955687189",
                    color: primaryTextColor,
                    size: 13,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
                isIcon: true,
                icon: Icons.call,
                onTap: (context) async {
                  await EventoController.eventoController
                      .makePhoneCall('tel:9645541338');
                  debugPrint("Card Pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
