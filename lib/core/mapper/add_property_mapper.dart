import 'package:dio/dio.dart';

extension CitesEx on Response {
  // convert response to Cities
  // Cities toCities() {
  //   if (data['data'] == null) {
  //     return const Cities(cities: []);
  //   }

  //   return Cities(
  //     cities: (data['data'] as List).map((e) => City.fromJson(e)).toList(),
  //     pagination: data['pagination'] == null
  //         ? const Pagination()
  //         : Pagination.fromJson(data['pagination']),
  //   );
  // }

  // Regions toRegions() {
  //   if (data['data'] == null) {
  //     return const Regions(regions: []);
  //   }

  //   return Regions(
  //       regions:
  //           (data['data'] as List).map((e) => Region.fromJson(e)).toList());
  // }

  // Directions toDirection() {
  //   if (data['data'] == null) {
  //     return const Directions(directions: []);
  //   }

  //   return Directions(
  //       directions:
  //           (data['data'] as List).map((e) => Direction.fromJson(e)).toList());
  // }

  // UnitSettingDetails toUnitSettingDetails() {
  //   if (data['data'] == null) {
  //     return UnitSettingDetails();
  //   }

  //   return UnitSettingDetails(
  //       unitSettingDetails: (data['data'] as List)
  //           .map((e) => UnitSettingDetail.fromJson(e))
  //           .toList());
  // }

  // Catogeries toCatogeries() {
  //   if (data['data'] == null) {
  //     return const Catogeries(catogeries: []);
  //   }

  //   return Catogeries(
  //       catogeries: (data['data'] as List)
  //           .map((e) => CatogeryUnit.fromJson(e))
  //           .toList());
  // }

  // Amenities toAmenities() {
  //   if (data['data'] == null) {
  //     return const Amenities(amenities: []);
  //   }

  //   return Amenities(
  //       amenities:
  //           (data['data'] as List).map((e) => Amenity.fromJson(e)).toList());
  // }

  // Features toFeatures() {
  //   if (data['data'] == null) {
  //     return const Features(features: []);
  //   }

  //   return Features(
  //       features:
  //           (data['data'] as List).map((e) => Feature.fromJson(e)).toList());
  // }

  // Extras toExtras() {
  //   if (data['data'] == null) {
  //     return const Extras(extras: []);
  //   }

  //   return Extras(
  //       extras: (data['data'] as List).map((e) => Extra.fromJson(e)).toList());
  // }

  // OptionsExtras toExtrasOptions() {
  //   if (data['data'] == null) {
  //     return const OptionsExtras();
  //   }

  //   return OptionsExtras(
  //       optionExtras: (data['data'] as List)
  //           .map((e) => OptionExtra.fromJson(e))
  //           .toList());
  // }

  // Perperties toPerperties() {
  //   if (data['data'] == null) {
  //     return const Perperties(perperties: []);
  //   }

  //   return Perperties(
  //       pagination: data['pagination'] == null
  //           ? const Pagination()
  //           : Pagination.fromJson(data['pagination']),
  //       perperties: (data['data'] as List)
  //           .map((e) => UnitItemHomeTanent.fromJson(e))
  //           .toList());
  // }

  // PropertyDetails toPropertyDetails() {
  //   if (data['data'] == null) {
  //     return const PropertyDetails();
  //   }

  //   return PropertyDetails.fromMap(data['data']);
  // }

  // Calender toCalender() {
  //   if (data['data'] == null) {
  //     return const Calender();
  //   }

  //   return Calender.fromJson(data['data']);
  // }


}
