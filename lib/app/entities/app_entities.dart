import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_android/app/entities/failure.dart';
// import 'package:meromomma/core/entities/auth/session.dart';

part 'app_entities.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> {
  const factory AppState.started() = AppStarted<T>;
  const factory AppState.authenticated(T data, {@Default(false) bool isNavigate}) = Authenticated<T>;
  const factory AppState.unAuthenticated({
    Failure? failure,
    @Default(false) bool isNavigate,
  }) = UnAuthenticated<T>;
  // const factory AppState.registration(T data) = Registration<T>;
}

// @freezed
// class SeSo with _$SeSo {
//   const factory SeSo.sessionUser(Session session) = SeSoSessionUser;
//   const factory SeSo.socialUser(SocialUser socialUser) = SeSoSocialUser;
// }
