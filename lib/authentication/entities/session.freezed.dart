// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
class _$SessionTearOff {
  const _$SessionTearOff();

  _Session call(
      {@Id(assignable: true) int? id,
      String? token,
      required String email,
      String? niceName,
      required String displayName,
      String userId = '',
      String? userFirstName,
      String? userLastName,
      String image = ''}) {
    return _Session(
      id: id,
      token: token,
      email: email,
      niceName: niceName,
      displayName: displayName,
      userId: userId,
      userFirstName: userFirstName,
      userLastName: userLastName,
      image: image,
    );
  }

  Session fromJson(Map<String, Object?> json) {
    return Session.fromJson(json);
  }
}

/// @nodoc
const $Session = _$SessionTearOff();

/// @nodoc
mixin _$Session {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get niceName => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get userFirstName => throw _privateConstructorUsedError;
  String? get userLastName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res>;
  $Res call(
      {@Id(assignable: true) int? id,
      String? token,
      String email,
      String? niceName,
      String displayName,
      String userId,
      String? userFirstName,
      String? userLastName,
      String image});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  final Session _value;
  // ignore: unused_field
  final $Res Function(Session) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? token = freezed,
    Object? email = freezed,
    Object? niceName = freezed,
    Object? displayName = freezed,
    Object? userId = freezed,
    Object? userFirstName = freezed,
    Object? userLastName = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      niceName: niceName == freezed
          ? _value.niceName
          : niceName // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userFirstName: userFirstName == freezed
          ? _value.userFirstName
          : userFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      userLastName: userLastName == freezed
          ? _value.userLastName
          : userLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) then) =
      __$SessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Id(assignable: true) int? id,
      String? token,
      String email,
      String? niceName,
      String displayName,
      String userId,
      String? userFirstName,
      String? userLastName,
      String image});
}

/// @nodoc
class __$SessionCopyWithImpl<$Res> extends _$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(_Session _value, $Res Function(_Session) _then)
      : super(_value, (v) => _then(v as _Session));

  @override
  _Session get _value => super._value as _Session;

  @override
  $Res call({
    Object? id = freezed,
    Object? token = freezed,
    Object? email = freezed,
    Object? niceName = freezed,
    Object? displayName = freezed,
    Object? userId = freezed,
    Object? userFirstName = freezed,
    Object? userLastName = freezed,
    Object? image = freezed,
  }) {
    return _then(_Session(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      niceName: niceName == freezed
          ? _value.niceName
          : niceName // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userFirstName: userFirstName == freezed
          ? _value.userFirstName
          : userFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      userLastName: userLastName == freezed
          ? _value.userLastName
          : userLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Entity(realClass: Session)
class _$_Session implements _Session {
  _$_Session(
      {@Id(assignable: true) this.id,
      this.token,
      required this.email,
      this.niceName,
      required this.displayName,
      this.userId = '',
      this.userFirstName,
      this.userLastName,
      this.image = ''});

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$$_SessionFromJson(json);

  @override
  @Id(assignable: true)
  final int? id;
  @override
  final String? token;
  @override
  final String email;
  @override
  final String? niceName;
  @override
  final String displayName;
  @JsonKey()
  @override
  final String userId;
  @override
  final String? userFirstName;
  @override
  final String? userLastName;
  @JsonKey()
  @override
  final String image;

  @override
  String toString() {
    return 'Session(id: $id, token: $token, email: $email, niceName: $niceName, displayName: $displayName, userId: $userId, userFirstName: $userFirstName, userLastName: $userLastName, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Session &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.niceName, niceName) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.userFirstName, userFirstName) &&
            const DeepCollectionEquality()
                .equals(other.userLastName, userLastName) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(niceName),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(userFirstName),
      const DeepCollectionEquality().hash(userLastName),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$SessionCopyWith<_Session> get copyWith =>
      __$SessionCopyWithImpl<_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionToJson(this);
  }
}

abstract class _Session implements Session {
  factory _Session(
      {@Id(assignable: true) int? id,
      String? token,
      required String email,
      String? niceName,
      required String displayName,
      String userId,
      String? userFirstName,
      String? userLastName,
      String image}) = _$_Session;

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  @Id(assignable: true)
  int? get id;
  @override
  String? get token;
  @override
  String get email;
  @override
  String? get niceName;
  @override
  String get displayName;
  @override
  String get userId;
  @override
  String? get userFirstName;
  @override
  String? get userLastName;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$SessionCopyWith<_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
