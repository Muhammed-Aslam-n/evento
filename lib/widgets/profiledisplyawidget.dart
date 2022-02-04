import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonProfileDisplayWidget extends StatelessWidget {
  final String? url;
  final Color? color;
  final double? height, width;

  const CommonProfileDisplayWidget(
      {Key? key, this.url, this.color, this.height = 40, this.width = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Getting URL is $url");
    return Container(
      height: height! + 4,
      width: width! + 4,
      padding: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(color: color ?? secondaryColor, shape: BoxShape.circle,),
      child: url.runtimeType.toString() != '_File'
          ? ClipOval(
              child: Image.network(
              url ?? sampleProfileImageUrl,
              height: height,
              width: width,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: Image.asset(
                    "assets/gifs/loadingGiphy.gif",
                    height: height ?? 40.h,
                    width: width ?? 40.w,
                  ),
                );
              },
            ))
          : const CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/loginImages/noProfileImage.png"),
            ),
    );
  }
}
