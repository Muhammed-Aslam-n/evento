import 'package:evento/constants/constants.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ReviewsProfile extends StatelessWidget {
  const ReviewsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            const BuildReviewWidget(userText: "Maniko Vilnim",rating: "4.3",contentText: dummyText,url: sampleProfileImageUrl2,),
            SizedBox(height: 20.h,),
            const BuildReviewWidget(userText: "Maniko Vilnim",rating: "4.3",contentText: dummyText,url: sampleProfileImageUrl2,),
            SizedBox(height: 20.h,),
            const BuildReviewWidget(userText: "Maniko Vilnim",rating: "4.3",contentText: dummyText,url: sampleProfileImageUrl2,),
            SizedBox(height: 20.h,),const BuildReviewWidget(userText: "Maniko Vilnim",rating: "4.3",contentText: dummyText,url: sampleProfileImageUrl2,),
            SizedBox(height: 20.h,),const BuildReviewWidget(userText: "Maniko Vilnim",rating: "4.3",contentText: dummyText,url: sampleProfileImageUrl2,),
            SizedBox(height: 20.h,),const BuildReviewWidget(userText: "Maniko Vilnim",rating: "4.3",contentText: dummyText,url: sampleProfileImageUrl2,),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }

}
