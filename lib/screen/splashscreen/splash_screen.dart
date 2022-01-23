import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/onBoarding/onboarding.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screen_main/holder/evento_pageholder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
      nextScreen: EventoController.eventoController.isAppLaunched??false ? const EventoHolder() : const OnBoarding(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
