part of 'flight_book_cubit.dart';

enum FlightType { oneWay, roundTrip, multiCity }

class FlightBookState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final FlightSearchRequest flightSearchRequest;
  final DynamicResponse flightData;
  final Flights flights;
  final OneWayData oneWayData;
  final RoundTrip roundTrip;
  final CityAirportsList cityAirportsList;
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final MultiCity multiCity;
  final FlightType currentSelectedType;
  final List<bool> openedTickets;

  FlightBookState({
    this.failure = const Failure.empty(),
    this.flowStateApp = FlowStateApp.draft,
    this.flightSearchRequest = const FlightSearchRequest(),
    this.flights = const Flights(),
    this.roundTrip = const RoundTrip(),
    this.oneWayData = const OneWayData(),
    this.cityAirportsList = const CityAirportsList(),
    this.calendarFormat = CalendarFormat.month,
    DateTime? focusedDay,
    this.multiCity = const MultiCity(),
    this.currentSelectedType = FlightType.oneWay,
    this.openedTickets = const [],
    this.flightData = const DynamicResponse(),
  }) : focusedDay = focusedDay ?? DateTime.now().add(Duration(days: 1));

  FlightBookState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    FlightSearchRequest? flightSearchRequest,
    Flights? flights,
    OneWayData? oneWayData,
    RoundTrip? roundTrip,
    CalendarFormat? calendarFormat,
    DateTime? focusedDay,
    MultiCity? multiCity,
    FlightType? currentSelectedType,
    List<bool>? openedTickets,
    DynamicResponse? flightData,
    CityAirportsList? cityAirportsList,
  }) {
    return FlightBookState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      flightSearchRequest: flightSearchRequest ?? this.flightSearchRequest,
      flights: flights ?? this.flights,
      oneWayData: oneWayData ?? this.oneWayData,
      roundTrip: roundTrip ?? this.roundTrip,
      calendarFormat: calendarFormat ?? this.calendarFormat,
      focusedDay: focusedDay ?? this.focusedDay,
      multiCity: multiCity ?? this.multiCity,
      currentSelectedType: currentSelectedType ?? this.currentSelectedType,
      openedTickets: openedTickets ?? this.openedTickets,
      flightData: flightData ?? this.flightData,
      cityAirportsList: cityAirportsList ?? this.cityAirportsList,
    );
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        flightSearchRequest,
        flights,
        oneWayData,
        roundTrip,
        calendarFormat,
        focusedDay,
        multiCity,
        currentSelectedType,
        openedTickets,
        flightData,
        cityAirportsList,
      ];
}

class OneWayData extends Equatable {
  final CityAirport flightDetailsFrom;
  final CityAirport flightDetailsTo;

  final String dateWhen;
  final int adults;
  final int children;
  final int infants;
  final String classType;
  int get totalTravellers => adults + children + infants;

  const OneWayData({
    this.dateWhen = "",
    this.classType = "Economy",
    this.flightDetailsFrom = const CityAirport(),
    this.flightDetailsTo = const CityAirport(),
    this.adults = 1,
    this.children = 0,
    this.infants = 0,
  });

  @override
  List<Object?> get props => [
        dateWhen,
        classType,
        flightDetailsFrom,
        flightDetailsTo,
        adults,
        children,
        infants
      ];
  //copy with
  OneWayData copyWith({
    String? dateWhen,
    String? classType,
    CityAirport? flightDetailsFrom,
    CityAirport? flightDetailsTo,
    int? adults,
    int? children,
    int? infants,
  }) {
    return OneWayData(
        dateWhen: dateWhen ?? this.dateWhen,
        classType: classType ?? this.classType,
        flightDetailsFrom: flightDetailsFrom ?? this.flightDetailsFrom,
        flightDetailsTo: flightDetailsTo ?? this.flightDetailsTo,
        adults: adults ?? this.adults,
        children: children ?? this.children,
        infants: infants ?? this.infants);
  }
}

class RoundTrip extends Equatable {
  final CityAirport flightDetailsFrom;
  final CityAirport flightDetailsTo;

  final String departureDate;
  final String arrivalDate;
  final String classType;
  final int adults;
  final int children;
  final int infants;
  int get totalTravellers => adults + children + infants;

  const RoundTrip({
    this.departureDate = "",
    this.arrivalDate = "",
    this.classType = "Economy",
    this.flightDetailsFrom = const CityAirport(),
    this.flightDetailsTo = const CityAirport(),
    this.adults = 1,
    this.children = 0,
    this.infants = 0,
  });

  @override
  List<Object?> get props => [
        departureDate,
        arrivalDate,
        classType,
        flightDetailsFrom,
        flightDetailsTo,
        adults,
        children,
        infants
      ];

//copywith
  RoundTrip copyWith({
    String? departureDate,
    String? arrivalDate,
    int? numTravellers,
    String? classType,
    CityAirport? flightDetailsFrom,
    CityAirport? flightDetailsTo,
    int? adults,
    int? children,
    int? infants,
  }) {
    return RoundTrip(
        departureDate: departureDate ?? this.departureDate,
        arrivalDate: arrivalDate ?? this.arrivalDate,
        classType: classType ?? this.classType,
        flightDetailsFrom: flightDetailsFrom ?? this.flightDetailsFrom,
        flightDetailsTo: flightDetailsTo ?? this.flightDetailsTo,
        adults: adults ?? this.adults,
        children: children ?? this.children,
        infants: infants ?? this.infants);
  }
}

