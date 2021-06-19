import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:foxlearn_pos/models/code/code.dart';
import 'package:foxlearn_pos/models/invoice/invoice.dart';
import 'package:foxlearn_pos/models/notification/notification.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/models/user/user.dart';
import 'package:foxlearn_pos/services/api/api_routes.dart';
import 'package:foxlearn_pos/services/api/dio_client.dart';

import 'api_repository.dart';
import 'api_result/api_result.dart';
import 'network_expcepations/network_exceptions.dart';

class ApiRepositoryImpl extends ApiRepository {
  late DioClient dioClient;
  static const String _BASE_URL = 'http://194.32.76.82:8751/api';

  ApiRepositoryImpl() {
    var dio = Dio();
    dioClient = DioClient(_BASE_URL, dio);
  }

  @override
  Future<ApiResult<User>> login(String userName, String password) async {
    try {
      final response = await dioClient.post(ApiRoutes.LOGIN,
          data: {'username': userName, 'password': password});

      return ApiResult.success(data: User.fromJson(response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<User>> getUser(int? userId) async {
    try {
      final response = await dioClient.get(ApiRoutes.GET_USERS,
          queryParameters: {'id': userId}, auth: true);
      final List usersList = response['users'];
      final User user = User.fromJson(usersList.first);
      return ApiResult.success(data: user);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<bool?>> checkSecurityStamp(
      String? username, String? securityStamp) async {
    try {
      final response = await dioClient.get(
        ApiRoutes.CHECK_SECURITY_STAMP,
        auth: true,
        queryParameters: {'username': username, 'securityStamp': securityStamp},
      );
      return ApiResult.success(data: response);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<List<Package>>> getPackages() async {
    try {
      final response = await dioClient.get(
        ApiRoutes.GET_PACKAGES,
        auth: true,
      );
      final List<Package> packages = (response as List).map((e) {
        return Package.fromJson(e);
      }).toList();
      return ApiResult.success(data: packages);
    } catch (e) {
      print('error $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<List<Code>>> getPosCodes(int? posId) async {
    try {
      final response = await dioClient.get(
        ApiRoutes.GET_POS_CODES,
        queryParameters: {'posId': posId},
        auth: true,
      );
      final List<Code> codes =
      ( response as List).map((e)  {
        return Code.fromJson(e);
      }).toList() ;
      print('codes $codes');

      return ApiResult.success(data: codes);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<bool?>> removeCode(int? codeId) async {
    try {
      final response = await dioClient.put(ApiRoutes.REMOVE_CODES,
          data: [codeId], auth: true);

      if (response['type'] == 1) {
        return ApiResult.failure(
            error: NetworkExceptions.removeCodeError('تعذر حذف الكود'));
      }

      return ApiResult.success(data: response['type'] == 0);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<Code>> generateCode(
      int? posId, int? packageId, double discountRate) async {
    print({
      'posId': posId,
      'packagesIds': [packageId],
      'discountRate': discountRate,
      "packageType": 0,
    });
    try {
      final response = await dioClient.post(ApiRoutes.GENERATE_CODE,
          data: {
            'posId': posId,
            'packagesIds': [packageId],
            'discountRate': discountRate,
            "packageType": 0,
          },
          auth: true);
      if (response is String)
        return ApiResult.failure(
            error: NetworkExceptions.removeCodeError(response));

      Code code = Code.fromJson(response);
      return ApiResult.success(data: code);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<List<List<NotificationModel>>>> getNotifications() async {
    try {
      final response = await dioClient.get(ApiRoutes.GET_ALL_NOTIFICATION,
          queryParameters: {'type': 1}, auth: true);
      List<List<NotificationModel>> notifications = [];
      final List todayNotifications = response['notificationsToday'];
      final List oldNotifications = response['pastNotifications'];
      notifications.add(todayNotifications
          .map((e) => NotificationModel.fromJson(e))
          .toList());
      notifications.add(
          oldNotifications.map((e) => NotificationModel.fromJson(e)).toList());
      return ApiResult.success(data: notifications);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<List<Invoice>>> getPosInvoices(int? posId) async {
    try {
      final response = await dioClient.get(ApiRoutes.GET_POS_INVOICES,
          queryParameters: {'posId': posId}, auth: true);
      List<Invoice> invoices =
          (response as List).map((e) => Invoice.fromJson(e)).toList();
      return ApiResult.success(data: invoices);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
}
