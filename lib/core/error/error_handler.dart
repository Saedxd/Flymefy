import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/error/network.dart';
import 'package:flymefy/core/extension/data_source.dart';
import 'package:flymefy/core/logger/logger.dart';

import 'permission.dart';
import 'url_launcher.dart';

class ExceptionHandling {
  ExceptionHandling.handleError(final dynamic error, {dynamic data = ''}) {
    final type = error.runtimeType;

    if (type == DioException) {
      failure = NetworkException.handleNetworkError(error, data: data).failure;
      Logger.log('DioException : $error /n failure : ${failure.message}',
          level: LogLevel.success);
    } else if (type == SocketException) {
      failure = DataSourceNetworkError.internalServerError.getFailure();
      Logger.log('SocketException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == FormatException) {
      failure = DataSourceNetworkError.formatException.getFailure();
      Logger.log('FormatException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == UrlLauncherException) {
      failure = UrlLauncherException.handleUrlLancherError(error).failure;
      Logger.log(
          'UrlLauncherException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == PermissionException) {
      failure = PermissionException.handlePermissionError(error).failure;
      Logger.log('PermissionException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == Map<String, dynamic>) {
      failure = ApiException.handleApiError(error).failure;
      Logger.log('PermissionException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else {
      failure = DataSourceNetworkError.unknownError.getFailure();
      Logger.log('default : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    }
  }

  late Failure failure;
}
