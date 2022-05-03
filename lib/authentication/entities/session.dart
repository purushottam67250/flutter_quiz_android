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
    required String token,
    required String email,
    required String niceName,
    required String displayName,
    @Default(-1) int userId,
    required String userFirstName,
    required String userLastName,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

extension UserCredentialX on UserCredential {
  Session? fromFirebaseUser() {
    final user = this.user;
    if (user == null) return null;
    return Session(
      token: '${this.credential?.token}',
      email: user.email ?? '',
      niceName: user.displayName ?? '',
      displayName: user.displayName ?? '',
      userFirstName: '',
      userLastName: '',
    );
  }
}
