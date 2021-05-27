// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$_$_NotificationModelFromJson(Map<String, dynamic> json) {
  return _$_NotificationModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    body: json['body'] as String?,
    date: json['date'] as String?,
  );
}

Map<String, dynamic> _$_$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date,
    };
