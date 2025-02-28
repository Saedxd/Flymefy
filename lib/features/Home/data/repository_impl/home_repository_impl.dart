import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flymefy/core/entity/data_value.dart';
import 'package:flymefy/core/error/error_handler.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/error/permission.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/mapper/auth_mapper.dart';
import 'package:flymefy/core/mapper/general_mapper.dart';
import 'package:flymefy/core/network/api.dart';
import 'package:flymefy/core/resources_manager/constant.dart';
import 'package:flymefy/features/Home/data/requests/request.dart';
import 'package:flymefy/features/Home/domain/entity/flight_search.dart';
import 'package:flymefy/features/Home/domain/repository/home_repository.dart';
import 'package:flymefy/features/general/data/repostory_impl/repository_impl.dart';
import '../../../../../core/service/app_preferance.dart';
import '../../../../../core/service/network_info.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ClientApi _clientApi;
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;

  HomeRepositoryImpl(
      {required ClientApi clientApi,
      required AppPreferences appPreferences,
      required NetworkInfo networkInfo})
      : _clientApi = clientApi,
        _appPreferences = appPreferences,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, DynamicResponse>> getFlightsFromSearch(
      FlightSearchRequest flightSearchRequest) async {
    Response? response;
    try {
      response =
          await _clientApi.postApi(AppConstants.apiGetFlightsFromSearch, data: {
        "search": flightSearchRequest.toJson(),
      }, headers: {
        "X-Requested-With": "XMLHttpRequest",
        "Content-Type": "application/json",
        "Accept": "application/json",
      });

      if (response.isOperationSucceededApi()) {
        return Right(response.toFlightsSearchData());
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(
        ExceptionHandling.handleError(
          error,
          data: response != null ? response.data : '',
        ).failure,
      );
    }
  }
}
