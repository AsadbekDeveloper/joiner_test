// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:test_questionaire/shared/constants.dart/sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    this.borderRadius,
    required this.child,
    this.color,
    this.elevation,
    this.padding,
    this.width,
    this.height,
  }) : super(key: key);
  final Function()? onPressed;
  final BorderRadius? borderRadius;
  final Widget child;
  final Color? color;
  final double? elevation;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(26),
          ),
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: mainHorPadding,
                vertical: height == null ? mainVerPadding : 0,
              ),
        ),
        child: child,
      ),
    );
  }
}
