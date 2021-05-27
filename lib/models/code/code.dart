import 'package:freezed_annotation/freezed_annotation.dart';

part 'code.freezed.dart';
part 'code.g.dart';

@freezed
class Code with _$Code {
  factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);

  factory Code({
    int? id,
    String? code,
    int? unpaidPosCodes,
    int? soldPosCodes,
    int? studentId,
    String? studentName,
    int? posId,
    String? posName,
    double? price,
    String? dateActivated,
    String? dateCreated,
    double? discountRate,
    double? rate,
    List<String>? packagesNames,
    List<int>? packagesIds,
  }) = _Code;
}
