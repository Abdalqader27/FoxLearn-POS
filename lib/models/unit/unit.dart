import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@freezed
class Unit with _$Unit {
  factory Unit(
      {int? id,
      String? name,
      bool? isActivated,
      String? publishTime,
      int? lessonsCount,
      int? subjectId,
      String? subjectName,
      String? teacherName,
      double? price}) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}

// "id": 0,
// "name": "مترجمات",
// "isActivated": false,
// "publishTime": "0001-01-01T00:00:00",
// "lessonsCount": 0,
// "subjectId": 0,
// "subjectName": null,
// "teacherName": null,
// "price": 300000
