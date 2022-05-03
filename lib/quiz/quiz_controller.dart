import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/base_state.dart';
import 'package:quiz_android/app/entities/failure.dart';
import 'package:quiz_android/quiz/entities/quiz_entities.dart';
import 'package:quiz_android/repositories/app_repository.dart';

final questionsList = StateProvider<List<QuizQuestion>>((ref) {
  return <QuizQuestion>[];
});

QuizController<T> quizController<T>(Ref ref) {
  return QuizController<T>(ref.read);
}

class QuizController<T> extends StateNotifier<BaseState> {
  QuizController(this._read) : super(const BaseState<void>.initial());

  final Reader _read;

  AppRepository get _repo => _read(appRepository);

  Future getQuizQuestions() async {
    state = BaseState<void>.loading();
    final response = await _repo.getQuizQuestions();
    response.fold((data) {
      _read(questionsList.notifier).state = data;
      state = BaseState<List<QuizQuestion>>.success(
        data: data.map((e) {
          return e.copyWith(
            incorrectAnswers: [...e.incorrectAnswers, e.correctAnswer]
              ..shuffle(),
          );
        }).toList(),
      );
    }, (failure) {
      state = BaseState<Failure>.error(failure);
    });
  }
}
