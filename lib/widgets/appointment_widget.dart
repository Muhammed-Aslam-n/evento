import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppointmentWidget extends StatelessWidget {
  final String? url, dayText, title, subtitle;
  final Color? color;
  final double? containerHeight,
      containerWidth,
      imageHeight,
      imageWidth,
      size,
      tileGape,
      dayCardTextSize;
  final FontWeight? weight;
  final bool isTrailing;

  const CommonAppointmentWidget(
      {Key? key,
        this.url,
        this.color,
        this.title,
        this.subtitle,
        this.size,
        this.weight,
        this.isTrailing = false,
        this.containerHeight,
        this.containerWidth,
        this.imageHeight,
        this.imageWidth,
        this.dayText,
        this.tileGape,
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
            height: 34.h,
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
        // SizedBox(
        //   height: 10.h,
        // ),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: ListTile(
              horizontalTitleGap: 16,
              leading: SizedBox(
                height: imageHeight,
                width: imageWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    url ?? sampleProfileImageUrl,
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
              subtitle: CommonText(
                text: subtitle ?? '',
                color: primaryTextColor,
                size: size ?? 11.5,
                weight: weight ?? FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
