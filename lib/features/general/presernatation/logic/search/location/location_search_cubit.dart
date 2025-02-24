import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/helper/function.dart';
import 'package:flymefy/features/general/data/request/request.dart';
import 'package:flymefy/features/general/domain/entity/location.dart';
import 'package:flymefy/features/general/domain/usecase/location_usecase.dart';

import '../../../../../../core/error/failure.dart';

part 'location_search_state.dart';

class LocationSearchCubit extends Cubit<LocationSearchState> {
  final GetNearByPlacesUseCase _getNearByPlacesUseCase;
  final SearchPlacesUseCase _searchPlacesUseCase;
  LocationSearchCubit({
    required GetNearByPlacesUseCase getNearByPlacesUseCase,
    required SearchPlacesUseCase searchPlacesUseCase,
  })  : _searchPlacesUseCase = searchPlacesUseCase,
        _getNearByPlacesUseCase = getNearByPlacesUseCase,
        super(const LocationSearchState());

  void getLocations(String value) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _searchPlacesUseCase(LocationSearchRequest(value));
    delayForCreateNewStatus();
    result.fold(
        (failure) => emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
        (data) => emit(state.copyWith(
            flowStateApp: FlowStateApp.normal, locationSearchData: data)));
  }

  void getNearByLocation(
    LatLng latLng,
  ) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));

    final result =
        await _getNearByPlacesUseCase(LocationNearByRequest('', latLng));

    delayForCreateNewStatus();
    result.fold(
        (failure) => emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
        (data) => emit(state.copyWith(
            flowStateApp: FlowStateApp.normal, locationSearchData: data)));
  }
}
