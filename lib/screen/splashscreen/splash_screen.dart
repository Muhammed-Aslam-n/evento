import 'package:evento/constants/constants.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 119.h,
            ),
            ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/loginImages/EventoCelebrationIcon.png",
                    height: 44.h,
                    width: 49.w,
                  ),
                ],
              ),
              subtitle: CommonText(
                text: "we build smiles",
                color: paymentHeadTextColor,
                size: 20.sp,
              ),
              title: SizedBox(
                  height: 70,
                  child: CommonText(
                      text: "evento",
                      color: paymentHeadTextColor,
                      size: 50.sp)),
            ),
            //
            // Padding(
            //   padding: EdgeInsets.only(left: 45.w),
            //   child: Row(
            //     children: [
            //       Image.asset("assets/images/loginImages/EventoCelebrationIcon.png",height: 44.h,width: 49.w,),
            //       SizedBox(height: 70,child: CommonText(text: "evento",color: paymentHeadTextColor,size: 50.sp)),
            //     ],
            //   ),
            // ),
            // CommonText(text: "we build smiles",color: paymentHeadTextColor,size: 20.sp,),
            SizedBox(
              height: 101.h,
            ),
            Image.asset("assets/images/loginImages/splashScreenImage.png"),
            SizedBox(
              height: 82.h,
            ),
            Container(
              height: 64.h,
              width: 64.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: secondaryColor),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
