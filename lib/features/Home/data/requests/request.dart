import 'dart:io';

import 'package:flymefy/features/auth/domain/entity/register.dart';

class FlightSearchRequest {
  const FlightSearchRequest({
    this.adults = 2,
    this.children = 2,
    this.infants = 1,
    this.nonstop = 0,
    this.airline = '',
    this.solutions = 0,
    this.searchAirLegs = const [],
  });

  final int adults;
  final int children;
  final int infants;
  final int nonstop;
  final String airline;
  final int solutions;
  final List<SearchAirLegs> searchAirLegs;

  Map<String, dynamic> toJson() {
    return {
      'adults': adults,
      'children': children,
      'infants': infants,
      'nonstop': nonstop,
      'airline': airline,
      'solutions': solutions,
      "searchAirLegs": searchAirLegs.map((e) => e.toJson()).toList(),
    };
  }
}

class SearchAirLegs {
  SearchAirLegs({
    this.cabinClass = '',
    this.departureDate = '',
    this.origin = '',
    this.destination = '',
    this.airline = '',
  });

  final String cabinClass;
  final String departureDate;
  final String origin;
  final String destination;
  final String airline;

  Map<String, dynamic> toJson() {
    return {
      'cabinClass': cabinClass,
      'departureDate': departureDate,
      'origin': origin,
      'destination': destination,
      'airline': airline,
    };
  }
}


class GetCitysAirportsRequest {
  const GetCitysAirportsRequest({
    this.query = '',
  });

  final String query;

  Map<String, dynamic> toJson() {
    return {
      'query': query,
    };
  }
}