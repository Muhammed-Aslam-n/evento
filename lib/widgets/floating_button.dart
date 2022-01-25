import 'package:flutter/material.dart';

class FloatingAButton extends StatelessWidget {
  final void Function(BuildContext context)? onPressed;
  final IconData? icon;
  final double? iconSize, elevation;
  final Color? fabBackground, iconColor;
  final String? toolTip;

  const FloatingAButton(
      {Key? key,
        this.onPressed,
        this.icon,
        this.iconSize,
        this.elevation,
        this.fabBackground,
        this.iconColor,
        this.toolTip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed!(context),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      backgroundColor: fabBackground,
      tooltip: toolTip,
      splashColor: Colors.transparent,
      elevation: elevation ?? 0,
    );
  }
}