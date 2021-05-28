// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subject _$_$_SubjectFromJson(Map<String, dynamic> json) {
  return _$_Subject(
    subjectId: json['subjectId'] as int?,
    subjectName: json['subjectName'] as String?,
    units: (json['units'] as List<dynamic>?)
        ?.map((e) => Unit.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'units': instance.units,
    };
