import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsCard extends StatelessWidget {
  final String? title;
  final List<Widget>? list;
  final bool isIcon;
  final double? titleSize;
  final IconData? icon;
  final void Function(BuildContext context)? onTap;

  const OrderDetailsCard(
      {Key? key,
        this.title,
        this.isIcon = false,
        this.titleSize = 18,
        this.icon,
        this.onTap,
        this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 303.w,
      decoration: BoxDecoration(
        color: primaryBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 36.h,
              width: 112.w,
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: orderContainerRadius,
                    bottomRight: orderContainerRadius),
              ),
              child: Center(
                  child: CommonText(
                    text: title,
                    size: titleSize ?? 18,
                    color: whiteColor,
                  )),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: list!.map((e) => e).toList(),
              ),
              isIcon
                  ? GestureDetector(
                onTap: () => onTap!(context),
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  height: 48.h,
                  width: 48.w,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.grey.shade400, width: 0.4),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF58BC8A),
                    size: 27,
                  ),
                ),
              )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
