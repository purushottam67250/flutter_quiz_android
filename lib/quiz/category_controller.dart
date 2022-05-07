import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/base_state.dart';
import 'package:quiz_android/app/entities/failure.dart';
import 'package:quiz_android/app_setup/firebase/firebase_service.dart';
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
  FirebaseService get _firebaseRepo => _read(firebaseService);

  Future<void> getAllCategories() async {
    state = BaseState<void>.loading();
    final response = await _firebaseRepo.fetchCategories();
    return response.fold((l) {
      state = BaseState<List<QuizCategoryFirebase>>.success(data: l);
    }, (r) {
      state = BaseState<Failure>.error(r);
    });
  }
}
