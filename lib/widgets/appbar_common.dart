import 'package:evento/constants/colors.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSize {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: AppBar(
              centerTitle: true,
              leading: const Icon(
                Icons.keyboard_arrow_left,
                color: primaryTextColor,
              ),
              backgroundColor: whiteColor,
              title: const CommonText(
                text: "Payment Method",
                color: primaryTextColor,
              ),
            ),
          )),
    );
  }
}