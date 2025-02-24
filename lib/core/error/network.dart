import 'package:dio/dio.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/error/permission.dart';
import 'package:flymefy/core/extension/data_source.dart';

class NetworkException implements Exception {
  NetworkException.handleNetworkError(final dynamic error,
      {dynamic data = ''}) {
    if (error is DioException) {
      failure = _handleNetworkDioFailure(error, data);
    } else {
      failure = DataSourcePermission.unknownPermissionError.getFailure();
    }
  }
  late Failure failure;

  Failure _handleNetworkDioFailure(final DioException error, dynamic data) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSourceNetworkError.connectTimeOut.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSourceNetworkError.sendTimeOut.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSourceNetworkError.receiveTimeOut.getFailure();
      case DioExceptionType.connectionError:
        return DataSourceNetworkError.connectTimeOut.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null) {
          final errorData = error.response!.data;

          if (errorData is Map<String, dynamic>) {
            if (errorData['errors'] != null) {
              final errors = errorData['errors'];
              if (errors is List<dynamic>) {
                return Failure(
                  code: 10203040,
                  message: errors.first.toString(),
                );
              } else {
                return Failure(
                  code: 10203040,
                  message: errors['errors'].toString(),
                );
              }
            }
          }

          return ApiException.handleApiError(error.response).failure;
        } else {
          return DataSourceNetworkError.unknownError.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSourceNetworkError.cancel.getFailure();
      case DioExceptionType.badCertificate:
        return DataSourceNetworkError.unAuthorized.getFailure();

      default:
        return DataSourceNetworkError.unknownError.getFailure();
    }
  }
}
