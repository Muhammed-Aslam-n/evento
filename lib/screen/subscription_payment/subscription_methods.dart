import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/subscription_payment/subscription_method_view.dart';
import 'package:evento/widgets/appbar_common.dart';
import 'package:evento/widgets/button_widget.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscriptionMethods extends StatelessWidget {
  const SubscriptionMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 232.h,
              width: 321.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: paymentCardColor
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  paymentListTile(iconImage: "assets/images/paymentIcons/CreditCardIcon.png",title: "Credit Card",radioValue: 1,),
                  divider,
                  paymentListTile(iconImage: "assets/images/paymentIcons/PayPalImage.png",title: "Paypal",radioValue: 2,),
                  divider,
                  paymentListTile(iconImage: "assets/images/paymentIcons/razorPayImage.png",title: "Razor Pay",radioValue: 3,),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          commonButton(text: "Continue",onPressed: ()=>Get.to(()=>const SubscriptionMethodView())),
        ],
      ),
    );
  }

  paymentListTile({iconImage, title, trailing,int radioValue = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          leading: Image.asset(iconImage,width: 38.w,height: 38.h,),
          title: CommonText(text: title,),
          trailing: GetBuilder<EventoController>(
            id: 'subscriptionMethod',
            builder: (controller) {
              return Radio(
                value: radioValue,
                groupValue: controller.subscriptionMethodValue,
                onChanged: (value) {
                  controller.changeSubscriptionMethod(value ?? 1);
                  debugPrint(value.toString());
                },
                activeColor: Colors.green,
              );
            },
          ),

        ),
      );
}
