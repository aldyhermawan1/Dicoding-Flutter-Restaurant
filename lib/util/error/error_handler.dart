import 'dart:async';
import 'dart:io';

import 'package:dicoding_restaurant/values/strings.dart';
import 'package:dio/dio.dart';

import 'exceptions/api_exception.dart';
import 'exceptions/app_exception.dart';

Future errorHandler(dynamic error) {
  if (error is DioError) {
    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.response:
        var error = dioError.response?.data;
        throw ApiException(error['message'], error['code']);
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw TimeoutException('Terjadi Kesalahan, Silahkan dicoba kembali')
            .message!;
      default:
        if (dioError.error is SocketException) {
          throw const SocketException(messageErrorNetwork).message;
        } else if (dioError.error is FormatException) {
          throw const FormatException("Unable to process the data").message;
        } else {
          throw AppException(messageErrorGeneric).message;
        }
    }
  } else {
    throw AppException(messageErrorGeneric).message;
  }
}
