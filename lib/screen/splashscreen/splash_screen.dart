import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:evento/api_helper/api_constants/api_constants.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/authentication_screens/login/login_home.dart';
import 'package:evento/screen/onBoarding/onboarding.dart';
import 'package:evento/screen/screen_main/holder/evento_pageholder.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = EventoController.eventoController;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              "assets/images/loginImages/EventoCelebrationIcon.png",
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: CommonText(
                text: "evento", color: paymentHeadTextColor, size: 20.sp),
          )
        ],
      ),
      nextScreen: controller.isAppLaunched??false ? controller.redirectingPage as Widget:const OnBoarding(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
