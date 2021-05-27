// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return _Invoice.fromJson(json);
}

/// @nodoc
class _$InvoiceTearOff {
  const _$InvoiceTearOff();

  _Invoice call(
      {int? id,
      String? invoiceNumber,
      int? codeCount,
      String? notes,
      double? totalValue,
      String? invoiceDate,
      double? paidValue}) {
    return _Invoice(
      id: id,
      invoiceNumber: invoiceNumber,
      codeCount: codeCount,
      notes: notes,
      totalValue: totalValue,
      invoiceDate: invoiceDate,
      paidValue: paidValue,
    );
  }

  Invoice fromJson(Map<String, Object> json) {
    return Invoice.fromJson(json);
  }
}

/// @nodoc
const $Invoice = _$InvoiceTearOff();

/// @nodoc
mixin _$Invoice {
  int? get id => throw _privateConstructorUsedError;
  String? get invoiceNumber => throw _privateConstructorUsedError;
  int? get codeCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double? get totalValue => throw _privateConstructorUsedError;
  String? get invoiceDate => throw _privateConstructorUsedError;
  double? get paidValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? invoiceNumber,
      int? codeCount,
      String? notes,
      double? totalValue,
      String? invoiceDate,
      double? paidValue});
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res> implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

  final Invoice _value;
  // ignore: unused_field
  final $Res Function(Invoice) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNumber = freezed,
    Object? codeCount = freezed,
    Object? notes = freezed,
    Object? totalValue = freezed,
    Object? invoiceDate = freezed,
    Object? paidValue = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNumber: invoiceNumber == freezed
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      codeCount: codeCount == freezed
          ? _value.codeCount
          : codeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      totalValue: totalValue == freezed
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceDate: invoiceDate == freezed
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      paidValue: paidValue == freezed
          ? _value.paidValue
          : paidValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$InvoiceCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$InvoiceCopyWith(_Invoice value, $Res Function(_Invoice) then) =
      __$InvoiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? invoiceNumber,
      int? codeCount,
      String? notes,
      double? totalValue,
      String? invoiceDate,
      double? paidValue});
}

/// @nodoc
class __$InvoiceCopyWithImpl<$Res> extends _$InvoiceCopyWithImpl<$Res>
    implements _$InvoiceCopyWith<$Res> {
  __$InvoiceCopyWithImpl(_Invoice _value, $Res Function(_Invoice) _then)
      : super(_value, (v) => _then(v as _Invoice));

  @override
  _Invoice get _value => super._value as _Invoice;

  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNumber = freezed,
    Object? codeCount = freezed,
    Object? notes = freezed,
    Object? totalValue = freezed,
    Object? invoiceDate = freezed,
    Object? paidValue = freezed,
  }) {
    return _then(_Invoice(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNumber: invoiceNumber == freezed
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      codeCount: codeCount == freezed
          ? _value.codeCount
          : codeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      totalValue: totalValue == freezed
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceDate: invoiceDate == freezed
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      paidValue: paidValue == freezed
          ? _value.paidValue
          : paidValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Invoice implements _Invoice {
  _$_Invoice(
      {this.id,
      this.invoiceNumber,
      this.codeCount,
      this.notes,
      this.totalValue,
      this.invoiceDate,
      this.paidValue});

  factory _$_Invoice.fromJson(Map<String, dynamic> json) =>
      _$_$_InvoiceFromJson(json);

  @override
  final int? id;
  @override
  final String? invoiceNumber;
  @override
  final int? codeCount;
  @override
  final String? notes;
  @override
  final double? totalValue;
  @override
  final String? invoiceDate;
  @override
  final double? paidValue;

  @override
  String toString() {
    return 'Invoice(id: $id, invoiceNumber: $invoiceNumber, codeCount: $codeCount, notes: $notes, totalValue: $totalValue, invoiceDate: $invoiceDate, paidValue: $paidValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Invoice &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                const DeepCollectionEquality()
                    .equals(other.invoiceNumber, invoiceNumber)) &&
            (identical(other.codeCount, codeCount) ||
                const DeepCollectionEquality()
                    .equals(other.codeCount, codeCount)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.totalValue, totalValue) ||
                const DeepCollectionEquality()
                    .equals(other.totalValue, totalValue)) &&
            (identical(other.invoiceDate, invoiceDate) ||
                const DeepCollectionEquality()
                    .equals(other.invoiceDate, invoiceDate)) &&
            (identical(other.paidValue, paidValue) ||
                const DeepCollectionEquality()
                    .equals(other.paidValue, paidValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(invoiceNumber) ^
      const DeepCollectionEquality().hash(codeCount) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(totalValue) ^
      const DeepCollectionEquality().hash(invoiceDate) ^
      const DeepCollectionEquality().hash(paidValue);

  @JsonKey(ignore: true)
  @override
  _$InvoiceCopyWith<_Invoice> get copyWith =>
      __$InvoiceCopyWithImpl<_Invoice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InvoiceToJson(this);
  }
}

abstract class _Invoice implements Invoice {
  factory _Invoice(
      {int? id,
      String? invoiceNumber,
      int? codeCount,
      String? notes,
      double? totalValue,
      String? invoiceDate,
      double? paidValue}) = _$_Invoice;

  factory _Invoice.fromJson(Map<String, dynamic> json) = _$_Invoice.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get invoiceNumber => throw _privateConstructorUsedError;
  @override
  int? get codeCount => throw _privateConstructorUsedError;
  @override
  String? get notes => throw _privateConstructorUsedError;
  @override
  double? get totalValue => throw _privateConstructorUsedError;
  @override
  String? get invoiceDate => throw _privateConstructorUsedError;
  @override
  double? get paidValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InvoiceCopyWith<_Invoice> get copyWith =>
      throw _privateConstructorUsedError;
}
