// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
class _$SubjectTearOff {
  const _$SubjectTearOff();

  _Subject call({int? subjectId, String? subjectName, List<Unit>? units}) {
    return _Subject(
      subjectId: subjectId,
      subjectName: subjectName,
      units: units,
    );
  }

  Subject fromJson(Map<String, Object> json) {
    return Subject.fromJson(json);
  }
}

/// @nodoc
const $Subject = _$SubjectTearOff();

/// @nodoc
mixin _$Subject {
  int? get subjectId => throw _privateConstructorUsedError;
  String? get subjectName => throw _privateConstructorUsedError;
  List<Unit>? get units => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res>;
  $Res call({int? subjectId, String? subjectName, List<Unit>? units});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res> implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  final Subject _value;
  // ignore: unused_field
  final $Res Function(Subject) _then;

  @override
  $Res call({
    Object? subjectId = freezed,
    Object? subjectName = freezed,
    Object? units = freezed,
  }) {
    return _then(_value.copyWith(
      subjectId: subjectId == freezed
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectName: subjectName == freezed
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      units: units == freezed
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Unit>?,
    ));
  }
}

/// @nodoc
abstract class _$SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$SubjectCopyWith(_Subject value, $Res Function(_Subject) then) =
      __$SubjectCopyWithImpl<$Res>;
  @override
  $Res call({int? subjectId, String? subjectName, List<Unit>? units});
}

/// @nodoc
class __$SubjectCopyWithImpl<$Res> extends _$SubjectCopyWithImpl<$Res>
    implements _$SubjectCopyWith<$Res> {
  __$SubjectCopyWithImpl(_Subject _value, $Res Function(_Subject) _then)
      : super(_value, (v) => _then(v as _Subject));

  @override
  _Subject get _value => super._value as _Subject;

  @override
  $Res call({
    Object? subjectId = freezed,
    Object? subjectName = freezed,
    Object? units = freezed,
  }) {
    return _then(_Subject(
      subjectId: subjectId == freezed
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectName: subjectName == freezed
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      units: units == freezed
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Unit>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Subject implements _Subject {
  _$_Subject({this.subjectId, this.subjectName, this.units});

  factory _$_Subject.fromJson(Map<String, dynamic> json) =>
      _$_$_SubjectFromJson(json);

  @override
  final int? subjectId;
  @override
  final String? subjectName;
  @override
  final List<Unit>? units;

  @override
  String toString() {
    return 'Subject(subjectId: $subjectId, subjectName: $subjectName, units: $units)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Subject &&
            (identical(other.subjectId, subjectId) ||
                const DeepCollectionEquality()
                    .equals(other.subjectId, subjectId)) &&
            (identical(other.subjectName, subjectName) ||
                const DeepCollectionEquality()
                    .equals(other.subjectName, subjectName)) &&
            (identical(other.units, units) ||
                const DeepCollectionEquality().equals(other.units, units)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subjectId) ^
      const DeepCollectionEquality().hash(subjectName) ^
      const DeepCollectionEquality().hash(units);

  @JsonKey(ignore: true)
  @override
  _$SubjectCopyWith<_Subject> get copyWith =>
      __$SubjectCopyWithImpl<_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubjectToJson(this);
  }
}

abstract class _Subject implements Subject {
  factory _Subject({int? subjectId, String? subjectName, List<Unit>? units}) =
      _$_Subject;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$_Subject.fromJson;

  @override
  int? get subjectId => throw _privateConstructorUsedError;
  @override
  String? get subjectName => throw _privateConstructorUsedError;
  @override
  List<Unit>? get units => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubjectCopyWith<_Subject> get copyWith =>
      throw _privateConstructorUsedError;
}
