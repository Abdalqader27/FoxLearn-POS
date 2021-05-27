import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User(
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
      bool? discountAvailable}) = _User;
}
