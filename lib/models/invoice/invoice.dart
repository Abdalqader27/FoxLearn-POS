import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  factory Invoice({
    int? id,
    String? invoiceNumber,
    int? codeCount,
    String? notes,
    double? totalValue,
    String? invoiceDate,
    double? paidValue,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}
