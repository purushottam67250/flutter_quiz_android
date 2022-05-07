// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as int?,
      token: json['token'] as String,
      email: json['email'] as String,
      niceName: json['niceName'] as String,
      displayName: json['displayName'] as String,
      userId: json['userId'] as String? ?? '',
      userFirstName: json['userFirstName'] as String,
      userLastName: json['userLastName'] as String,
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'email': instance.email,
      'niceName': instance.niceName,
      'displayName': instance.displayName,
      'userId': instance.userId,
      'userFirstName': instance.userFirstName,
      'userLastName': instance.userLastName,
      'image': instance.image,
    };
