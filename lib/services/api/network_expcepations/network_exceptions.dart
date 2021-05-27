import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.blockedUser() = BlockedUser;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  ///custom API Errors
  const factory NetworkExceptions.removeCodeError(String error) =
      RemoveCodeError;

  static NetworkExceptions? getDioException(error) {
    print(error);
    if (error is Exception) {
      try {
        NetworkExceptions? networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptions.badRequest();
                  break;
                case 401:
                  networkExceptions = NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions = NetworkExceptions.blockedUser();
                  break;
                case 404:
                  networkExceptions = NetworkExceptions.notFound("Not found");
                  break;
                case 409:
                  networkExceptions = NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions = NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions = NetworkExceptions.serviceUnavailable();
                  break;
                case 502:
                  networkExceptions = NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response!.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return NetworkExceptions.formatException();
      } catch (_) {
        return NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "تعذر الاتصال بالخادم!";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "حدث خطأ أثناء الاتصال بالخادم!";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "حدث خطأ أثناء الاتصال بالخادم!";
    }, unauthorisedRequest: () {
      errorMessage = "هناك خطأ في كلمة المرور او اسم المستخدم!";
    }, unexpectedError: () {
      errorMessage = "حدث خطأ غير متوقع!";
    }, requestTimeout: () {
      errorMessage = "انتهت مهلة الاتصال بالخادم!";
    }, noInternetConnection: () {
      errorMessage = "تأكد من اتصالك بالانترنت!";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "انتهت مهلة الاتصال بالخادم!";
    }, unableToProcess: () {
      errorMessage = "حدث خطأ غير متوقع!";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = 'حدث خطا غير متوقع!';
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    }, removeCodeError: (String message) {
      errorMessage = message;
    }, blockedUser: () {
      errorMessage = 'هذا الحساب محظور!';
    });
    return errorMessage;
  }
}
