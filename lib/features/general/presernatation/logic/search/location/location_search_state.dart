part of 'location_search_cubit.dart';

class LocationSearchState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;

  final LocationSearchData locationSearchData;

  const LocationSearchState({
    this.flowStateApp = FlowStateApp.draft,
    this.failure = const Failure.empty(),
    this.locationSearchData = const LocationSearchData(),
  });

  LocationSearchState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    LocationSearchData? locationSearchData,
  }) {
    return LocationSearchState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      locationSearchData: locationSearchData ?? this.locationSearchData,
    );
  }

  @override
  List<Object?> get props => [
        flowStateApp,
        failure,
        locationSearchData,
      ];
}
