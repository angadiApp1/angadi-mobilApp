// ignore_for_file: constant_identifier_names
import 'package:angadiapp/core/network/failure.dart';
import 'package:dio/dio.dart';

enum ResponseStatus {
  SUCCESS,
  SUCCESS_NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  CONFLICT,
  DEFAULT,
  NULL,
}

class ResponseMessage {
  // API response messages
  static const String SUCCESS = "Success";
  static const String NO_CONTENT = "Success (No Content)";
  static const String BAD_REQUEST = "Bad Request";
  static const String FORBIDDEN = "Forbidden";
  static const String UNAUTHORISED = "Unauthorised";
  static const String NOT_FOUND = "Not Found";
  static const String INTERNAL_SERVER_ERROR = "Internal Server Error";
  static const String CONFLICT = "Conflict";

  // Local responses messages
  static const String DEFAULT = "Default Error";
  static const String CONNECT_TIMEOUT = "Connection Timeout";
  static const String CANCEL = "Request Cancelled";
  static const String RECEIVE_TIMEOUT = "Receive Timeout";
  static const String SEND_TIMEOUT = "Send Timeout";
  static const String CACHE_ERROR = "Cache Error";
  static const String NO_INTERNET_CONNECTION = "No Internet Connection";
  static const String NULL = "No Data Found";
}

class ResponseCode {
  // API status code
  static const int SUCCESS = 200;
  static const int SUCCESS_NO_CONTENT = 204;
  static const int BAD_REQUEST = 400;
  static const int FORBIDDEN = 403;
  static const int UNAUTHORISED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int CONFLICT = 409;

  // Local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
  static const int NULL = -8;
}

extension ResponseStatusExtension on ResponseStatus {
  Failure getFailure() {
    switch (this) {
      case ResponseStatus.BAD_REQUEST:
        return Failure(
          code: ResponseCode.BAD_REQUEST,
          message: ResponseMessage.BAD_REQUEST,
        );
      case ResponseStatus.FORBIDDEN:
        return Failure(
          code: ResponseCode.FORBIDDEN,
          message: ResponseMessage.FORBIDDEN,
        );
      case ResponseStatus.UNAUTHORISED:
        return Failure(
          code: ResponseCode.UNAUTHORISED,
          message: ResponseMessage.UNAUTHORISED,
        );
      case ResponseStatus.NOT_FOUND:
        return Failure(
          code: ResponseCode.NOT_FOUND,
          message: ResponseMessage.NOT_FOUND,
        );
      case ResponseStatus.INTERNAL_SERVER_ERROR:
        return Failure(
          code: ResponseCode.INTERNAL_SERVER_ERROR,
          message: ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case ResponseStatus.CONNECT_TIMEOUT:
        return Failure(
          code: ResponseCode.CONNECT_TIMEOUT,
          message: ResponseMessage.CONNECT_TIMEOUT,
        );
      case ResponseStatus.CANCEL:
        return Failure(
          code: ResponseCode.CANCEL,
          message: ResponseMessage.CANCEL,
        );
      case ResponseStatus.RECEIVE_TIMEOUT:
        return Failure(
          code: ResponseCode.RECEIVE_TIMEOUT,
          message: ResponseMessage.RECEIVE_TIMEOUT,
        );
      case ResponseStatus.SEND_TIMEOUT:
        return Failure(
          code: ResponseCode.SEND_TIMEOUT,
          message: ResponseMessage.SEND_TIMEOUT,
        );
      case ResponseStatus.CACHE_ERROR:
        return Failure(
          code: ResponseCode.CACHE_ERROR,
          message: ResponseMessage.CACHE_ERROR,
        );
      case ResponseStatus.NO_INTERNET_CONNECTION:
        return Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION,
          message: ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case ResponseStatus.CONFLICT:
        return Failure(
          code: ResponseCode.CONFLICT,
          message: ResponseMessage.CONFLICT,
        );
      case ResponseStatus.DEFAULT:
        return Failure();
      case ResponseStatus.NULL:
        return Failure(code: ResponseCode.NULL, message: ResponseMessage.NULL);
      default:
        return Failure();
    }
  }
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = ResponseStatus.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    if (error.response != null) {
      switch (error.response!.statusCode) {
        case ResponseCode.BAD_REQUEST:
          return ResponseStatus.BAD_REQUEST.getFailure();
        case ResponseCode.FORBIDDEN:
          return ResponseStatus.FORBIDDEN.getFailure();
        case ResponseCode.UNAUTHORISED:
          return ResponseStatus.UNAUTHORISED.getFailure();
        case ResponseCode.NOT_FOUND:
          return ResponseStatus.NOT_FOUND.getFailure();
        case ResponseCode.INTERNAL_SERVER_ERROR:
          return ResponseStatus.INTERNAL_SERVER_ERROR.getFailure();
        case ResponseCode.CONFLICT:
          return ResponseStatus.CONFLICT.getFailure();
        default:
          return ResponseStatus.DEFAULT.getFailure();
      }
    } else {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ResponseStatus.CONNECT_TIMEOUT.getFailure();
        case DioExceptionType.sendTimeout:
          return ResponseStatus.SEND_TIMEOUT.getFailure();
        case DioExceptionType.receiveTimeout:
          return ResponseStatus.RECEIVE_TIMEOUT.getFailure();
        case DioExceptionType.cancel:
          return ResponseStatus.CANCEL.getFailure();
        default:
          return ResponseStatus.DEFAULT.getFailure();
      }
    }
  }
}
