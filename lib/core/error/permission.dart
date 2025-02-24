// devloper

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/extension/data_source.dart';
import 'package:flymefy/core/network/base_response.dart';
import 'package:flymefy/core/resources_manager/strings.dart';

class PermissionException implements Exception {
  PermissionException.handlePermissionError(final dynamic error) {
    if (error is DataSourcePermission) {
      failure = _handlePermissionError(error);
    } else {
      failure = DataSourcePermission.unknownPermissionError.getFailure();
    }
  }
  late Failure failure;

  Failure _handlePermissionError(
      final DataSourcePermission dataSourcePermissionError) {
    switch (dataSourcePermissionError) {
      case DataSourcePermission.permissionDenied:
        return DataSourcePermission.permissionDenied.getFailure();
      case DataSourcePermission.permissionPermanentlyDenied:
        return DataSourcePermission.permissionPermanentlyDenied.getFailure();
      case DataSourcePermission.permissionRestricted:
        return DataSourcePermission.permissionRestricted.getFailure();
      case DataSourcePermission.checkPermissionError:
        return DataSourcePermission.checkPermissionError.getFailure();
      case DataSourcePermission.noImageSelected:
        return DataSourcePermission.noImageSelected.getFailure();
      default:
        return DataSourcePermission.unknownPermissionError.getFailure();
    }
  }
}

class ApiException implements Exception {
  ApiException.handleApiError(final dynamic error) {
    log('ApiException.handleApiError: ${error.runtimeType}');

    if (error is BaseResponse) {
      // Handle BaseResponse errors
      if (error.errors is Map<String, dynamic>) {
        final list = error.errors['errors'];
        failure = Failure(
          code: 10203040,
          message: list.first.toString(),
        );
      } else {
        failure = Failure(
          code: 10203040,
          message: error.errors['errors'].toString(),
        );
      }
    } else if (error is Map<String, dynamic>) {
      // Handle generic Map error
      if (error['errors'] != null) {
        if (error['errors'] is List<dynamic>) {
          List<String> errors =
              error['errors'].map<String>((e) => e.toString()).toList();
          failure = Failure(
            code: 10203040,
            message: errors.first.toString(),
          );
        }
      } else if (error['message'] != null) {
        failure = Failure(
            message: error['message'].toString().isEmpty
                ? AppStrings.unknownError
                : error['message'].toString(),
            code: 10203040);
      } else if (error['error'] != null) {
        // Check if error is "Not Authenticated" and set a custom message
        String errorMessage = error['error'].toString();
        if (errorMessage == "Not Authenticated") {
          errorMessage = AppStrings.pleaseLoginOrMakeANewAccount;
        }
        failure =
            Failure(message: errorMessage, code: error['status'] ?? 10203040);
      } else if (error['status'] != null) {
        if (error['status']['code'] == 422) {
          failure = Failure(
            message: error['results'].toString().isEmpty
                ? AppStrings.unknownError
                : error['results'].toString(),
            code: error['status']['code'],
          );
        } else {
          failure = Failure(
              message: error['status']['message'].toString().isEmpty
                  ? AppStrings.unknownError
                  : error['status']['message'].toString(),
              code: error['status']['code']);
        }
      } else {
        failure = DataSourceNetworkError.unknownError.getFailure();
      }
    } else if (error is Response<dynamic>) {
      // Handle Dio response error
      if (error.data is Map<String, dynamic>) {
        if (error.data['errors'] != null) {
          if (error.data['errors'] is List<dynamic>) {
            List<String> errors =
                error.data['errors'].map<String>((e) => e.toString()).toList();
            failure = Failure(
              code: error.statusCode ?? 10203040,
              message: errors.first.toString(),
            );
          }
        } else if (error.data['error'] != null) {
          // Check for "Not Authenticated" error message
          String errorMessage = error.data['error'].toString();
          if (errorMessage == "Not Authenticated") {
            errorMessage = AppStrings.pleaseLoginOrMakeANewAccount;
          }
          failure = Failure(
            code: error.statusCode ?? 10203040,
            message: errorMessage,
          );
        } else if (error.data['message'] != null) {
          failure = Failure(
              message: error.data['message'].toString().isEmpty
                  ? AppStrings.unknownError
                  : error.data['message'].toString(),
              code: error.statusCode ?? 10203040);
        } else if (error.data['status'] != null) {
          if (error.data['status']['code'] == 422) {
            failure = Failure(
              message: error.data['results'].toString().isEmpty
                  ? AppStrings.unknownError
                  : error.data['results'].toString(),
              code: error.data['status']['code'],
            );
          } else {
            failure = Failure(
                message: error.data['status']['message'].toString().isEmpty
                    ? AppStrings.unknownError
                    : error.data['status']['message'].toString(),
                code: error.data['status']['code']);
          }
        } else if (error.data['results'] != null) {
          failure = Failure(
              message: error.data['results'].toString().isNotEmpty
                  ? error.data['results'].toString()
                  : AppStrings.unknownError,
              code: error.statusCode ?? 10203040);
        } else {
          failure = DataSourceNetworkError.unknownError.getFailure();
        }
      } else {
        failure = DataSourceNetworkError.unknownError.getFailure();
      }
    } else if (error is String) {
      // Handle error as string
      failure = Failure(message: error.toString(), code: 10203040);
    } else {
      // Unknown error type
      failure = DataSourceNetworkError.unknownError.getFailure();
    }
  }

  Failure failure =
      const Failure(message: AppStrings.unknownError, code: 10203040);
}
