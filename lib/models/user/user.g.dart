// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    userName: json['username'] as String?,
    receivedCodes: json['receivedCodes'] as int?,
    token: json['token'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    posAddress: json['posAddress'] as String?,
    subscriptionsCount: json['subscriptionsCount'] as int?,
    moneyLimit: (json['moneyLimit'] as num?)?.toDouble(),
    dateBlocked: json['dateBlocked'] as String?,
    count: json['count'] as int?,
    netProfit: (json['netProfit'] as num?)?.toDouble(),
    discountAvailable: json['discountAvailable'] as bool?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.userName,
      'receivedCodes': instance.receivedCodes,
      'token': instance.token,
      'email': instance.email,
      'phone': instance.phone,
      'posAddress': instance.posAddress,
      'subscriptionsCount': instance.subscriptionsCount,
      'moneyLimit': instance.moneyLimit,
      'dateBlocked': instance.dateBlocked,
      'count': instance.count,
      'netProfit': instance.netProfit,
      'discountAvailable': instance.discountAvailable,
    };
