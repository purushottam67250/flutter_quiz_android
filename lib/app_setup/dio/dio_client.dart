import 'package:dio/dio.dart';
import 'package:quiz_android/app_setup/dio/interceptors/error_interceptor.dart';
import 'package:quiz_android/app_setup/dio/interceptors/response_interceptor.dart';
import 'package:quiz_android/common/constants/app_constants.dart';
import 'package:riverpod/riverpod.dart';

/// Key to access either token is required or not from the header extra map
const String requiredToken = 'tokenRequired';

/// Dio client provider
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  const baseUrl = AppConstants.baseUrl;
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 60000; // 30 sec
  dio.options.receiveTimeout = 60000;
  dio.options.contentType = Headers.jsonContentType;
  dio.interceptors.addAll([
    LogInterceptor(),
    // RequestInterceptor(ref.read, dio),
    ResponseInterceptor(),
    ErrorInterceptor(ref.read, dio),
  ]);
  return dio;
});
