import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentShortCardWidget extends StatelessWidget {
  final String? url, dayText, title;
  final Color? color;
  final double? containerHeight,
      containerWidth,
      imageHeight,
      imageWidth,
      size,
      contentWidth,
      dayCardHeight,
      tileGape,
      dayCardTextSize;
  final FontWeight? weight;

  const AppointmentShortCardWidget(
      {Key? key,
        this.url,
        this.color,
        this.title,
        this.size,
        this.weight,
        this.containerHeight,
        this.containerWidth,
        this.imageHeight,
        this.imageWidth,
        this.contentWidth,
        this.dayText,
        this.tileGape,
        this.dayCardHeight,
        this.dayCardTextSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    height: containerHeight,
    width: containerWidth,
    decoration: BoxDecoration(
      color: primaryBgColor,
      borderRadius: BorderRadius.circular(11),
    ),
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: dayCardHeight ?? 34.h,
            width: 84.w,
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: dayContainerRadius,
                    bottomRight: dayContainerRadius)),
            child: Center(
                child: CommonText(
                  text: dayText ?? 'Today',
                  color: whiteColor,
                  size: dayCardTextSize ?? 14.5,
                  weight: FontWeight.w400,
                )),
          ),
        ),
        SizedBox(
          height: contentWidth ?? 10.h,
        ),
        Expanded(
          child: ListTile(
            horizontalTitleGap: tileGape ?? 16,
            trailing: SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  url ?? sampleProfileImageUrl,
                  // height: imageHeight,
                  // width: imageWidth,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: Image.asset(
                        "assets/gifs/loadingGiphy.gif",
                        height: imageHeight ?? 40.h,
                        width: imageWidth ?? 40.w,
                      ),
                    );
                  },
                ),
              ),
            ),
            title: CommonText(
              text: title ?? '',
              color: primaryTextColor,
              size: size ?? 14.0,
              weight: weight ?? FontWeight.w500,
            ),
          ),
        )
      ],
    ),
  );
}
