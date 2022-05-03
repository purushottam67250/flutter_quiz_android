import 'package:flutter/material.dart';

class GradientScore extends StatelessWidget {
  const GradientScore({
    Key? key,
    required this.radius,
    this.child,
  }) : super(key: key);

  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        (radius / 2),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.white60,
              Colors.white24.withOpacity(0.10),
            ],
            focalRadius: 1,
            radius: 1,
          ),
        ),
        child: SizedBox(
          height: radius,
          width: radius,
          child: child,
        ),
      ),
    );
  }
}