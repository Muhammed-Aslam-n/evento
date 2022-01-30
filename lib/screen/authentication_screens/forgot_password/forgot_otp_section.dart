import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/authorization/forgotController.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pin_put/pin_put.dart';

class ForgotPasswordOtpSection extends StatelessWidget {
  ForgotPasswordOtpSection({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = EventoForgotController.eventoFpController;

  @override
  Widget build(BuildContext context) {
    final FocusNode _pinPutFocusNode = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 36.h,
                ),
                Image.asset("assets/images/newImages/otp_background.png"),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: whiteColor, borderRadius: loginBorderRadius),
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          CommonText(
                            text: "Verify Phone number",
                            color: primaryColor,
                            size: 18.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const CommonText(text: "Enter the Otp sent to your number",color: warningColors,size: 11,),
                          SizedBox(
                            height: 45.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w, right: 36.w),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PinPut(
                                    fieldsCount: 6,
                                    eachFieldHeight: 30,
                                    onSubmit: (String verificationCode) {
                                      debugPrint("OTP ENTERED SUCCESSFULLY Forgot IN OTP FIELD");
                                      controller.fpVerifyNumberUsingOTP(verificationCode);
                                    },
                                    focusNode: _pinPutFocusNode,
                                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    selectedFieldDecoration: _pinPutDecoration,
                                    followingFieldDecoration: _pinPutDecoration.copyWith(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: Colors.deepPurpleAccent.withOpacity(.5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: (){
                                        controller.fpResendOTP();
                                      },
                                      child: const Text("Resend OTP\t\t\t",style: TextStyle(fontSize: 12),),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }


}
