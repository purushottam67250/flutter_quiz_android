import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/app.dart';
import 'package:quiz_android/common/constants/color_constants.dart';

String getGreeting() {
  final time = DateTime.now().hour;
  var message = '';
  if (time < 12) {
    message = 'Morning';
  } else if (time >= 12 && time <= 16) {
    message = 'Afternoon';
  } else if (time > 16 && time < 20) {
    message = 'Evening';
  } else {
    message = 'Night';
  }
  return message;
}

final Shader linearGradient = LinearGradient(
  colors: <Color>[
    ColorConstants.purple,
    ColorConstants.pink,
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 10.0, 80.0));

void handleNavigation(WidgetRef ref, String homeRoute) {
  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
    final currentState = ref.read(navigatorKey).currentState;
    if (currentState != null) {
      currentState.pushNamedAndRemoveUntil(homeRoute, (route) => false);
    }
  });
}
