import 'dart:math' as qmath;

import 'package:flutter/material.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/common/widgets/app_container.dart';
import 'package:quiz_android/quiz/widgets/answer_option_widget.dart';
import 'package:quiz_android/quiz/widgets/button_section.dart';
import 'package:quiz_android/quiz/widgets/question_widget.dart';

class QuizViewLoading extends StatefulWidget {
  QuizViewLoading({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  State<QuizViewLoading> createState() => _QuizViewLoadingState();
}

class _QuizViewLoadingState extends State<QuizViewLoading>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                height: screenSize.height * 0.38,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorConstants.primaryBlue,
                      ColorConstants.primaryBlue,
                      ColorConstants.primaryBlue50,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${widget.category} Quiz',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              QuestionIndexWidget(
                                index: 1,
                              ),
                            ],
                          ),
                          TimerWidget(),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      QuestionCounterWidget(
                        questionIndex: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: (screenSize.height * 0.20) / 8,
                left: 20,
                right: 20,
                child: AppContainer(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                  blurRadius: 5,
                  spreadRadius: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          25,
                        ),
                      ),
                    ),
                    constraints: BoxConstraints(
                      minHeight: screenSize.height * 0.20,
                    ),
                    child: QuestionWidget(
                      question: '',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // answers options here
                  ...[1, 2, 3, 4]
                      .map(
                        (e) => AnswerOptionWidget(
                          option: '',
                          selected: false,
                          onSelection: () {
                            //
                          },
                        ),
                      )
                      .toList(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ButtonSection(
              isNextEnabled: false,
              isLast: false,
              onNext: () {
                //
              },
              onQuit: () {
                //
              },
            ),
          ],
        ),
      ],
    );
  }
}

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.transparent,
      child: AppContainer(
        color: Colors.transparent,
        radius: 40,
        width: 80,
        height: 80,
        blurRadius: 2,
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: 1,
                child: Icon(
                  Icons.timer,
                  color: ColorConstants.pink,
                  size: 55,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizTimerPainter extends CustomPainter {
  QuizTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    paint.color = color;
    double progress = (1 - animation.value) * 2 * qmath.pi;
    canvas.drawArc(Offset.zero & size, qmath.pi * 1.5, -progress, false, paint);
    // canvas.drawLine(Offset(10, 10), Offset(20, 20), paint);
  }

  @override
  bool shouldRepaint(QuizTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
