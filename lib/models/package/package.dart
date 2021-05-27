import 'package:foxlearn_pos/models/subject/subject.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.freezed.dart';

part 'package.g.dart';

@freezed
class Package with _$Package {
  factory Package({
    int? id,
    String? name,
    String? description,
    int? packageType,
    double? price,
    String? startDate,
    String? endDate,
    @JsonKey(name: 'subjectsUnits') List<Subject>? subjects,
  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
}
