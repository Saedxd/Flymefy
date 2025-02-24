// search location data from google map api
import 'package:equatable/equatable.dart';
import 'package:flymefy/core/resources_manager/constant.dart';

class LocationSearch extends Equatable {
  final String location;
  final String placeId;
  final String description;
  final double lat;
  final double lng;

  const LocationSearch({
    this.location = AppConstants.defaultEmptyString,
    this.placeId = AppConstants.defaultEmptyString,
    this.description = AppConstants.defaultEmptyString,
    this.lat = 31.636035409748047,
    this.lng = -7.864230136106096,
  });

  //copyWith
  LocationSearch copyWith({
    String? location,
    String? placeId,
    String? description,
    double? lat,
    double? lng,
  }) {
    return LocationSearch(
      location: location ?? this.location,
      placeId: placeId ?? this.placeId,
      description: description ?? this.description,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  //fromMap
  factory LocationSearch.fromMap(Map<String, dynamic> map) {
    return LocationSearch(
      location: map['location'] ?? AppConstants.defaultEmptyString,
      placeId: map['placeId'] ?? AppConstants.defaultEmptyString,
      description: map['description'] ?? AppConstants.defaultEmptyString,
      lat: map['lat'] ?? AppConstants.defaultEmptyDouble,
      lng: map['lng'] ?? AppConstants.defaultEmptyDouble,
    );
  }

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'location': location,
      'placeId': placeId,
      'description': description,
      'lat': lat,
      'lng': lng,
    };
  }

  @override
  List<Object?> get props => [location, placeId, description, lat, lng];
}

class LocationSearchData extends Equatable {
  final List<LocationSearch> locationSearch;
  final String status;

  const LocationSearchData({
    this.locationSearch = const [],
    this.status = AppConstants.defaultEmptyString,
  });

  //copyWith
  LocationSearchData copyWith({
    List<LocationSearch>? locationSearch,
    String? status,
  }) {
    return LocationSearchData(
      locationSearch: locationSearch ?? this.locationSearch,
      status: status ?? this.status,
    );
  }

  //fromMap
  factory LocationSearchData.fromMap(Map<String, dynamic> map) {
    return LocationSearchData(
      locationSearch: List<LocationSearch>.from(
          map['locationSearch']?.map((x) => LocationSearch.fromMap(x))),
      status: map['status'] ?? AppConstants.defaultEmptyString,
    );
  }

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'locationSearch': locationSearch.map((x) => x.toMap()).toList(),
      'status': status,
    };
  }

  @override
  List<Object?> get props => [locationSearch, status];
}
