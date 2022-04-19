// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  AppStarted<T> started<T>() {
    return AppStarted<T>();
  }

  Authenticated<T> authenticated<T>(T data, {bool isNavigate = false}) {
    return Authenticated<T>(
      data,
      isNavigate: isNavigate,
    );
  }

  UnAuthenticated<T> unAuthenticated<T>(
      {Failure? failure, bool isNavigate = false}) {
    return UnAuthenticated<T>(
      failure: failure,
      isNavigate: isNavigate,
    );
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T data, bool isNavigate) authenticated,
    required TResult Function(Failure? failure, bool isNavigate)
        unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T data, bool isNavigate)? authenticated,
    TResult Function(Failure? failure, bool isNavigate)? unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T data, bool isNavigate)? authenticated,
    TResult Function(Failure? failure, bool isNavigate)? unAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(Authenticated<T> value) authenticated,
    required TResult Function(UnAuthenticated<T> value) unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<T, $Res> {
  factory $AppStateCopyWith(
          AppState<T> value, $Res Function(AppState<T>) then) =
      _$AppStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<T, $Res> implements $AppStateCopyWith<T, $Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState<T> _value;
  // ignore: unused_field
  final $Res Function(AppState<T>) _then;
}

/// @nodoc
abstract class $AppStartedCopyWith<T, $Res> {
  factory $AppStartedCopyWith(
          AppStarted<T> value, $Res Function(AppStarted<T>) then) =
      _$AppStartedCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$AppStartedCopyWithImpl<T, $Res> extends _$AppStateCopyWithImpl<T, $Res>
    implements $AppStartedCopyWith<T, $Res> {
  _$AppStartedCopyWithImpl(
      AppStarted<T> _value, $Res Function(AppStarted<T>) _then)
      : super(_value, (v) => _then(v as AppStarted<T>));

  @override
  AppStarted<T> get _value => super._value as AppStarted<T>;
}

/// @nodoc

class _$AppStarted<T> implements AppStarted<T> {
  const _$AppStarted();

  @override
  String toString() {
    return 'AppState<$T>.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppStarted<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T data, bool isNavigate) authenticated,
    required TResult Function(Failure? failure, bool isNavigate)
        unAuthenticated,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T data, bool isNavigate)? authenticated,
    TResult Function(Failure? failure, bool isNavigate)? unAuthenticated,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T data, bool isNavigate)? authenticated,
    TResult Function(Failure? failure, bool isNavigate)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(Authenticated<T> value) authenticated,
    required TResult Function(UnAuthenticated<T> value) unAuthenticated,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class AppStarted<T> implements AppState<T> {
  const factory AppStarted() = _$AppStarted<T>;
}

/// @nodoc
abstract class $AuthenticatedCopyWith<T, $Res> {
  factory $AuthenticatedCopyWith(
          Authenticated<T> value, $Res Function(Authenticated<T>) then) =
      _$AuthenticatedCopyWithImpl<T, $Res>;
  $Res call({T data, bool isNavigate});
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res>
    implements $AuthenticatedCopyWith<T, $Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated<T> _value, $Res Function(Authenticated<T>) _then)
      : super(_value, (v) => _then(v as Authenticated<T>));

  @override
  Authenticated<T> get _value => super._value as Authenticated<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? isNavigate = freezed,
  }) {
    return _then(Authenticated<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      isNavigate: isNavigate == freezed
          ? _value.isNavigate
          : isNavigate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Authenticated<T> implements Authenticated<T> {
  const _$Authenticated(this.data, {this.isNavigate = false});

  @override
  final T data;
  @JsonKey()
  @override
  final bool isNavigate;

  @override
  String toString() {
    return 'AppState<$T>.authenticated(data: $data, isNavigate: $isNavigate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Authenticated<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other.isNavigate, isNavigate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(isNavigate));

  @JsonKey(ignore: true)
  @override
  $AuthenticatedCopyWith<T, Authenticated<T>> get copyWith =>
      _$AuthenticatedCopyWithImpl<T, Authenticated<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T data, bool isNavigate) authenticated,
    required TResult Function(Failure? failure, bool isNavigate)
        unAuthenticated,
  }) {
    return authenticated(data, isNavigate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T data, bool isNavigate)? authenticated,
    TResult Function(Failure? failure, bool isNavigate)? unAuthenticated,
  }) {
    return authenticated?.call(data, isNavigate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T data, bool isNavigate)? authenticated,
    TResult Function(Failure? failure, bool isNavigate)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(data, isNavigate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(Authenticated<T> value) authenticated,
    required TResult Function(UnAuthenticated<T> value) unAuthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated<T> implements AppState<T> {
  const factory Authenticated(T data, {bool isNavigate}) = _$Authenticated<T>;

  T get data;
  bool get isNavigate;
  @JsonKey(ignore: true)
  $AuthenticatedCopyWith<T, Authenticated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnAuthenticatedCopyWith<T, $Res> {
  factory $UnAuthenticatedCopyWith(
          UnAuthenticated<T> value, $Res Function(UnAuthenticated<T>) then) =
      _$UnAuthenticatedCopyWithImpl<T, $Res>;
  $Res call({Failure? failure, bool isNavigate});
}

/// @nodoc
class _$UnAuthenticatedCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res>
    implements $UnAuthenticatedCopyWith<T, $Res> {
  _$UnAuthenticatedCopyWithImpl(
      UnAuthenticated<T> _value, $Res Function(UnAuthenticated<T>) _then)
      : super(_value, (v) => _then(v as UnAuthenticated<T>));

  @override
  UnAuthenticated<T> get _value => super._value as UnAuthenticated<T>;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isNavigate = freezed,
  }) {
    return _then(UnAuthenticated<T>(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isNavigate: isNavigate == freezed
          ? _value.isNavigate
          : isNavigate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UnAuthenticated<T> implements UnAuthenticated<T> {
  const _$UnAuthenticated({this.failure, this.isNavigate = false});

  @override
  final Failure? failure;
  @JsonKey()
  @override
  final bool isNavigate;

  @override
  String toString() {
    return 'AppState<$T>.unAuthenticated(failure: $failure, isNavigate: $isNavigate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnAuthenticated<T> &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality()
                .equals(other.isNavigate, isNavigate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(isNavigate));

  @JsonKey(ignore: true)
  @override
  $UnAuthenticatedCopyWith<T, UnAuthenticated<T>> get copyWith =>
      _$UnAuthenticatedCopyWithImpl<T, UnAuthenticated<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T data, bool isNavigate) authenticated,
    required TResult Function(Failure? failure, bool isNavigate)
        unAuthenticated,
  }) {
    return unAuthenticated(failure, isNavigate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T data, bool isNavigate)? authenticated,
    TResult Function(Failure? failure, bool isNavigate)? unAuthenticated,
  }) {
    return unAuthenticated?.call(failure, isNavigate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T data, bool isNavigate)? authenticated,
    TResult Function(Failure? failure, bool isNavigate)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(failure, isNavigate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(Authenticated<T> value) authenticated,
    required TResult Function(UnAuthenticated<T> value) unAuthenticated,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class UnAuthenticated<T> implements AppState<T> {
  const factory UnAuthenticated({Failure? failure, bool isNavigate}) =
      _$UnAuthenticated<T>;

  Failure? get failure;
  bool get isNavigate;
  @JsonKey(ignore: true)
  $UnAuthenticatedCopyWith<T, UnAuthenticated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
