import 'package:dio/dio.dart';
import 'package:orel_it/common/errors/server_failures.dart';

/// Exception for the HTTP requests from Dio
class ServerException implements Exception {
  late String errorMessage;
  late bool unexpectedError;
  ServerErrorData? data;

  ServerException({required this.errorMessage, required this.unexpectedError});

  /// Constructor for Dio package
  ServerException.fromDioError(DioError dioError) {
    data = ServerErrorData.fromDioError(dioError);
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = "Request Cancel";
        unexpectedError = false;
        break;
      case DioErrorType.connectTimeout:
        errorMessage = "Timeout";
        unexpectedError = false;
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = "Receive Timeout";
        unexpectedError = false;
        break;
      case DioErrorType.sendTimeout:
        errorMessage = "Send Timeout";
        unexpectedError = false;
        break;
      case DioErrorType.response:
        errorMessage = _handleStatusCode(dioError.response);
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = "Error";
          unexpectedError = false;
          break;
        }
        errorMessage = "Unexpected Error";
        unexpectedError = true;
        break;
      default:
        errorMessage = "Something went wrong";
        unexpectedError = true;
        break;
    }
  }

  String _handleStatusCode(Response? response) {
    int? statusCode = response?.statusCode;
    switch (statusCode) {
      case 400:
        unexpectedError = true;
        return "Error code 400";
      case 401:
        unexpectedError = false;
        return "Error code 401";
      case 403:
        unexpectedError = false;
        return "Error code 402";
      case 404:
        unexpectedError = true;
        return "Error code 404";
      default:
        unexpectedError = true;
        return "Error code ${statusCode.toString()}";
    }
  }

  @override
  String toString() {
    return 'ServerException{errorMessage: $errorMessage, unexpectedError: $unexpectedError, data: ${data.toString()}}';
  }
}
