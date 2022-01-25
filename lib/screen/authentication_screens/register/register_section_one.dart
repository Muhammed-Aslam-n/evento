import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/authentication_screens/register/register_section_two.dart';
import 'package:evento/widgets/datatext_field.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterSectionOne extends StatelessWidget {
  RegisterSectionOne({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBgColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 36.h,
                ),
                Image.asset("assets/images/loginImages/loginBgVendor.png",height: 200.h,),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: whiteColor, borderRadius: loginBorderRadius),
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 28.h,
                          ),
                          CommonText(
                            text: "Sign Up",
                            color: primaryColor,
                            size: 32.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 23.h,
                                  child: CommonText(
                                    text: "First name",
                                    size: 16.sp,
                                    color: primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                DataTextFields(
                                  minLength: 1,
                                  controller: EventoController
                                      .eventoController.firstNameController,
                                  textInputType: TextInputType.name,
                                  hintText: "Your Name",
                                  obscureText: false,
                                  inputFormatter: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-z.A-Z ]'))
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 23.h,
                                  child: CommonText(
                                    text: "Last name",
                                    size: 16.sp,
                                    color: primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                DataTextFields(
                                  minLength: 1,
                                  controller: EventoController
                                      .eventoController.lastNameController,
                                  textInputType: TextInputType.name,
                                  hintText: "Your Name",
                                  obscureText: false,
                                  inputFormatter: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-z.A-Z ]'))
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 23.h,
                                  child: CommonText(
                                    text: "Username",
                                    size: 16.sp,
                                    color: primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                DataTextFields(
                                  minLength: 3,
                                  controller: EventoController
                                      .eventoController.userNameController,
                                  textInputType: TextInputType.name,
                                  hintText: "Login username",
                                  obscureText: false,
                                  inputFormatter: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-z.A-Z ]'))
                                  ],
                                ),
                                SizedBox(
                                  height: 45.h,
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Center(
                                      child: Container(
                                        height: 64.h,
                                        width: 64.h,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: secondaryColor),
                                        child: IconButton(
                                          onPressed: () {
                                            validateForm(context);
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_right,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                ),
                              ],
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
  validateForm(context){
    if(_formKey.currentState!.validate()){
      Get.to(() => RegisterSectionTwo());
      FocusScope.of(context).unfocus();
      EventoController.eventoController.firstNameController.clear();
      EventoController.eventoController.lastNameController.clear();
      EventoController.eventoController.userNameController.clear();
    }
  }
}
