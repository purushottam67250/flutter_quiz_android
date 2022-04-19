import 'package:flutter/material.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/common/constants/string_constants.dart';
import 'package:quiz_android/common/widgets/app_container.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selected = -1;

  void _onAnswerSelection(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      persistentFooterButtons: [
        ButtonSection(
          isNextEnabled: selected != -1,
        ),
      ],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const TimerWidget(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Mathematics Quiz',
                style: TextStyle(
                  color: Colors.white10,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const QuestionIndexWidget(),
              const SizedBox(
                height: 5,
              ),
              const QuestionCounterWidget(),
              const QuestionWidget(
                question: StringConstants.question,
              ),
              // answers options here
              ...answers
                  .asMap()
                  .entries
                  .map(
                    (e) => AnswerOptionWidget(
                      option: e.value,
                      selected: e.key == selected,
                      onSelection: () {
                        _onAnswerSelection(e.key);
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
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
    required this.isNextEnabled,
  }) : super(key: key);

  final bool isNextEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: TextButton.icon(
              icon: const Icon(
                Icons.power_settings_new_rounded,
                color: Colors.white38,
                size: 25,
              ),
              onPressed: () {
                //
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(15, 250, 250, 250),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
              ),
              label: const Text(
                'Quit Quiz',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: MaterialButton(
                color: const Color(0xff107FEB),
                disabledColor: const Color(0xff107FEB).withOpacity(0.25),
                elevation: 5,
                disabledElevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                textColor: Colors.white70,
                disabledTextColor: Colors.white30,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                onPressed: isNextEnabled
                    ? () {
                        //
                      }
                    : null,
                child: Row(
                  children: [
                    const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.next_plan_outlined,
                      color: isNextEnabled ? Colors.white70 : Colors.white30,
                      size: 25,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Text(
        question,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class AnswerOptionWidget extends StatelessWidget {
  const AnswerOptionWidget({
    Key? key,
    required this.option,
    required this.selected,
    required this.onSelection,
  }) : super(key: key);

  final String option;
  final bool selected;
  final VoidCallback onSelection;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AppContainer(
      onPressed: (_) {
        onSelection();
      },
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: screenSize.width,
      transparentBackground: true,
      blurRadius: 1,
      spreadRadius: 1,
      radius: 25,
      shadowColor: selected ? const Color(0x9A26A08C) : null,
      child: AppContainer(
        color: ColorConstants.backgroundColor,
        margin: const EdgeInsets.all(2),
        noShadow: true,
        radius: 25,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Text(
            option,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionCounterWidget extends StatelessWidget {
  const QuestionCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 20,
      shrinkWrap: true,
      crossAxisSpacing: 4,
      mainAxisSpacing: 2,
      childAspectRatio: 5,
      children: List.generate(
        20,
        (index) => const AppContainer(
          noShadow: true,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

class QuestionIndexWidget extends StatelessWidget {
  const QuestionIndexWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Question ',
        style: TextStyle(
          color: Colors.white54,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: '01',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' / ',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '20',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AppContainer(
      color: Colors.transparent,
      radius: 25,
      width: screenSize.width,
      height: 50,
      blurRadius: 2,
      child: AppContainer(
        margin: const EdgeInsets.all(4),
        color: Colors.purpleAccent.shade700,
        noShadow: true,
        radius: 25,
      ),
    );
  }
}
