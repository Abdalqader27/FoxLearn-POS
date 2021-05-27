import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../local_data_source.dart';

const _defaultConnectTimeout = 30000;
const _defaultReceiveTimeout = 30000;

class DioClient {
  final String baseUrl;
  final Dio _dio;

  final List<Interceptor>? interceptors;

  DioClient(this.baseUrl, this._dio, {this.interceptors}) {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    if (interceptors?.isNotEmpty ?? false)
      _dio.interceptors.addAll(interceptors!);
    if (kDebugMode)
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool auth = false,
  }) async {
    try {
      if (auth) {
        final token = await LocalDataSource.getUserFromShared()
            .then((value) => value.token!);
        final header = {'authorization': 'Bearer $token'};
        if (options == null) {
          options = Options(headers: {'authorization': 'Bearer $token'});
        } else
          options.headers!.addAll(header);
      }
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool auth = false,
  }) async {
    try {
      if (auth) {
        final token = await LocalDataSource.getUserFromShared()
            .then((value) => value.token!);
        final header = {'authorization': 'Bearer $token'};
        if (options == null) {
          options = Options(headers: {'authorization': 'Bearer $token'});
        } else
          options.headers!.addAll(header);
      }
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response.statusCode.toString());
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> delete(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      bool auth = false}) async {
    if (auth) {
      final token = await LocalDataSource.getUserFromShared()
          .then((value) => value.token!);
      final header = {'authorization': 'Bearer $token'};
      if (options == null) {
        options = Options(headers: {'authorization': 'Bearer $token'});
      } else
        options.headers!.addAll(header);
    }
    try {
      var response = await _dio.delete(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> put(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      bool auth = false}) async {
    if (auth) {
      final token = await LocalDataSource.getUserFromShared()
          .then((value) => value.token!);
      final header = {'authorization': 'Bearer $token'};
      if (options == null) {
        options = Options(headers: {'authorization': 'Bearer $token'});
      } else
        options.headers!.addAll(header);
    }
    try {
      var response = await _dio.put(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}
