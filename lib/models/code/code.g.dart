// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Code _$_$_CodeFromJson(Map<String, dynamic> json) {
  return _$_Code(
    id: json['id'] as int?,
    code: json['code'] as String?,
    unpaidPosCodes: json['unpaidPosCodes'] as int?,
    soldPosCodes: json['soldPosCodes'] as int?,
    studentId: json['studentId'] as int?,
    studentName: json['studentName'] as String?,
    posId: json['posId'] as int?,
    posName: json['posName'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    dateActivated: json['dateActivated'] as String?,
    dateCreated: json['dateCreated'] as String?,
    discountRate: (json['discountRate'] as num?)?.toDouble(),
    rate: (json['rate'] as num?)?.toDouble(),
    packagesNames: (json['packagesNames'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    packagesIds:
        (json['packagesIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$_$_CodeToJson(_$_Code instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'unpaidPosCodes': instance.unpaidPosCodes,
      'soldPosCodes': instance.soldPosCodes,
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'posId': instance.posId,
      'posName': instance.posName,
      'price': instance.price,
      'dateActivated': instance.dateActivated,
      'dateCreated': instance.dateCreated,
      'discountRate': instance.discountRate,
      'rate': instance.rate,
      'packagesNames': instance.packagesNames,
      'packagesIds': instance.packagesIds,
    };
