import 'package:evento/constants/colors.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowSimpleDialogue extends StatelessWidget {
  final String? title, mdFileName;

  const ShowSimpleDialogue({Key? key, this.title, this.mdFileName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          CommonText(
            text: title,
            size: 16.3,
            color: primaryTextColor,
          ),
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 150)).then(
                      (value) => rootBundle
                      .loadString('assets/policies/privacy_policy.md')),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return Markdown(
                    data: snapShot.data.toString(),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Close"))
        ],
      ),
    );
  }
}