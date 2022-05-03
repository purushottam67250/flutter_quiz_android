import 'dart:math' as qmath;

import 'package:flutter/material.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/common/widgets/app_container.dart';
import 'package:quiz_android/quiz/entities/quiz_entities.dart';
import 'package:quiz_android/quiz/widgets/answer_option_widget.dart';
import 'package:quiz_android/quiz/widgets/button_section.dart';
import 'package:quiz_android/quiz/widgets/question_widget.dart';

class QuizView extends StatefulWidget {
  QuizView({
    Key? key,
    required this.onAnswerSelection,
    required this.question,
    required this.questionIndex,
    required this.onNext,
    required this.onQuit,
    required this.totalQuestions,
    required this.timeout,
  }) : super(key: key);

  final Function(String) onAnswerSelection;
  final QuizQuestion question;
  final int questionIndex;
  final Function() onNext;
  final Function() onQuit;
  final int totalQuestions;
  final VoidCallback timeout;

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );
    controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.dismissed) {
          widget.timeout();
        }
      },
    );
    control();
  }

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void control() {
    if (controller.isAnimating)
      controller.stop();
    else {
      controller.reverse(
          from: controller.value == 0.0 ? 1.0 : controller.value);
    }
  }

  void _onNext() {
    controller.dispose();
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.purple,
            ColorConstants.pink,
            ColorConstants.pink,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Mathematics Quiz',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        QuestionIndexWidget(index: widget.questionIndex + 1),
                      ],
                    ),
                    TimerWidget(
                      controller: controller,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                QuestionCounterWidget(
                  questionIndex: widget.questionIndex,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 236, 230, 230),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20,
                  ),
                  topRight: Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionWidget(
                    question: widget.question.question,
                  ),
                  // answers options here
                  ...widget.question.incorrectAnswers
                      .map(
                        (e) => AnswerOptionWidget(
                          option: e,
                          selected: e == widget.question.answeredOption,
                          onSelection: () {
                            widget.onAnswerSelection(e);
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
          ),
          ButtonSection(
            isNextEnabled: widget.question.answeredOption.isNotEmpty,
            isLast: widget.question.index == widget.totalQuestions - 1,
            onNext: _onNext,
            onQuit: widget.onQuit,
          ),
        ],
      ),
    );
  }
}

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;
  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

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
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: QuizTimerPainter(
                      animation: controller,
                      backgroundColor: Colors.white30,
                      color: ColorConstants.purple,
                    ),
                  );
                },
              ),
            ),
            Positioned.fill(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final opacity =
                      (controller.lastElapsedDuration?.inSeconds ?? 0).isOdd
                          ? 1
                          : 0;
                  return AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: opacity.toDouble(),
                    child: Icon(
                      Icons.timer,
                      color: ColorConstants.purple,
                      size: 55,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: FractionalOffset.center,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Text(
                    timerString,
                    style: TextStyle(
                      fontSize: 25,
                      color: ColorConstants.backgroundColorWhite,
                      fontWeight: FontWeight.w900,
                    ),
                  );
                },
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
