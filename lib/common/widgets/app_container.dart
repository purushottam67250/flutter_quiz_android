import 'package:flutter/material.dart';

///
class AppContainer extends StatelessWidget {
  ///
  const AppContainer({
    Key? key,
    this.color,
    this.radius,
    this.child,
    this.padding,
    this.margin,
    this.onPressed,
    this.height,
    this.width,
    this.borderRadius,
    this.noShadow = false,
    this.blurRadius = 10,
    this.spreadRadius = 2,
    this.transparentBackground = false,
    this.shadowColor,
  }) : super(key: key);

  ///
  final Color? color;

  ///
  final Widget? child;

  ///
  final double? radius;

  ///
  final EdgeInsetsGeometry? padding;

  ///
  final EdgeInsetsGeometry? margin;

  ///
  final void Function(BuildContext context)? onPressed;

  ///
  final double? height;

  ///
  final double? width;

  ///
  final BorderRadius? borderRadius;

  ///
  final bool noShadow;

  ///
  final double blurRadius;

  ///
  final bool transparentBackground;
  final double spreadRadius;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final brRadius = borderRadius ?? BorderRadius.circular(radius ?? 5);
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: brRadius,
        boxShadow: noShadow
            ? null
            : [
                BoxShadow(
                  color: shadowColor ?? Colors.grey.withOpacity(.2),
                  blurRadius: blurRadius,
                  spreadRadius: spreadRadius,
                )
              ],
      ),
      child: ClipRRect(
        borderRadius: brRadius,
        child: Material(
          type: transparentBackground
              ? MaterialType.transparency
              : MaterialType.canvas,
          color: transparentBackground
              ? Colors.transparent
              : color ?? Colors.white,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: InkWell(
              onTap: onPressed != null
                  ? () {
                      onPressed?.call(context);
                    }
                  : null,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
