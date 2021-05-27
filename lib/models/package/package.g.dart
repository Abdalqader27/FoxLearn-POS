// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Package _$_$_PackageFromJson(Map<String, dynamic> json) {
  return _$_Package(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    packageType: json['packageType'] as int?,
    price: (json['price'] as num?)?.toDouble(),
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    subjects: (json['subjectsUnits'] as List<dynamic>?)
        ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_PackageToJson(_$_Package instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'packageType': instance.packageType,
      'price': instance.price,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'subjectsUnits': instance.subjects,
    };
