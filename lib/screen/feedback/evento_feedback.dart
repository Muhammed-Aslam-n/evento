import 'package:evento/constants/colors.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EventoFeedback extends StatelessWidget {
  const EventoFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventoController.eventoController.clearFeedbackController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                const CommonText(text: "Feedback",size: 18,weight: FontWeight.w500,color: primaryTextColor,),
                SizedBox(
                  height: 8.0.h,
                ),
                const CommonText(text: "Let us know your thoughts...",color: Colors.redAccent,weight: FontWeight.w400,size: 12,),
                SizedBox(
                  height: 40.0.h,
                ),
                Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: primaryBgColor,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: EventoController.eventoController.feedbackController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20,top: 30,right: 20,bottom: 60),
                        hintText: "Your feedback...",
                        hintStyle: TextStyle(color: Colors.black45,fontSize: 11)
                    ),
                    minLines: 1,
                    maxLines: 10,
                  ),
                ),
                SizedBox(height: 30.h,),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      debugPrint("Send Feedback Clicked");
                    },
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryTextColor
                      ),
                      child: const Icon(Icons.keyboard_arrow_right,color: whiteColor,size: 26,),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