class MultiCity extends Equatable {
  final List<CityEntry> cities;
  final int adults;
  final int children;
  final int infants;
  final String classType;

  const MultiCity({
    this.cities = const [],
    this.adults = 1,
    this.children = 0,
    this.infants = 0,
    this.classType = "Economy",
  });

  int get totalTravellers => adults + children + infants;

  MultiCity copyWith({
    List<CityEntry>? cities,
    int? adults,
    int? children,
    int? infants,
    String? classType,
  }) {
    return MultiCity(
      cities: cities != null
          ? List<CityEntry>.from(cities)
          : this.cities, // 🔥 Ensures a new list
      adults: adults ?? this.adults,
      infants: infants ?? this.infants,
      children: children ?? this.children,
      classType: classType ?? this.classType,
    );
  }

  @override
  List<Object> get props => [cities, adults, children, infants, classType];
}

class CityEntry extends Equatable {
  final CityAirport from;
  final CityAirport to;
  final String date;

  const CityEntry({
    required this.from,
    required this.to,
    required this.date,
  });

  CityEntry copyWith({CityAirport? from, CityAirport? to, String? date}) {
    return CityEntry(
      from: from ?? this.from,
      to: to ?? this.to,
      date: date ?? this.date,
    );
  }

  @override
  List<Object> get props => [from, to, date];
}

