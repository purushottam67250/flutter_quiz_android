import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/failure.dart';
import 'package:quiz_android/app_setup/dio/dio_client.dart';
import 'package:quiz_android/app_setup/objectbox/obdb.dart';

///
final authRepository =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

///
class AuthRepository {
  ///
  AuthRepository(Reader read) : _read = read;

  final Reader _read;

  Dio get _dio => _read(dioProvider);

  // @override
  // Future<Either<AppInfo?, Failure>> appStarted() async {
  //   try {
  //     final box = await _tokenBox;
  //     final appInfo = box.isEmpty ? null : const AppInfo();
  //     return Left(appInfo);
  //   } catch (e) {
  //     return Right(Failure.fromException(e));
  //   }
  // }

  // @override
  // Future<Either<User, Failure>> signin({
  //   required String grantType,
  //   required String userName,
  //   required String password,
  //   String? tenant,
  //   String? defaultWarehouse,
  //   CancelToken? cancelToken,
  // }) async {
  //   try {
  //     final data = {
  //       'grant_type': grantType,
  //       'username': userName,
  //       'password': password,
  //       if (tenant != null) 'tenant': tenant,
  //       if (tenant != null) 'default_warehouse': defaultWarehouse,
  //     };
  //     final response = await _dio.post<Map<String, dynamic>>(
  //       AuthEP.token,
  //       data: data,
  //       options: Options(
  //         contentType: Headers.formUrlEncodedContentType,
  //         extra: <String, bool>{requiredToken: false},
  //       ),
  //       cancelToken: cancelToken,
  //     );
  //     final box = await _tokenBox;
  //     await box.put('token', response.data!);
  //     return const Left(User());
  //   } on DioError catch (e) {
  //     return Right(e.toFailure);
  //   } catch (e) {
  //     return Right(Failure.fromException(e));
  //   }
  // }

  // @override
  // Future<Either<Unit, Failure>> forgotPassword({
  //   required String email,
  //   required String tenant,
  //   CancelToken? cancelToken,
  // }) async {
  //   try {
  //     final resp = await _dio.post<Map<String, dynamic>>(
  //       AuthEP.forgotPassword,
  //       data: {'email': email, 'tenant': tenant},
  //       cancelToken: cancelToken,
  //     );
  //     log('$resp');
  //     return const Left(unit);
  //   } catch (e) {
  //     log('$e');
  //     return Right(Failure.fromException(e));
  //   }
  // }

  // log out
  Future<void> logOut() async {
    _read(obDbProvider).logOut();
    return;
  }

  Future<Either<String, Failure>> getToken() async {
    try {
      final session = _read(obDbProvider).loggedUser();
      if (session == null) {
        return Right(
          Failure(
            'Not authenticated',
            FailureType.authentication,
          ),
        );
      }
      return Left(session.token);
    } catch (e) {
      log('$e');
      return Right(Failure.fromException(e));
    }
  }
}
