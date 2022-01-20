import 'package:evento/screen/screen_main/holder/evento_pageholder.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SubscriptionMethodView extends StatelessWidget {
  const SubscriptionMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          const SizedBox(height: 150,),
          const Center(
             child: Text("Payment Overview Page"),),
          const SizedBox(
            height: 50,
          ),
          commonButton(text: "Pay",onPressed: ()=>Get.to(()=>const EventoHolder()))
        ],
      ),

    );
  }
}
