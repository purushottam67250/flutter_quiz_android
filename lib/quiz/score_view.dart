import 'package:flutter/material.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/quiz/entities/quiz_entities.dart';
import 'package:quiz_android/quiz/widgets/gradient_score.dart';
import 'package:quiz_android/quiz/widgets/hero_button_widget.dart';
import 'package:quiz_android/util.dart';

class ScoreView extends StatelessWidget {
  ScoreView({
    Key? key,
    required this.questions,
    required this.replay,
  }) : super(key: key);

  final List<QuizQuestion> questions;
  final VoidCallback replay;
  int score = 0;
  int correct = 0;
  int incorrect = 0;
  int totalQuestionCount = 0;

  void _calculateScore() {
    totalQuestionCount = questions.length;
    final pointPerCorrectQuestion = ((1 / totalQuestionCount) * 100).toInt();
    correct = questions
        .where((element) => element.answeredOption == element.correctAnswer)
        .length;
    incorrect = questions.length - correct;
    score = correct * pointPerCorrectQuestion;
  }

  @override
  Widget build(BuildContext context) {
    _calculateScore();
    final screenSize = MediaQuery.of(context).size;
    final outerRing = screenSize.width / 1.5;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.primaryBlue,
            ColorConstants.primaryBlue,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Mathematics Quiz',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GradientScore(radius: outerRing),
                    GradientScore(radius: outerRing - 50),
                    GradientScore(
                      radius: outerRing - 100,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Your Score',
                              style: TextStyle(
                                // color: ColorConstants.backgroundColor,
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '$score',
                              style: TextStyle(
                                // color: ColorConstants.backgroundColor,
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 80,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(
                20,
              ),
              padding: const EdgeInsets.all(
                20,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 236, 230, 230),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.blue[800],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '100%',
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Completion',
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.blue[800],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${questions.length}',
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Total Questions',
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.green[500],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$correct',
                                  style: TextStyle(
                                    color: Colors.green[500],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Correct',
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.red[500],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$incorrect',
                                  style: TextStyle(
                                    color: Colors.red[500],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Wrong',
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                label: 'Replay',
                color: Colors.green,
                onPressed: replay,
                iconData: Icons.replay,
              ),
              // HeroButtonWidget(
              //   label: 'Review Answers',
              //   color: Colors.blue,
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute<void>(
              //         builder: (BuildContext context) {
              //           return ReviewQuestionsScreen();
              //         },
              //       ),
              //     );
              //   },
              //   iconData: Icons.remove_red_eye,
              // ),
              ButtonWidget(
                label: 'Home',
                color: ColorConstants.purple,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                iconData: Icons.home,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
