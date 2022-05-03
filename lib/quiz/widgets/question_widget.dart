import 'package:flutter/material.dart';
import 'package:quiz_android/common/widgets/app_container.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Text(
        question,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class QuestionCounterWidget extends StatelessWidget {
  const QuestionCounterWidget({
    Key? key,
    required this.questionIndex,
  }) : super(key: key);

  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      height: 3,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 2,
          );
        },
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AppContainer(
            width: (screenSize.width - 40 - (19 * 2)) / 20,
            noShadow: true,
            color: index <= questionIndex ? Colors.white : Colors.white30,
          );
        },
      ),
    );
  }
}

class QuestionIndexWidget extends StatelessWidget {
  const QuestionIndexWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Question ',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: '$index',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' / ',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '20',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
