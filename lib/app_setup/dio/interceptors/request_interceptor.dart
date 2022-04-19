// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/repositories/auth_repository.dart';

///
class RequestInterceptor extends Interceptor {
  ///
  RequestInterceptor(this._read, this._dio);

  final Reader _read;
  final Dio _dio;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    _dio.interceptors.requestLock.lock();
    final tokenResp = await _read(authRepository).getToken();
    tokenResp.fold(
      (token) {
        options.headers['Authorization'] = 'Bearer $token';
        _dio.interceptors.requestLock.unlock();
      },
      (failure) {
        // _read(appController).unAuthenticated();
        _dio.interceptors.requestLock.clear('Unable to get Access Token..');
      },
    );
    super.onRequest(options, handler);
  }
}
