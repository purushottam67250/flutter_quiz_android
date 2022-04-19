import 'package:dio/dio.dart';

///
class ResponseInterceptor extends Interceptor {
  ///
  // ResponseInterceptor(this._read);
  // final Reader _read;

  @override
  void onResponse(
      Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
