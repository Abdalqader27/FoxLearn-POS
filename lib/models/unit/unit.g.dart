// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Unit _$_$_UnitFromJson(Map<String, dynamic> json) {
  return _$_Unit(
    id: json['id'] as int?,
    name: json['name'] as String?,
    isActivated: json['isActivated'] as bool?,
    publishTime: json['publishTime'] as String?,
    lessonsCount: json['lessonsCount'] as int?,
    subjectId: json['subjectId'] as int?,
    subjectName: json['subjectName'] as String?,
    teacherName: json['teacherName'] as String?,
    price: (json['price'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_UnitToJson(_$_Unit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isActivated': instance.isActivated,
      'publishTime': instance.publishTime,
      'lessonsCount': instance.lessonsCount,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'teacherName': instance.teacherName,
      'price': instance.price,
    };
