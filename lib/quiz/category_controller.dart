import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/base_state.dart';
import 'package:quiz_android/app/entities/failure.dart';
import 'package:quiz_android/quiz/entities/quiz_entities.dart';
import 'package:quiz_android/repositories/app_repository.dart';

final categoriesList = StateProvider<List<QuizCategory>>((ref) {
  return <QuizCategory>[];
});

final catController =
    StateNotifierProvider.autoDispose<CategoryController, BaseState>(
        categoryController);

CategoryController<T> categoryController<T>(Ref ref) {
  return CategoryController<T>(ref.read);
}

class CategoryController<T> extends StateNotifier<BaseState> {
  CategoryController(this._read) : super(const BaseState<void>.initial());

  final Reader _read;

  AppRepository get _repo => _read(appRepository);

  Future getAllCategories() async {
    state = BaseState<void>.loading();
    final response = await _repo.getAllCategories();
    response.fold((categories) {
      _read(categoriesList.notifier).state = categories;
      state = BaseState<List<QuizCategory>>.success(
        data: categories,
      );
    }, (failure) {
      state = BaseState<Failure>.error(failure);
    });
  }
}
