import 'package:dartz/dartz.dart';
import 'package:flymefy/core/entity/notification.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/features/Home/data/requests/request.dart';
import 'package:flymefy/features/Home/domain/entity/flight_search.dart';
import 'package:flymefy/features/Home/domain/repository/home_repository.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/notification/data/request/request.dart';

import '../../../../core/helper/base_usecase.dart';

final class GetFlightsFromSearch
    implements BaseUseCase<FlightSearchRequest, DynamicResponse> {
  final HomeRepository _repository;

  GetFlightsFromSearch({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, DynamicResponse>> call(
      FlightSearchRequest paginationRequest) async {
    return await _repository.getFlightsFromSearch(paginationRequest);
  }
}