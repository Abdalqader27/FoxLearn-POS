// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {int? id,
      String? firstName,
      String? lastName,
      @JsonKey(name: 'username') String? userName,
      int? receivedCodes,
      String? token,
      String? email,
      String? phoneNumber,
      String? posAddress,
      int? subscriptionsCount,
      double? moneyLimit,
      String? dateBlocked,
      int? count,
      double? netProfit,
      bool? discountAvailable}) {
    return _User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      receivedCodes: receivedCodes,
      token: token,
      email: email,
      phoneNumber: phoneNumber,
      posAddress: posAddress,
      subscriptionsCount: subscriptionsCount,
      moneyLimit: moneyLimit,
      dateBlocked: dateBlocked,
      count: count,
      netProfit: netProfit,
      discountAvailable: discountAvailable,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get userName => throw _privateConstructorUsedError;
  int? get receivedCodes => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get posAddress => throw _privateConstructorUsedError;
  int? get subscriptionsCount => throw _privateConstructorUsedError;
  double? get moneyLimit => throw _privateConstructorUsedError;
  String? get dateBlocked => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  double? get netProfit => throw _privateConstructorUsedError;
  bool? get discountAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      @JsonKey(name: 'username') String? userName,
      int? receivedCodes,
      String? token,
      String? email,
      String? phoneNumber,
      String? posAddress,
      int? subscriptionsCount,
      double? moneyLimit,
      String? dateBlocked,
      int? count,
      double? netProfit,
      bool? discountAvailable});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? receivedCodes = freezed,
    Object? token = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? posAddress = freezed,
    Object? subscriptionsCount = freezed,
    Object? moneyLimit = freezed,
    Object? dateBlocked = freezed,
    Object? count = freezed,
    Object? netProfit = freezed,
    Object? discountAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedCodes: receivedCodes == freezed
          ? _value.receivedCodes
          : receivedCodes // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      posAddress: posAddress == freezed
          ? _value.posAddress
          : posAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionsCount: subscriptionsCount == freezed
          ? _value.subscriptionsCount
          : subscriptionsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      moneyLimit: moneyLimit == freezed
          ? _value.moneyLimit
          : moneyLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      dateBlocked: dateBlocked == freezed
          ? _value.dateBlocked
          : dateBlocked // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      netProfit: netProfit == freezed
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      discountAvailable: discountAvailable == freezed
          ? _value.discountAvailable
          : discountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      @JsonKey(name: 'username') String? userName,
      int? receivedCodes,
      String? token,
      String? email,
      String? phoneNumber,
      String? posAddress,
      int? subscriptionsCount,
      double? moneyLimit,
      String? dateBlocked,
      int? count,
      double? netProfit,
      bool? discountAvailable});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? receivedCodes = freezed,
    Object? token = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? posAddress = freezed,
    Object? subscriptionsCount = freezed,
    Object? moneyLimit = freezed,
    Object? dateBlocked = freezed,
    Object? count = freezed,
    Object? netProfit = freezed,
    Object? discountAvailable = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedCodes: receivedCodes == freezed
          ? _value.receivedCodes
          : receivedCodes // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      posAddress: posAddress == freezed
          ? _value.posAddress
          : posAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionsCount: subscriptionsCount == freezed
          ? _value.subscriptionsCount
          : subscriptionsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      moneyLimit: moneyLimit == freezed
          ? _value.moneyLimit
          : moneyLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      dateBlocked: dateBlocked == freezed
          ? _value.dateBlocked
          : dateBlocked // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      netProfit: netProfit == freezed
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      discountAvailable: discountAvailable == freezed
          ? _value.discountAvailable
          : discountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User implements _User {
  _$_User(
      {this.id,
      this.firstName,
      this.lastName,
      @JsonKey(name: 'username') this.userName,
      this.receivedCodes,
      this.token,
      this.email,
      this.phoneNumber,
      this.posAddress,
      this.subscriptionsCount,
      this.moneyLimit,
      this.dateBlocked,
      this.count,
      this.netProfit,
      this.discountAvailable});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final int? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  @JsonKey(name: 'username')
  final String? userName;
  @override
  final int? receivedCodes;
  @override
  final String? token;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? posAddress;
  @override
  final int? subscriptionsCount;
  @override
  final double? moneyLimit;
  @override
  final String? dateBlocked;
  @override
  final int? count;
  @override
  final double? netProfit;
  @override
  final bool? discountAvailable;

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, receivedCodes: $receivedCodes, token: $token, email: $email, phoneNumber: $phoneNumber, posAddress: $posAddress, subscriptionsCount: $subscriptionsCount, moneyLimit: $moneyLimit, dateBlocked: $dateBlocked, count: $count, netProfit: $netProfit, discountAvailable: $discountAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.receivedCodes, receivedCodes) ||
                const DeepCollectionEquality()
                    .equals(other.receivedCodes, receivedCodes)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.posAddress, posAddress) ||
                const DeepCollectionEquality()
                    .equals(other.posAddress, posAddress)) &&
            (identical(other.subscriptionsCount, subscriptionsCount) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptionsCount, subscriptionsCount)) &&
            (identical(other.moneyLimit, moneyLimit) ||
                const DeepCollectionEquality()
                    .equals(other.moneyLimit, moneyLimit)) &&
            (identical(other.dateBlocked, dateBlocked) ||
                const DeepCollectionEquality()
                    .equals(other.dateBlocked, dateBlocked)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.netProfit, netProfit) ||
                const DeepCollectionEquality()
                    .equals(other.netProfit, netProfit)) &&
            (identical(other.discountAvailable, discountAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.discountAvailable, discountAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(receivedCodes) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(posAddress) ^
      const DeepCollectionEquality().hash(subscriptionsCount) ^
      const DeepCollectionEquality().hash(moneyLimit) ^
      const DeepCollectionEquality().hash(dateBlocked) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(netProfit) ^
      const DeepCollectionEquality().hash(discountAvailable);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {int? id,
      String? firstName,
      String? lastName,
      @JsonKey(name: 'username') String? userName,
      int? receivedCodes,
      String? token,
      String? email,
      String? phoneNumber,
      String? posAddress,
      int? subscriptionsCount,
      double? moneyLimit,
      String? dateBlocked,
      int? count,
      double? netProfit,
      bool? discountAvailable}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'username')
  String? get userName => throw _privateConstructorUsedError;
  @override
  int? get receivedCodes => throw _privateConstructorUsedError;
  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get posAddress => throw _privateConstructorUsedError;
  @override
  int? get subscriptionsCount => throw _privateConstructorUsedError;
  @override
  double? get moneyLimit => throw _privateConstructorUsedError;
  @override
  String? get dateBlocked => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  double? get netProfit => throw _privateConstructorUsedError;
  @override
  bool? get discountAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
