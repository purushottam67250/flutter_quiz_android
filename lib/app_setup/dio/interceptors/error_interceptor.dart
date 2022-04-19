// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class ErrorInterceptor extends Interceptor {
  ///
  ErrorInterceptor(this._read, this._dio);
  final Reader _read;
  final Dio _dio;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _dio.interceptors.errorLock.lock();
      // _read(appController).unAuthenticated();
      _dio.interceptors.errorLock.clear('Access Token has been expired..');
    }
    super.onError(err, handler);
  }
}
