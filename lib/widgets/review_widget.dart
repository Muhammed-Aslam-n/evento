import 'package:evento/constants/colors.dart';
import 'package:evento/widgets/profiledisplyawidget.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildReviewWidget extends StatelessWidget {
  final String? userText, contentText, url, rating;

  const BuildReviewWidget(
      {Key? key, this.userText, this.contentText, this.rating, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: primaryBgColor),
      child: Column(
        children: [
          ListTile(
            leading: CommonProfileDisplayWidget(
              url: url,
              height: 65,
              width: 52,
              color: Colors.transparent,
            ),
            title: CommonText(
              text: userText ?? '',
              size: 12,
            ),
            subtitle: CommonText(
              text: rating,
              color: primaryTextColor,
              size: 11,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CommonText(
            text: contentText,
            size: 11,
          )
        ],
      ),
    );
  }
}