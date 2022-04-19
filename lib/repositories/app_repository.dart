import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/failure.dart';
import 'package:quiz_android/app_setup/dio/dio_client.dart';
import 'package:quiz_android/common/constants/app_constants.dart';
import 'package:quiz_android/quiz/category_controller.dart';

final appRepository = Provider<AppRepository>((ref) => AppRepository(ref.read));

///
class AppRepository {
  ///
  AppRepository(Reader read) : _read = read;

  final Reader _read;

  Dio get _dio => _read(dioProvider);

  Future<Either<List<QuizCategory>, Failure>> getAllCategories(
      {int page = 1}) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>(AppConstants.getCategories);
      final cats = response.data?.keys
          .map(
            (e) => QuizCategory(name: e),
          )
          .toList();
      return Left(cats ?? <QuizCategory>[]);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
