import 'package:evento/constants/colors.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditShowCaseDescription extends StatelessWidget {
  const EditShowCaseDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventoController.eventoController.clearDescriptionController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                const CommonText(
                  text: "Edit Description",
                  size: 18,
                  color: primaryTextColor,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: primaryBgColor,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: EventoController.eventoController.descriptionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20,top: 30,right: 20,bottom: 60),
                      hintText: "your description...",
                      hintStyle: TextStyle(color: Colors.redAccent.shade700,fontSize: 11)
                    ),
                    minLines: 1,
                    maxLines: 10,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Save",
                      style: TextStyle(color: primaryTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
