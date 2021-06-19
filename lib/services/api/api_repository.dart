

import 'package:foxlearn_pos/models/code/code.dart';
import 'package:foxlearn_pos/models/invoice/invoice.dart';
import 'package:foxlearn_pos/models/notification/notification.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/models/user/user.dart';

import 'api_result/api_result.dart';

abstract class ApiRepository {
  Future<ApiResult<User>> login(String userName, String password);
  Future<ApiResult<User>> getUser(int userId);

  Future<ApiResult<bool?>> checkSecurityStamp(
      String username, String securityStamp);

  Future<ApiResult<List<Package>>> getPackages();

  Future<ApiResult<List<Code>>> getPosCodes(int posId);

  Future<ApiResult<bool?>> removeCode(int codeId);

  Future<ApiResult<Code>> generateCode(
      int posId, int packageId, double discountRate);

  Future<ApiResult<List<Invoice>>> getPosInvoices(int posId);

  Future<ApiResult<List<List<NotificationModel>>>> getNotifications();
}
