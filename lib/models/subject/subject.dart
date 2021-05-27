import 'package:foxlearn_pos/models/unit/unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

@freezed
class Subject with _$Subject {
  factory Subject({
    int? subjectId,
    String? subjectName,
    List<Unit>? units,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}
