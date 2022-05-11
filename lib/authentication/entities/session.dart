import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  @Entity(realClass: Session)
  factory Session({
    @Id(assignable: true) int? id,
    String? token,
    required String email,
     String? niceName,
    required String displayName,
    @Default('') String userId,
     String? userFirstName,
     String? userLastName,
    @Default('') String image,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  factory Session.defaultSession() => Session(
        token: '',
        email: '',
        niceName: '',
        displayName: '',
        userFirstName: '',
        userLastName: '',
      );
}

extension UserCredentialX on UserCredential {
  Session? fromFirebaseUser() {
    final user = this.user;
    if (user == null) return null;
    return Session(
      // token: '${this.credential?.token}',
      token: '',
      email: user.email ?? '',
      niceName: user.displayName ?? '',
      displayName: user.displayName ?? '',
      userFirstName: '',
      userLastName: '',
      userId: user.uid,
    );
  }
}
