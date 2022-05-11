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

  // log out
  Future<void> logOut() async {
    _read(obDbProvider).logOut();
    return;
  }

  // Future<Either<String, Failure>> getToken() async {
  //   try {
  //     final session = _read(obDbProvider).loggedUser();
  //     if (session == null) {
  //       return Right(
  //         Failure(
  //           'Not authenticated',
  //           FailureType.authentication,
  //         ),
  //       );
  //     }
  //     return Left(session.token);
  //   } catch (e) {
  //     log('$e');
  //     return Right(Failure.fromException(e));
  //   }
  // }
}
