import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventoChat extends StatelessWidget {
  const EventoChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text("Chat",style: TextStyle(fontSize: 13.sp),),),
    );
  }
}
