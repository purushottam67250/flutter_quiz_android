import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/app_controller.dart';
import 'package:quiz_android/app/entities/base_state.dart';
import 'package:quiz_android/app/entities/failure.dart';
import 'package:quiz_android/app_setup/firebase/firebase_service.dart';
import 'package:quiz_android/authentication/entities/session.dart';

AuthController<T> authController<T>(Ref ref) {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  return AuthController<T>(ref.read, cancelToken: cancelToken);
}

class AuthController<T> extends StateNotifier<BaseState> {
  AuthController(this._read, {this.cancelToken})
      : super(
          const BaseState<void>.initial(),
        );
  final Reader _read;

  final CancelToken? cancelToken;

  FirebaseService get _repo => _read(firebaseService);

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const BaseState<bool>.loading();

    final response = await _repo.signIn(email: email, password: password);
    response.fold((l) {
      _read(appController('session')).authenticated(l);
      state = BaseState<Session>.success(data: l);
    }, (r) {
      state = BaseState<Failure>.error(r);
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = const BaseState<bool>.loading();

    final response = await _repo.signUp(email: email, password: password);
    response.fold((l) {
      _read(appController('session')).authenticated(l);
      state = BaseState<Session>.success(data: l);
    }, (r) {
      state = BaseState<Failure>.error(r);
    });
  }

  void logOut() {
    _repo.logOut();
    _read(appController('session')).unAuthenticated();
  }
}
