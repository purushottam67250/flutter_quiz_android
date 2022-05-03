import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

final colorizeTextStyle = GoogleFonts.philosopher(
  textStyle: TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.w900,
  ),
);

const writerTextStyle = TextStyle(
  fontSize: 20.0,
);

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'QUIZ',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                    speed: Duration(
                      milliseconds: 500,
                    ),
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  WavyAnimatedText(
                    'Verifying data'.toUpperCase(),
                    textStyle: writerTextStyle,
                    speed: Duration(
                      milliseconds: 60,
                    ),
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
