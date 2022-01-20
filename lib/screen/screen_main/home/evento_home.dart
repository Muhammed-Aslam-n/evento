import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventoHome extends StatelessWidget {
  const EventoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 51.h,
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
                child: const ListTile(
                    title: CommonText(
                      text: "Hello",
                      color: Color(0xFFC1C1B7),
                      weight: FontWeight.w400,
                    ),
                    subtitle: CommonText(
                      text: "Emiliana Dizuza",
                      weight: FontWeight.w400,
                    ),
                    trailing: CommonProfileDisplayWidget()),
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
            CommonAppointmentWidget(
              containerHeight: 138.h,
              containerWidth: 326.w,
              imageWidth: 55.w,
              imageHeight: 56.h,
              title: "Galileo Galilei",
              subtitle: "Vlafil Jn.",
              isTrailing: true,
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
                title: sampleName[index+1],
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
    ));
  }
}
