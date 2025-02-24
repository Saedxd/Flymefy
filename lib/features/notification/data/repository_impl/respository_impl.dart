import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flymefy/core/entity/notification.dart';
import 'package:flymefy/core/error/error_handler.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/mapper/general_mapper.dart';
import 'package:flymefy/core/network/api.dart';
import 'package:flymefy/core/resources_manager/constant.dart';
import 'package:flymefy/core/service/network_info.dart';
import 'package:flymefy/features/notification/data/request/request.dart';
import 'package:flymefy/features/notification/domain/repository/repository.dart';

import '../../../../core/error/permission.dart';
import '../../../auth/domain/entity/forget_password.dart';

class NotificationRepositoryImpls implements NotificationRepository {
  final ClientApi _apiClient;
  final NetworkInfo _networkInfo;

  NotificationRepositoryImpls(
      {required ClientApi apiClient, required NetworkInfo networkInfo})
      : _apiClient = apiClient,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, NotificationResponse>> getNotifications(
      GetNotificationsRequest paginationRequest) async {
    Response? response;
    try {
      response = await _apiClient.getApi(AppConstants.apiGetNotification,
          queryParameters: paginationRequest.toQueryParamter());

      if (response.isOperationSucceededApi()) {
        return Right(response.toNotificationDomain());
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      log(error.toString());
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  @override
  Future<Either<Failure, GeneralSuccessData>> readingNotification(
      RequestWithId input) async {
    Response? response;
    try {
      response = await _apiClient.postApi(AppConstants.apiReadNotification,
          queryParameters: input.toQueryParamter());

      if (response.isOperationSucceededApi()) {
        return Right(response.toGeneralSuccessData());
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }
}
