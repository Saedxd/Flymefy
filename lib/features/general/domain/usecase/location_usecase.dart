import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flymefy/core/helper/base_usecase.dart';
import 'package:flymefy/features/general/domain/entity/location.dart';
import 'package:flymefy/features/general/domain/repository/app_repository.dart';

import '../../../../core/error/failure.dart';
import '../../data/request/request.dart';

final class GetNearByPlacesUseCase
    implements BaseUseCase<LocationNearByRequest, LocationSearchData> {
  GetNearByPlacesUseCase({required AppRepository repository})
      : _repository = repository;
  final AppRepository _repository;

  @override
  Future<Either<Failure, LocationSearchData>> call(
      LocationNearByRequest locationNearByRequest) async {
    return await _repository.getNearByPlaces(locationNearByRequest);
  }
}

final class SearchPlacesUseCase
    implements BaseUseCase<LocationSearchRequest, LocationSearchData> {
  SearchPlacesUseCase({required AppRepository repository})
      : _repository = repository;
  final AppRepository _repository;
  @override
  Future<Either<Failure, LocationSearchData>> call(
      LocationSearchRequest locationSearchRequest) async {
    return await _repository.getAutoCompletePlaces(locationSearchRequest);
  }
}

final class GetLocationNameByLatLngUseCase
    implements BaseUseCase<LatLng, LocationSearch> {
  GetLocationNameByLatLngUseCase({required AppRepository repository})
      : _repository = repository;
  final AppRepository _repository;
  @override
  Future<Either<Failure, LocationSearch>> call(
      LatLng locationSearchRequest) async {
    return await _repository.getLocationNameByLatLng(locationSearchRequest);
  }
}
