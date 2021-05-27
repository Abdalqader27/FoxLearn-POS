// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Invoice _$_$_InvoiceFromJson(Map<String, dynamic> json) {
  return _$_Invoice(
    id: json['id'] as int?,
    invoiceNumber: json['invoiceNumber'] as String?,
    codeCount: json['codeCount'] as int?,
    notes: json['notes'] as String?,
    totalValue: (json['totalValue'] as num?)?.toDouble(),
    invoiceDate: json['invoiceDate'] as String?,
    paidValue: (json['paidValue'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_InvoiceToJson(_$_Invoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'codeCount': instance.codeCount,
      'notes': instance.notes,
      'totalValue': instance.totalValue,
      'invoiceDate': instance.invoiceDate,
      'paidValue': instance.paidValue,
    };
