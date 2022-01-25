import 'package:evento/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoveringUtilityWidget extends StatelessWidget {
  final double? height, width;
  final IconData? icon;
  final Color? borderColor, iconColor, containerColor;
  final double? iconSize;
  final bool isShadow;
  final void Function(BuildContext context)? onPressed;

  const HoveringUtilityWidget(
      {Key? key,
        this.height,
        this.width,
        this.icon,
        this.borderColor,
        this.iconColor,
        this.containerColor,
        this.iconSize,
        this.isShadow = false,
        this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 51.h,
      width: width ?? 51.w,
      decoration: BoxDecoration(
        color: containerColor ?? whiteColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: isShadow ? Colors.grey.shade400 : Colors.transparent,
            offset: const Offset(
              1.2,
              0.0,
            ),
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
        border:
        Border.all(color: borderColor ?? primaryTextColor, width: 0.3.w),
      ),
      child: Center(
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () async => onPressed!(context),
          icon: Icon(
            icon,
            color: iconColor ?? primaryColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
