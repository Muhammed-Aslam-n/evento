import 'package:flutter/material.dart';

class LoginOrSigningPlatform extends StatelessWidget {
  final double? height,width;
  final void Function()? onTap;
  const LoginOrSigningPlatform({Key? key, this.height, this.width, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height??60,
        width: width??60,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/images/loginImages/googleIcon.png")
          )
        ),
      ),
    );
  }
}