//     "N4i15ijyNqB3WzXaF2+kUG7qTrQPWNnIyoWB0U7BVKLyGPo3OkCP2SnMOWcN2lKdH251onhUuqF+mgugsKDDpyOIcvE2yNj/QnuLX8liDEGSak7RwC1ZLL6S4PyfK3GpcXZ/BQGnTfWN0ksCstBZ+Lxdx2SvC3FlCtMEWfFVk6NYg4yTZpWtCF8lVRU+D/WRft3jVd47oXLDiCAqsgSnIoKfw8L8WZN062lN7BLxNidCSslihsX5++EVhVUlC28/3Vch4ERA53Pmn6GDPXJhKrzl2Sl1S5Dsp2SNQ27IeJo2qkuKZT1k9EzoMCmMsx2S": {
//         "solutionKey": "6316907b9b815e31211c5175ef37bbc3",
//         "solutionId": "N4i15ijyNqB3WzXaF2+kUG7qTrQPWNnIyoWB0U7BVKLyGPo3OkCP2SnMOWcN2lKdH251onhUuqF+mgugsKDDpyOIcvE2yNj/QnuLX8liDEGSak7RwC1ZLL6S4PyfK3GpcXZ/BQGnTfWN0ksCstBZ+Lxdx2SvC3FlCtMEWfFVk6NYg4yTZpWtCF8lVRU+D/WRft3jVd47oXLDiCAqsgSnIoKfw8L8WZN062lN7BLxNidCSslihsX5++EVhVUlC28/3Vch4ERA53Pmn6GDPXJhKrzl2Sl1S5Dsp2SNQ27IeJo2qkuKZT1k9EzoMCmMsx2S",
//         "fareType": "PRIVATE",
//         "currency": "USD",
//         "adtFare": 80.52,
//         "adtTax": 9.51,
//         "chdFare": 0,
//         "chdTax": 0,
//         "qCharge": 0,
//         "tktFee": 0,
//         "platformServiceFee": 0,
//         "comments": null,
//         "journeys": {
//             "journey_0": {
//                 "93d138aca77e20eebdb1acf1fa09ff81": {
//                     "flightId": "93d138aca77e20eebdb1acf1fa09ff81",
//                     "journeyTime": 260,
//                     "transferCount": 0,
//                     "lastTktTime": null,
//                     "segments": {
//                         "9f6832f21d3fc190a7ff00eecf004a20": {
//                             "segmentId": "9f6832f21d3fc190a7ff00eecf004a20",
//                             "airline": {
//                                 "id": 231,
//                                 "name": "wizz air uk",
//                                 "iata": "w9",
//                                 "image": "https://images.kiwi.com/airlines/64/W9.png",
//                                 "created_at": "2025-03-03T21:53:58.000000Z",
//                                 "updated_at": "2025-03-03T21:53:58.000000Z"
//                             },
//                             "flightNum": "5730",
//                             "equipment": {
//                                 "id": 20,
//                                 "name": "airbus industrie a318/319/320/321",
//                                 "iata": "32s",
//                                 "created_at": "2025-03-03T21:56:56.000000Z",
//                                 "updated_at": "2025-03-03T21:56:56.000000Z"
//                             },
//                             "cabinClass": "ECONOMY",
//                             "bookingCode": "OP",
//                             "availabilityCount": 1,
//                             "departure": {
//                                 "id": 2167,
//                                 "name": "istanbul ataturk airport",
//                                 "iata": "ist",
//                                 "state_name": "istanbul",
//                                 "state_code": "ist",
//                                 "country_name": "turkey",
//                                 "country_code": "tr",
//                                 "created_at": "2025-02-25T22:25:57.000000Z",
//                                 "updated_at": "2025-02-26T07:32:16.000000Z"
//                             },
//                             "arrival": {
//                                 "id": 3592,
//                                 "name": "london gatwick airport",
//                                 "iata": "lgw",
//                                 "state_name": "n/a",
//                                 "state_code": null,
//                                 "country_name": "united kingdom",
//                                 "country_code": "gb",
//                                 "created_at": "2025-02-25T22:28:03.000000Z",
//                                 "updated_at": "2025-02-25T22:28:03.000000Z"
//                             },
//                             "departureTerminal": null,
//                             "arrivalTerminal": "0",
//                             "departureDate": 1743083100000,
//                             "arrivalDate": 1743087900000,
//                             "flightTime": 260,
//                             "stayTime": null,
//                             "codeShare": "N",
//                             "opFltNo": null,
//                             "opFltAirline": null,
//                             "stopover": null,
//                             "fareBasis": "YOW",
//                             "strDepartureDate": "2025-03-27",
//                             "strDepartureTime": "21:45",
//                             "strArrivalDate": "2025-03-27",
//                             "strArrivalTime": "23:05"
//                         }
//                     }
//                 }
//             }
//         },
//         "fareRule": null,
//         "rule": null,
//         "platingCarrier": "W9",
//         "prices": null,
//         "merchantFee": 0,
//         "adults": 1,
//         "children": 0,
//         "infants": 0,
//         "baggageMap": {
//             "ADT": [
//                 {
//                     "segmentIndexList": [
//                         1
//                     ],
//                     "baggageAmount": null,
//                     "baggageWeight": null,
//                     "carryOnAmount": null,
//                     "carryOnWeight": null,
//                     "carryOnSize": null
//                 }
//             ]
//         },
//         "miniRuleMap": {
//             "ADT": [
//                 {
//                     "segmentIndex": [
//                         1
//                     ],
//                     "miniRules": [
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         }
//                     ]
//                 }
//             ]
//         },
//         "afterSaleRule": null
//     },
//   
//     "KCwa3dpN8sWOif7cxiZ02kAx53sZoZ7vQLwnJGYjRkcO7y0iHqmWEaeW63ISvc6RA5CoIpX5ivBL8b4C/9yj/QKuJywzqRnk6x2LrBb0/ZxYNfuWZ+G1pVL21tA6OZWcCsNKsjZ+eC6EmMhOhPO/B7xQtnOXMffUMu7j+0l+vp4cJ9ssVvSEIkCw2QzkCIavWqhA/0v+gYo/OdwQUj0LuMbhQjKTdcslkOxEZ66XgpljDpD5xYEfqvBXhV1or0j9U5y38mb2Z6ZhLFzULmiYfMstNPj5YRBAzj7/T/M/Jt+e1t05aaRj2FbRDs3FNkVK": {
//         "solutionKey": "a78ce8fca560288d3e0b4258e6f27323",
//         "solutionId": "KCwa3dpN8sWOif7cxiZ02kAx53sZoZ7vQLwnJGYjRkcO7y0iHqmWEaeW63ISvc6RA5CoIpX5ivBL8b4C/9yj/QKuJywzqRnk6x2LrBb0/ZxYNfuWZ+G1pVL21tA6OZWcCsNKsjZ+eC6EmMhOhPO/B7xQtnOXMffUMu7j+0l+vp4cJ9ssVvSEIkCw2QzkCIavWqhA/0v+gYo/OdwQUj0LuMbhQjKTdcslkOxEZ66XgpljDpD5xYEfqvBXhV1or0j9U5y38mb2Z6ZhLFzULmiYfMstNPj5YRBAzj7/T/M/Jt+e1t05aaRj2FbRDs3FNkVK",
//         "fareType": "PRIVATE",
//         "currency": "USD",
//         "adtFare": 57.97,
//         "adtTax": 18.88,
//         "chdFare": 0,
//         "chdTax": 0,
//         "qCharge": 0,
//         "tktFee": 0,
//         "platformServiceFee": 0,
//         "comments": null,
//         "journeys": {
//             "journey_0": {
//                 "e8840d4614d365fe8a41327075c97cca": {
//                     "flightId": "e8840d4614d365fe8a41327075c97cca",
//                     "journeyTime": 265,
//                     "transferCount": 0,
//                     "lastTktTime": null,
//                     "segments": {
//                         "01781a7f480705d70dd1bf5613e9db36": {
//                             "segmentId": "01781a7f480705d70dd1bf5613e9db36",
//                             "airline": {
//                                 "id": 744,
//                                 "name": "valuair",
//                                 "iata": "vf",
//                                 "image": "https://images.kiwi.com/airlines/64/VF.png",
//                                 "created_at": "2025-03-03T21:54:00.000000Z",
//                                 "updated_at": "2025-03-03T21:54:00.000000Z"
//                             },
//                             "flightNum": "1987",
//                             "equipment": {
//                                 "id": 20,
//                                 "name": "airbus industrie a318/319/320/321",
//                                 "iata": "32s",
//                                 "created_at": "2025-03-03T21:56:56.000000Z",
//                                 "updated_at": "2025-03-03T21:56:56.000000Z"
//                             },
//                             "cabinClass": "ECONOMY",
//                             "bookingCode": "W",
//                             "availabilityCount": 9,
//                             "departure": {
//                                 "id": 2166,
//                                 "name": "sabiha gokcen international airport",
//                                 "iata": "saw",
//                                 "state_name": "istanbul",
//                                 "state_code": "ist",
//                                 "country_name": "turkey",
//                                 "country_code": "tr",
//                                 "created_at": "2025-02-25T22:25:57.000000Z",
//                                 "updated_at": "2025-02-25T22:25:57.000000Z"
//                             },
//                             "arrival": {
//                                 "id": 3591,
//                                 "name": "stansted airport",
//                                 "iata": "stn",
//                                 "state_name": "n/a",
//                                 "state_code": null,
//                                 "country_name": "united kingdom",
//                                 "country_code": "gb",
//                                 "created_at": "2025-02-25T22:28:03.000000Z",
//                                 "updated_at": "2025-02-25T22:28:03.000000Z"
//                             },
//                             "departureTerminal": null,
//                             "arrivalTerminal": null,
//                             "departureDate": 1743041400000,
//                             "arrivalDate": 1743046500000,
//                             "flightTime": 265,
//                             "stayTime": null,
//                             "codeShare": "N",
//                             "opFltNo": null,
//                             "opFltAirline": null,
//                             "stopover": null,
//                             "fareBasis": "YOW",
//                             "strDepartureDate": "2025-03-27",
//                             "strDepartureTime": "10:10",
//                             "strArrivalDate": "2025-03-27",
//                             "strArrivalTime": "11:35"
//                         }
//                     }
//                 }
//             }
//         },
//         "fareRule": null,
//         "rule": null,
//         "platingCarrier": "VF",
//         "prices": null,
//         "merchantFee": 0,
//         "adults": 1,
//         "children": 0,
//         "infants": 0,
//         "baggageMap": {
//             "ADT": [
//                 {
//                     "segmentIndexList": [
//                         1
//                     ],
//                     "baggageAmount": "0PC",
//                     "baggageWeight": null,
//                     "carryOnAmount": "1PC",
//                     "carryOnWeight": "8KG",
//                     "carryOnSize": null
//                 }
//             ]
//         },
//         "miniRuleMap": {
//             "ADT": [
//                 {
//                     "segmentIndex": [
//                         1
//                     ],
//                     "miniRules": [
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 1,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": 76.09,
//                             "currencyCode": "USD",
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 1,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": 76.09,
//                             "currencyCode": "USD",
//                             "percent": null,
//                             "baseType": null
//                         }
//                     ]
//                 }
//             ]
//         },
//         "afterSaleRule": null
//     },
//     "VkZcaITU5WKVNZLDCBoXc+vmzLD9uEwtrVz7mW5KlFHvaWPefR8L5QF87rvxuXaZMIu4ahiedPjy/z4i7LwZLnYbiHI+ibJ+YB9AqYmCyODubY3dh5Wc5g3KV44aCFOFbaa68u+hdj6JMPC49ZXm6TqrqPsK28vpfBjgj/UfhOEZ4/YEhScnGeXqhFJ9fD8wNuXKFxnFeXtU1cTgdsrDzpTbQdRABa2IyT96JdTM6g4lTDXPHbDWtg8HcCmNpgb9JhYs6ziphdKwfSkIe8uq0S/Wb2Zy5ht67+HyoCFUdPq5GLKb2xc5LVBhMuPUUjykVeCYtY8PCNVrSTLKyxgEtFnNStNP86vgSDzQXdIXnIpufQEgzd7fCyeim6a3aVCPUvlme1QSHCYoqk09vl3P9A==": {
//         "solutionKey": "8b4174fce864347ef75051c8b9d5c6e5",
//         "solutionId": "VkZcaITU5WKVNZLDCBoXc+vmzLD9uEwtrVz7mW5KlFHvaWPefR8L5QF87rvxuXaZMIu4ahiedPjy/z4i7LwZLnYbiHI+ibJ+YB9AqYmCyODubY3dh5Wc5g3KV44aCFOFbaa68u+hdj6JMPC49ZXm6TqrqPsK28vpfBjgj/UfhOEZ4/YEhScnGeXqhFJ9fD8wNuXKFxnFeXtU1cTgdsrDzpTbQdRABa2IyT96JdTM6g4lTDXPHbDWtg8HcCmNpgb9JhYs6ziphdKwfSkIe8uq0S/Wb2Zy5ht67+HyoCFUdPq5GLKb2xc5LVBhMuPUUjykVeCYtY8PCNVrSTLKyxgEtFnNStNP86vgSDzQXdIXnIpufQEgzd7fCyeim6a3aVCPUvlme1QSHCYoqk09vl3P9A==",
//         "fareType": "PRIVATE",
//         "currency": "USD",
//         "adtFare": 241.28,
//         "adtTax": 22.17,
//         "chdFare": 0,
//         "chdTax": 0,
//         "qCharge": 0,
//         "tktFee": 0,
//         "platformServiceFee": 0,
//         "comments": null,
//         "journeys": {
//             "journey_0": {
//                 "4afffb2921e980e2989fcd0a76614730": {
//                     "flightId": "4afffb2921e980e2989fcd0a76614730",
//                     "journeyTime": 335,
//                     "transferCount": 1,
//                     "lastTktTime": null,
//                     "segments": {
//                         "6b73c859d6c02ce8bdd4bf4d5f789079": {
//                             "segmentId": "6b73c859d6c02ce8bdd4bf4d5f789079",
//                             "airline": {
//                                 "id": 744,
//                                 "name": "valuair",
//                                 "iata": "vf",
//                                 "image": "https://images.kiwi.com/airlines/64/VF.png",
//                                 "created_at": "2025-03-03T21:54:00.000000Z",
//                                 "updated_at": "2025-03-03T21:54:00.000000Z"
//                             },
//                             "flightNum": "3004",
//                             "equipment": {
//                                 "id": 54,
//                                 "name": "boeing 737",
//                                 "iata": "737",
//                                 "created_at": "2025-03-03T21:56:56.000000Z",
//                                 "updated_at": "2025-03-03T21:56:56.000000Z"
//                             },
//                             "cabinClass": "ECONOMY",
//                             "bookingCode": "D",
//                             "availabilityCount": 4,
//                             "departure": {
//                                 "id": 2166,
//                                 "name": "sabiha gokcen international airport",
//                                 "iata": "saw",
//                                 "state_name": "istanbul",
//                                 "state_code": "ist",
//                                 "country_name": "turkey",
//                                 "country_code": "tr",
//                                 "created_at": "2025-02-25T22:25:57.000000Z",
//                                 "updated_at": "2025-02-25T22:25:57.000000Z"
//                             },
//                             "arrival": {
//                                 "id": 2510,
//                                 "name": "esenboga airport",
//                                 "iata": "esb",
//                                 "state_name": "ankara",
//                                 "state_code": "ank",
//                                 "country_name": "turkey",
//                                 "country_code": "tr",
//                                 "created_at": "2025-02-25T22:26:03.000000Z",
//                                 "updated_at": "2025-02-25T22:26:03.000000Z"
//                             },
//                             "departureTerminal": null,
//                             "arrivalTerminal": null,
//                             "departureDate": 1743050700000,
//                             "arrivalDate": 1743054600000,
//                             "flightTime": 65,
//                             "stayTime": null,
//                             "codeShare": "N",
//                             "opFltNo": null,
//                             "opFltAirline": null,
//                             "stopover": null,
//                             "fareBasis": "YOW",
//                             "strDepartureDate": "2025-03-27",
//                             "strDepartureTime": "12:45",
//                             "strArrivalDate": "2025-03-27",
//                             "strArrivalTime": "13:50"
//                         },
//                         "cccf9d7220699b4c50f541d78204db90": {
//                             "segmentId": "cccf9d7220699b4c50f541d78204db90",
//                             "airline": {
//                                 "id": 744,
//                                 "name": "valuair",
//                                 "iata": "vf",
//                                 "image": "https://images.kiwi.com/airlines/64/VF.png",
//                                 "created_at": "2025-03-03T21:54:00.000000Z",
//                                 "updated_at": "2025-03-03T21:54:00.000000Z"
//                             },
//                             "flightNum": "531",
//                             "equipment": {
//                                 "id": 54,
//                                 "name": "boeing 737",
//                                 "iata": "737",
//                                 "created_at": "2025-03-03T21:56:56.000000Z",
//                                 "updated_at": "2025-03-03T21:56:56.000000Z"
//                             },
//                             "cabinClass": "ECONOMY",
//                             "bookingCode": "O",
//                             "availabilityCount": 4,
//                             "departure": {
//                                 "id": 2510,
//                                 "name": "esenboga airport",
//                                 "iata": "esb",
//                                 "state_name": "ankara",
//                                 "state_code": "ank",
//                                 "country_name": "turkey",
//                                 "country_code": "tr",
//                                 "created_at": "2025-02-25T22:26:03.000000Z",
//                                 "updated_at": "2025-02-25T22:26:03.000000Z"
//                             },
//                             "arrival": {
//                                 "id": 3591,
//                                 "name": "stansted airport",
//                                 "iata": "stn",
//                                 "state_name": "n/a",
//                                 "state_code": null,
//                                 "country_name": "united kingdom",
//                                 "country_code": "gb",
//                                 "created_at": "2025-02-25T22:28:03.000000Z",
//                                 "updated_at": "2025-02-25T22:28:03.000000Z"
//                             },
//                             "departureTerminal": null,
//                             "arrivalTerminal": null,
//                             "departureDate": 1743139500000,
//                             "arrivalDate": 1743144900000,
//                             "flightTime": 270,
//                             "stayTime": null,
//                             "codeShare": "N",
//                             "opFltNo": null,
//                             "opFltAirline": null,
//                             "stopover": null,
//                             "fareBasis": "YOW",
//                             "strDepartureDate": "2025-03-28",
//                             "strDepartureTime": "13:25",
//                             "strArrivalDate": "2025-03-28",
//                             "strArrivalTime": "14:55"
//                         }
//                     }
//                 }
//             }
//         },
//         "fareRule": null,
//         "rule": null,
//         "platingCarrier": "VF",
//         "prices": null,
//         "merchantFee": 0,
//         "adults": 1,
//         "children": 0,
//         "infants": 0,
//         "baggageMap": {
//             "ADT": [
//                 {
//                     "segmentIndexList": [
//                         1
//                     ],
//                     "baggageAmount": "0PC",
//                     "baggageWeight": null,
//                     "carryOnAmount": "1PC",
//                     "carryOnWeight": "8KG",
//                     "carryOnSize": null
//                 },
//                 {
//                     "segmentIndexList": [
//                         2
//                     ],
//                     "baggageAmount": "0PC",
//                     "baggageWeight": null,
//                     "carryOnAmount": "1PC",
//                     "carryOnWeight": "8KG",
//                     "carryOnSize": null
//                 }
//             ]
//         },
//         "miniRuleMap": {
//             "ADT": [
//                 {
//                     "segmentIndex": [
//                         1,
//                         2
//                     ],
//                     "miniRules": [
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 1,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": 260.82,
//                             "currencyCode": "USD",
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 1,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": 260.82,
//                             "currencyCode": "USD",
//                             "percent": null,
//                             "baseType": null
//                         }
//                     ]
//                 }
//             ]
//         },
//         "afterSaleRule": null
//     },
//     "mnVrnejlZxGyfzK2JGI3bpnRlh6UtPkQAoeDIoeX6zC6Od9reP9cN9ZD15/FAtQwucb3FICf3tWmOPj3f6MkcjC78yyfxho1dYDbtpoydoxvwYBEMzXdmlIWeDqqIohkhgvaZufxtTXEcBFECNFjzhxYTKthHuVPVYc2lQKhgeeZj+NR5mxdHJkMvf5ttoGu1hJfxOxcVd7ghlLTdP2Fy3u3v+ekAV7/lxwMO62fYRbOAhsNFppZH3DT25iMtMt5WQ1o0gzKs0vQclufzfMZczVhhegX2QkdvRiIN8JXJogkhOiO3SLJhpvJ2As5Ld+H": {
//         "solutionKey": "ed154569e42cfb86feb354c583be5684",
//         "solutionId": "mnVrnejlZxGyfzK2JGI3bpnRlh6UtPkQAoeDIoeX6zC6Od9reP9cN9ZD15/FAtQwucb3FICf3tWmOPj3f6MkcjC78yyfxho1dYDbtpoydoxvwYBEMzXdmlIWeDqqIohkhgvaZufxtTXEcBFECNFjzhxYTKthHuVPVYc2lQKhgeeZj+NR5mxdHJkMvf5ttoGu1hJfxOxcVd7ghlLTdP2Fy3u3v+ekAV7/lxwMO62fYRbOAhsNFppZH3DT25iMtMt5WQ1o0gzKs0vQclufzfMZczVhhegX2QkdvRiIN8JXJogkhOiO3SLJhpvJ2As5Ld+H",
//         "fareType": "PRIVATE",
//         "currency": "USD",
//         "adtFare": 47.64,
//         "adtTax": 9.51,
//         "chdFare": 0,
//         "chdTax": 0,
//         "qCharge": 0,
//         "tktFee": 0,
//         "platformServiceFee": 0,
//         "comments": null,
//         "journeys": {
//             "journey_0": {
//                 "704d9603d666d1cc9893b194aea18028": {
//                     "flightId": "704d9603d666d1cc9893b194aea18028",
//                     "journeyTime": 195,
//                     "transferCount": 0,
//                     "lastTktTime": null,
//                     "segments": {
//                         "4a43a3b281783073c4287ab11254d1fc": {
//                             "segmentId": "4a43a3b281783073c4287ab11254d1fc",
//                             "airline": {
//                                 "id": 231,
//                                 "name": "wizz air uk",
//                                 "iata": "w9",
//                                 "image": "https://images.kiwi.com/airlines/64/W9.png",
//                                 "created_at": "2025-03-03T21:53:58.000000Z",
//                                 "updated_at": "2025-03-03T21:53:58.000000Z"
//                             },
//                             "flightNum": "5328",
//                             "equipment": {
//                                 "id": 20,
//                                 "name": "airbus industrie a318/319/320/321",
//                                 "iata": "32s",
//                                 "created_at": "2025-03-03T21:56:56.000000Z",
//                                 "updated_at": "2025-03-03T21:56:56.000000Z"
//                             },
//                             "cabinClass": "ECONOMY",
//                             "bookingCode": "PR",
//                             "availabilityCount": 1,
//                             "departure": {
//                                 "id": 2167,
//                                 "name": "istanbul ataturk airport",
//                                 "iata": "ist",
//                                 "state_name": "istanbul",
//                                 "state_code": "ist",
//                                 "country_name": "turkey",
//                                 "country_code": "tr",
//                                 "created_at": "2025-02-25T22:25:57.000000Z",
//                                 "updated_at": "2025-02-26T07:32:16.000000Z"
//                             },
//                             "arrival": {
//                                 "id": 3593,
//                                 "name": "london luton airport",
//                                 "iata": "ltn",
//                                 "state_name": "n/a",
//                                 "state_code": null,
//                                 "country_name": "united kingdom",
//                                 "country_code": "gb",
//                                 "created_at": "2025-02-25T22:28:03.000000Z",
//                                 "updated_at": "2025-02-25T22:28:03.000000Z"
//                             },
//                             "departureTerminal": null,
//                             "arrivalTerminal": null,
//                             "departureDate": 1743087600000,
//                             "arrivalDate": 1743088500000,
//                             "flightTime": 195,
//                             "stayTime": null,
//                             "codeShare": "N",
//                             "opFltNo": null,
//                             "opFltAirline": null,
//                             "stopover": null,
//                             "fareBasis": "YOW",
//                             "strDepartureDate": "2025-03-27",
//                             "strDepartureTime": "23:00",
//                             "strArrivalDate": "2025-03-27",
//                             "strArrivalTime": "23:15"
//                         }
//                     }
//                 }
//             }
//         },
//         "fareRule": null,
//         "rule": null,
//         "platingCarrier": "W9",
//         "prices": null,
//         "merchantFee": 0,
//         "adults": 1,
//         "children": 0,
//         "infants": 0,
//         "baggageMap": {
//             "ADT": [
//                 {
//                     "segmentIndexList": [
//                         1
//                     ],
//                     "baggageAmount": null,
//                     "baggageWeight": null,
//                     "carryOnAmount": null,
//                     "carryOnWeight": null,
//                     "carryOnSize": null
//                 }
//             ]
//         },
//         "miniRuleMap": {
//             "ADT": [
//                 {
//                     "segmentIndex": [
//                         1
//                     ],
//                     "miniRules": [
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         }
//                     ]
//                 }
//             ]
//         },
//         "afterSaleRule": null
//     },
//     "KCwa3dpN8sWOif7cxiZ02kAx53sZoZ7vQLwnJGYjRkcO7y0iHqmWEaeW63ISvc6RA5CoIpX5ivBL8b4C/9yj/esBPK/EDc7upZqWJQ0AA86HRg8//834lQ0OF3oz+jbrxIWJdHjbyJO026EY/kkVM6Y0sYqq3qhXsweOsfmXsEV3yoJy+AGwQ2BTDssv/TETrSPIxd1ksocAHZ16UDsKKh2tOUdkRJyC6mHXN56kKsti+brs0yEPErNb0h1r8dHn7dXePaxGNFg0vAAbQNE12gnhX/ZqZRaHPY83y9yIuZp2KbZLV2hyph9CFmjDgI1u": {
//         "solutionKey": "815c47eb94be3a5c0d34885a40e888cb",
//         "solutionId": "KCwa3dpN8sWOif7cxiZ02kAx53sZoZ7vQLwnJGYjRkcO7y0iHqmWEaeW63ISvc6RA5CoIpX5ivBL8b4C/9yj/esBPK/EDc7upZqWJQ0AA86HRg8//834lQ0OF3oz+jbrxIWJdHjbyJO026EY/kkVM6Y0sYqq3qhXsweOsfmXsEV3yoJy+AGwQ2BTDssv/TETrSPIxd1ksocAHZ16UDsKKh2tOUdkRJyC6mHXN56kKsti+brs0yEPErNb0h1r8dHn7dXePaxGNFg0vAAbQNE12gnhX/ZqZRaHPY83y9yIuZp2KbZLV2hyph9CFmjDgI1u",
//         "fareType": "PRIVATE",
//         "currency": "USD",
//         "adtFare": 57.97,
//         "adtTax": 18.88,
//         "chdFare": 0,
//         "chdTax": 0,
//         "qCharge": 0,
//         "tktFee": 0,
//         "platformServiceFee": 0,
//         "comments": null,
//         "journeys": {
//             "journey_0": {
//                 "a9f13ca8593b702724ace1c8dfee01f1": {
//                     "flightId": "a9f13ca8593b702724ace1c8dfee01f1",
//                     "journeyTime": 255,
//                     "transferCount": 0,
//                     "lastTktTime": null,
//                     "segments": {
//                         "f236dcbb1d40c15e1bd295ed16948385": {
//                             "segmentId": "f236dcbb1d40c15e1bd295ed16948385",
//                             "airline": {
//                                 "id": 744,
//                                 "name": "valuair",
//                                 "iata": "vf",
//                                 "image": "https://images.kiwi.com/airlines/64/VF.png",
//                                 "created_at": "2025-03-03T21:54:00.000000Z",
//                                 "updated_at": "2025-03-03T21:54:00.000000Z"
//                             },
//                             "flightNum": "1989",
//                             "equipment": null,
//                             "cabinClass": "ECONOMY",
//                             "bookingCode": "W",
//                             "availabilityCount": 9,
//                             "departure": {
//                                 "id": 2166,
//                                 "name": "sabiha gokcen international airport",
//                                 "iata": "saw",
//                                 "state_name": "istanbul",
//                                 "state_code": "ist",
//                                 "country_name": "turkey",
//                                 "country_code": "tr",
//                                 "created_at": "2025-02-25T22:25:57.000000Z",
//                                 "updated_at": "2025-02-25T22:25:57.000000Z"
//                             },
//                             "arrival": {
//                                 "id": 3591,
//                                 "name": "stansted airport",
//                                 "iata": "stn",
//                                 "state_name": "n/a",
//                                 "state_code": null,
//                                 "country_name": "united kingdom",
//                                 "country_code": "gb",
//                                 "created_at": "2025-02-25T22:28:03.000000Z",
//                                 "updated_at": "2025-02-25T22:28:03.000000Z"
//                             },
//                             "departureTerminal": null,
//                             "arrivalTerminal": null,
//                             "departureDate": 1743054000000,
//                             "arrivalDate": 1743058500000,
//                             "flightTime": 255,
//                             "stayTime": null,
//                             "codeShare": "N",
//                             "opFltNo": null,
//                             "opFltAirline": null,
//                             "stopover": null,
//                             "fareBasis": "YOW",
//                             "strDepartureDate": "2025-03-27",
//                             "strDepartureTime": "13:40",
//                             "strArrivalDate": "2025-03-27",
//                             "strArrivalTime": "14:55"
//                         }
//                     }
//                 }
//             }
//         },
//         "fareRule": null,
//         "rule": null,
//         "platingCarrier": "VF",
//         "prices": null,
//         "merchantFee": 0,
//         "adults": 1,
//         "children": 0,
//         "infants": 0,
//         "baggageMap": {
//             "ADT": [
//                 {
//                     "segmentIndexList": [
//                         1
//                     ],
//                     "baggageAmount": "0PC",
//                     "baggageWeight": null,
//                     "carryOnAmount": "1PC",
//                     "carryOnWeight": "8KG",
//                     "carryOnSize": null
//                 }
//             ]
//         },
//         "miniRuleMap": {
//             "ADT": [
//                 {
//                     "segmentIndex": [
//                         1
//                     ],
//                     "miniRules": [
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 1,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": 76.09,
//                             "currencyCode": "USD",
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 1,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": 76.09,
//                             "currencyCode": "USD",
//                             "percent": null,
//                             "baseType": null
//                         }
//                     ]
//                 }
//             ]
//         },
//         "afterSaleRule": null
//     },
//     "N4i15ijyNqB3WzXaF2+kUG7qTrQPWNnIyoWB0U7BVKLyGPo3OkCP2SnMOWcN2lKdH251onhUuqF+mgugsKDDp3ktVfh791Q9DOUiFMbleuAjaKoRlPyX8Hn4C94eefHvxh8zbT5uu5QJrjTNzFfigVdhxM3NOh0pYjKR82xgDQSMAnMIHHuNxB53VK2koO9CRPUtxFsQCmwmX+/EvTXmQxrQsp+Upj2nCicpDEpdfOznbtKv7mW9PVr9akh8+OYVRZRt+J87lVVQheJ79UUPiAOblntz3+gygToswQmxdgs0VBPX1dEkUNec/aZs0cDG": {
//         "solutionKey": "b17ae9360c6e2def8698a464788853ef",
//         "solutionId": "N4i15ijyNqB3WzXaF2+kUG7qTrQPWNnIyoWB0U7BVKLyGPo3OkCP2SnMOWcN2lKdH251onhUuqF+mgugsKDDp3ktVfh791Q9DOUiFMbleuAjaKoRlPyX8Hn4C94eefHvxh8zbT5uu5QJrjTNzFfigVdhxM3NOh0pYjKR82xgDQSMAnMIHHuNxB53VK2koO9CRPUtxFsQCmwmX+/EvTXmQxrQsp+Upj2nCicpDEpdfOznbtKv7mW9PVr9akh8+OYVRZRt+J87lVVQheJ79UUPiAOblntz3+gygToswQmxdgs0VBPX1dEkUNec/aZs0cDG",
//         "fareType": "PRIVATE",
//         "currency": "USD",
//         "adtFare": 80.52,
//         "adtTax": 9.51,
//         "chdFare": 0,
//         "chdTax": 0,
//         "qCharge": 0,
//         "tktFee": 0,
//         "platformServiceFee": 0,
//         "comments": null,
//         "journeys": {
//             "journey_0": {
//                 "095d2e584e0bb0191414e466ccf767c7": {
//                     "flightId": "095d2e584e0bb0191414e466ccf767c7",
//                     "journeyTime": 260,
//                     "transferCount": 0,
//                     "lastTktTime": null,
//                     "segments": {
//                         "a6e13f1232d4c2b33ea89253657705fd": {
//                             "segmentId": "a6e13f1232d4c2b33ea89253657705fd",
//                             "airline": {
//                                 "id": 231,
//                                 "name": "wizz air uk",
//                                 "iata": "w9",
//                                 "image": "https://images.kiwi.com/airlines/64/W9.png",
//                                 "created_at": "2025-03-03T21:53:58.000000Z",
//                                 "updated_at": "2025-03-03T21:53:58.000000Z"
//                             },
//                             "flightNum": "5772",
//                             "equipment": {
//                                 "id": 20,
//                                 "name": "airbus industrie a318/319/320/321",
//                                 "iata": "32s",
//                                 "created_at": "2025-03-03T21:56:56.000000Z",
//                                 "updated_at": "2025-03-03T21:56:56.000000Z"
//                             },
//                             "cabinClass": "ECONOMY",
//                             "bookingCode": "OP",
//                             "availabilityCount": 1,
//                             "departure": {
//                                 "id": 2167,
//                                 "name": "istanbul ataturk airport",
//                                 "iata": "ist",
//                                 "state_name": "istanbul",
//                                 "state_code": "ist",
//                                 "country_name": "turkey",
//                                 "country_code": "tr",
//                                 "created_at": "2025-02-25T22:25:57.000000Z",
//                                 "updated_at": "2025-02-26T07:32:16.000000Z"
//                             },
//                             "arrival": {
//                                 "id": 3592,
//                                 "name": "london gatwick airport",
//                                 "iata": "lgw",
//                                 "state_name": "n/a",
//                                 "state_code": null,
//                                 "country_name": "united kingdom",
//                                 "country_code": "gb",
//                                 "created_at": "2025-02-25T22:28:03.000000Z",
//                                 "updated_at": "2025-02-25T22:28:03.000000Z"
//                             },
//                             "departureTerminal": null,
//                             "arrivalTerminal": "0",
//                             "departureDate": 1743056400000,
//                             "arrivalDate": 1743061200000,
//                             "flightTime": 260,
//                             "stayTime": null,
//                             "codeShare": "N",
//                             "opFltNo": null,
//                             "opFltAirline": null,
//                             "stopover": null,
//                             "fareBasis": "YOW",
//                             "strDepartureDate": "2025-03-27",
//                             "strDepartureTime": "14:20",
//                             "strArrivalDate": "2025-03-27",
//                             "strArrivalTime": "15:40"
//                         }
//                     }
//                 }
//             }
//         },
//         "fareRule": null,
//         "rule": null,
//         "platingCarrier": "W9",
//         "prices": null,
//         "merchantFee": 0,
//         "adults": 1,
//         "children": 0,
//         "infants": 0,
//         "baggageMap": {
//             "ADT": [
//                 {
//                     "segmentIndexList": [
//                         1
//                     ],
//                     "baggageAmount": null,
//                     "baggageWeight": null,
//                     "carryOnAmount": null,
//                     "carryOnWeight": null,
//                     "carryOnSize": null
//                 }
//             ]
//         },
//         "miniRuleMap": {
//             "ADT": [
//                 {
//                     "segmentIndex": [
//                         1
//                     ],
//                     "miniRules": [
//                         {
//                             "penaltyType": 0,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         },
//                         {
//                             "penaltyType": 2,
//                             "isPermited": 0,
//                             "when": 0,
//                             "noShowTime": null,
//                             "noShowTimeUnit": null,
//                             "amount": null,
//                             "currencyCode": null,
//                             "percent": null,
//                             "baseType": null
//                         }
//                     ]
//                 }
//             ]
//         },
//         "afterSaleRule": null
//     }
// }