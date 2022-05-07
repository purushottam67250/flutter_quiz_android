import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/base_state.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/quiz/entities/quiz_entities.dart';
import 'package:quiz_android/quiz/quiz_controller.dart';
import 'package:quiz_android/quiz/quiz_view.dart';
import 'package:quiz_android/quiz/quiz_view_loading.dart';
import 'package:quiz_android/quiz/score_view.dart';

final questionProvider =
    StateNotifierProvider.autoDispose<QuizController, BaseState>(
        quizController);

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  void initState() {
    ref
        .read(questionProvider.notifier)
        .getQuizQuestions(category: widget.category);
    super.initState();
  }

  void _replay() {
    ref
        .read(questionProvider.notifier)
        .getQuizQuestions(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColorWhite,
      body: ref.watch<BaseState>(questionProvider).maybeMap(
        success: (state) {
          return QuizPageView(
            questions: state.data! as List<QuizQuestion>,
            replay: _replay,
            category: widget.category,
          );
        },
        loading: (_) {
          return QuizViewLoading(category: widget.category);
        },
        error: (error) {
          return SizedBox(
            child: Center(
              child: Text('error $error'),
            ),
          );
        },
        orElse: () {
          return SizedBox(
            child: Center(
              child: Text('Something unexpected '),
            ),
          );
        },
      ),
    );
  }
}

class QuizPageView extends StatefulWidget {
  QuizPageView({
    Key? key,
    required this.questions,
    required this.replay,
    required this.category,
  }) : super(key: key);

  final List<QuizQuestion> questions;
  final VoidCallback replay;
  final String category;

  @override
  State<QuizPageView> createState() => _QuizPageViewState();
}

class _QuizPageViewState extends State<QuizPageView> {
  late QuizQuestion currentQuestion;
  List<QuizQuestion> questions = [];
  bool allAnswered = false;

  @override
  void initState() {
    super.initState();
    questions = widget.questions.take(2).toList();
    currentQuestion = widget.questions[0];
  }

  void _onAnswerSelection(String answered) {
    setState(() {
      currentQuestion = currentQuestion.copyWith(
        answeredOption: answered,
      );
    });
  }

  void _onNext() {
    setState(() {
      questions = questions.map((e) {
        if (e.id == currentQuestion.id) {
          return currentQuestion;
        } else {
          return e;
        }
      }).toList();
      if (currentQuestion.index < questions.length - 1) {
        currentQuestion = questions[currentQuestion.index + 1];
      } else {
        allAnswered = true;
      }
    });
  }

  void _timeout() {
    setState(() {
      if (currentQuestion.index < questions.length - 1) {
        currentQuestion = questions[currentQuestion.index + 1];
      } else {
        allAnswered = true;
      }
    });
  }

  void _onQuit() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: ValueKey(currentQuestion.id),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          child: child,
          opacity: animation,
        );
      },
      duration: const Duration(milliseconds: 500),
      child: allAnswered
          ? Container(
              key: ValueKey('allAnswered'),
              child: ScoreView(
                questions: questions,
                replay: widget.replay,
                category: widget.category,
              ),
            )
          : Container(
              key: ValueKey(currentQuestion.id),
              child: QuizView(
                questionIndex: currentQuestion.index,
                question: currentQuestion,
                onAnswerSelection: _onAnswerSelection,
                onNext: _onNext,
                onQuit: _onQuit,
                totalQuestions: questions.length,
                timeout: _timeout,
                category: widget.category,
              ),
            ),
    );
  }
}
