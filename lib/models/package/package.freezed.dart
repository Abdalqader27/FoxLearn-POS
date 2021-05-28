// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Package _$PackageFromJson(Map<String, dynamic> json) {
  return _Package.fromJson(json);
}

/// @nodoc
class _$PackageTearOff {
  const _$PackageTearOff();

  _Package call(
      {int? id,
      String? name,
      String? description,
      int? packageType,
      double? price,
      String? startDate,
      String? endDate,
      @JsonKey(name: 'subjectsUnits') List<Subject>? subjects}) {
    return _Package(
      id: id,
      name: name,
      description: description,
      packageType: packageType,
      price: price,
      startDate: startDate,
      endDate: endDate,
      subjects: subjects,
    );
  }

  Package fromJson(Map<String, Object> json) {
    return Package.fromJson(json);
  }
}

/// @nodoc
const $Package = _$PackageTearOff();

/// @nodoc
mixin _$Package {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get packageType => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'subjectsUnits')
  List<Subject>? get subjects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageCopyWith<Package> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageCopyWith<$Res> {
  factory $PackageCopyWith(Package value, $Res Function(Package) then) =
      _$PackageCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? packageType,
      double? price,
      String? startDate,
      String? endDate,
      @JsonKey(name: 'subjectsUnits') List<Subject>? subjects});
}

/// @nodoc
class _$PackageCopyWithImpl<$Res> implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._value, this._then);

  final Package _value;
  // ignore: unused_field
  final $Res Function(Package) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? packageType = freezed,
    Object? price = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      packageType: packageType == freezed
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>?,
    ));
  }
}

/// @nodoc
abstract class _$PackageCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$PackageCopyWith(_Package value, $Res Function(_Package) then) =
      __$PackageCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? packageType,
      double? price,
      String? startDate,
      String? endDate,
      @JsonKey(name: 'subjectsUnits') List<Subject>? subjects});
}

/// @nodoc
class __$PackageCopyWithImpl<$Res> extends _$PackageCopyWithImpl<$Res>
    implements _$PackageCopyWith<$Res> {
  __$PackageCopyWithImpl(_Package _value, $Res Function(_Package) _then)
      : super(_value, (v) => _then(v as _Package));

  @override
  _Package get _value => super._value as _Package;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? packageType = freezed,
    Object? price = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_Package(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      packageType: packageType == freezed
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Package implements _Package {
  _$_Package(
      {this.id,
      this.name,
      this.description,
      this.packageType,
      this.price,
      this.startDate,
      this.endDate,
      @JsonKey(name: 'subjectsUnits') this.subjects});

  factory _$_Package.fromJson(Map<String, dynamic> json) =>
      _$_$_PackageFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? packageType;
  @override
  final double? price;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  @JsonKey(name: 'subjectsUnits')
  final List<Subject>? subjects;

  @override
  String toString() {
    return 'Package(id: $id, name: $name, description: $description, packageType: $packageType, price: $price, startDate: $startDate, endDate: $endDate, subjects: $subjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Package &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.packageType, packageType) ||
                const DeepCollectionEquality()
                    .equals(other.packageType, packageType)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.subjects, subjects) ||
                const DeepCollectionEquality()
                    .equals(other.subjects, subjects)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(packageType) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(subjects);

  @JsonKey(ignore: true)
  @override
  _$PackageCopyWith<_Package> get copyWith =>
      __$PackageCopyWithImpl<_Package>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PackageToJson(this);
  }
}

abstract class _Package implements Package {
  factory _Package(
      {int? id,
      String? name,
      String? description,
      int? packageType,
      double? price,
      String? startDate,
      String? endDate,
      @JsonKey(name: 'subjectsUnits') List<Subject>? subjects}) = _$_Package;

  factory _Package.fromJson(Map<String, dynamic> json) = _$_Package.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  int? get packageType => throw _privateConstructorUsedError;
  @override
  double? get price => throw _privateConstructorUsedError;
  @override
  String? get startDate => throw _privateConstructorUsedError;
  @override
  String? get endDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'subjectsUnits')
  List<Subject>? get subjects => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PackageCopyWith<_Package> get copyWith =>
      throw _privateConstructorUsedError;
}
