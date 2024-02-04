import 'package:flutter/material.dart';

class RoundedInkwell extends StatelessWidget {
  const RoundedInkwell({
    Key? key,
    this.onTap,
    this.borderRadius,
    required this.child,
    this.color,
    this.elevation,
    this.padding,
  }) : super(key: key);
  final Function? onTap;
  final BorderRadius? borderRadius;
  final Widget child;
  final Color? color;
  final double? elevation;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Ink(
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
