import 'package:equatable/equatable.dart';

class DynamicResponse extends Equatable {
  final Map<String, FlightSearchModel> details;

  const DynamicResponse({this.details = const {}});

  factory DynamicResponse.fromMap(Map<String, dynamic> map) {
    final details = <String, FlightSearchModel>{};
    map.forEach((key, value) {
      details[key] = FlightSearchModel.fromMap(value);
    });
    return DynamicResponse(details: details);
  }

  @override
  List<Object?> get props => [details];
}

class FlightSearchModel extends Equatable {
  final String solutionKey;
  final String solutionId;
  final String fareType;
  final String currency;

  final String? comments;
  final Map<String, Journey> journeys;
  final String? fareRule;
  final String? rule;
  final String platingCarrier;
  final String? prices;
  final String merchantFee;
  final Map<String, List<Baggage>> baggageMap;
  final Map<String, List<MiniRule>> miniRuleMap;
  final String? afterSaleRule;

  final int adults;
  final int children;
  final int infants;

  final String adtFare;
  final String adtTax;
  final String chdFare;
  final String chdTax;
  final String infFare;
  final String infTax;
  final String platformServiceFee;

  final String qCharge;
  final String tktFee;

  const FlightSearchModel({
    this.solutionKey = '',
    this.solutionId = '',
    this.fareType = '',
    this.currency = '',
    this.adtFare = '',
    this.adtTax = '',
    this.chdFare = '',
    this.chdTax = '',
    this.qCharge = '',
    this.tktFee = '',
    this.platformServiceFee = '',
    this.comments,
    this.journeys = const {},
    this.fareRule,
    this.rule,
    this.platingCarrier = '',
    this.prices,
    this.merchantFee = '',
    this.adults = 0,
    this.children = 0,
    this.infants = 0,
    this.baggageMap = const {},
    this.miniRuleMap = const {},
    this.afterSaleRule,
    this.infFare = "0",
    this.infTax = "0",
  });

  FlightSearchModel copyWith({
    String? solutionKey,
    String? solutionId,
    String? fareType,
    String? currency,
    String? adtFare,
    String? adtTax,
    String? chdFare,
    String? chdTax,
    String? qCharge,
    String? tktFee,
    String? platformServiceFee,
    String? comments,
    Map<String, Journey>? journeys,
    String? fareRule,
    String? rule,
    String? platingCarrier,
    String? prices,
    String? merchantFee,
    int? adults,
    int? children,
    int? infants,
    Map<String, List<Baggage>>? baggageMap,
    Map<String, List<MiniRule>>? miniRuleMap,
    String? afterSaleRule,
    String? infFare,
    String? infTax,
  }) {
    return FlightSearchModel(
      solutionKey: solutionKey ?? this.solutionKey,
      solutionId: solutionId ?? this.solutionId,
      fareType: fareType ?? this.fareType,
      currency: currency ?? this.currency,
      adtFare: adtFare ?? this.adtFare,
      adtTax: adtTax ?? this.adtTax,
      chdFare: chdFare ?? this.chdFare,
      chdTax: chdTax ?? this.chdTax,
      qCharge: qCharge ?? this.qCharge,
      tktFee: tktFee ?? this.tktFee,
      platformServiceFee: platformServiceFee ?? this.platformServiceFee,
      comments: comments ?? this.comments,
      journeys: journeys ?? this.journeys,
      fareRule: fareRule ?? this.fareRule,
      rule: rule ?? this.rule,
      platingCarrier: platingCarrier ?? this.platingCarrier,
      prices: prices ?? this.prices,
      merchantFee: merchantFee ?? this.merchantFee,
      adults: adults ?? this.adults,
      children: children ?? this.children,
      infants: infants ?? this.infants,
      baggageMap: baggageMap ?? this.baggageMap,
      miniRuleMap: miniRuleMap ?? this.miniRuleMap,
      afterSaleRule: afterSaleRule ?? this.afterSaleRule,
      infFare: infFare ?? this.infFare,
      infTax: infTax ?? this.infTax,
    );
  }

  // final String adtFare;
  // final String adtTax;
  // final String chdFare;
  // final String chdTax;
  // final String infFare;
  // final String infTax;
  // final String platformServiceFee;

  // final String qCharge;
  // final String tktFee;
  factory FlightSearchModel.fromMap(Map<String, dynamic> map) {
    return FlightSearchModel(
      solutionKey: map['solutionKey'] ?? '',
      solutionId: map['solutionId'] ?? '',
      fareType: map['fareType'] ?? '',
      currency: map['currency'] ?? '',
      adtFare: map['adtFare']?.toString() ?? '',
      adtTax: map['adtTax']?.toString() ?? '',
      chdFare: map['chdFare']?.toString() ?? '',
      chdTax: map['chdTax']?.toString() ?? '',
      qCharge: map['qCharge']?.toString() ?? '',
      tktFee: map['tktFee']?.toString() ?? '',
      platformServiceFee: map['platformServiceFee']?.toString() ?? '',
      comments: map['comments'],
      journeys: (map['journeys'] as Map<String, dynamic>?)
              ?.map((journeyKey, journeyData) {
            // Get the actual journey data, skipping the first random key
            var actualJourneyData = journeyData.values.first;
            return MapEntry(
              journeyKey,
              Journey.fromMap(actualJourneyData as Map<String, dynamic>),
            );
          }) ??
          {},
      fareRule: map['fareRule'],
      rule: map['rule'],
      platingCarrier: map['platingCarrier'] ?? '',
      prices: map['prices'],
      merchantFee: map['merchantFee']?.toString() ?? '',
      adults: map['adults'] ?? 0,
      children: map['children'] ?? 0,
      infants: map['infants'] ?? 0,
      baggageMap: (map['baggageMap'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key,
                  List<Baggage>.from(value.map((x) => Baggage.fromMap(x))))) ??
          {},
      miniRuleMap: (map['miniRuleMap'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(
                  key,
                  List<MiniRule>.from(
                      value.map((x) => MiniRule.fromMap(x))))) ??
          {},
      afterSaleRule: map['afterSaleRule']?.toString() ?? "0",
      infFare: map['infFare']?.toString() ?? "0",
      infTax: map['infTax']?.toString() ?? "0",
    );
  }

  @override
  List<Object?> get props => [
        solutionKey,
        solutionId,
        fareType,
        currency,
        adtFare,
        adtTax,
        chdFare,
        chdTax,
        qCharge,
        tktFee,
        platformServiceFee,
        comments,
        journeys,
        fareRule,
        rule,
        platingCarrier,
        prices,
        merchantFee,
        adults,
        children,
        infants,
        baggageMap,
        miniRuleMap,
        afterSaleRule,
        infFare,
        infTax,
      ];
}

class Journey extends Equatable {
  final String flightId;
  final int journeyTime;
  final int transferCount;
  final String? lastTktTime;
  final Map<String, Segment> segments;

  const Journey({
    this.flightId = '',
    this.journeyTime = 0,
    this.transferCount = 0,
    this.lastTktTime,
    this.segments = const {},
  });

  Journey copyWith({
    String? flightId,
    int? journeyTime,
    int? transferCount,
    String? lastTktTime,
    Map<String, Segment>? segments,
  }) {
    return Journey(
      flightId: flightId ?? this.flightId,
      journeyTime: journeyTime ?? this.journeyTime,
      transferCount: transferCount ?? this.transferCount,
      lastTktTime: lastTktTime ?? this.lastTktTime,
      segments: segments ?? this.segments,
    );
  }

  factory Journey.fromMap(Map<String, dynamic> map) {
    return Journey(
      flightId: map['flightId'] ?? '',
      journeyTime: map['journeyTime'] ?? 0,
      transferCount: map['transferCount'] ?? 0,
      lastTktTime: map['lastTktTime']?.toString() ?? '',
      segments: (map['segments'] as Map<String, dynamic>?)
              ?.map((segmentKey, segmentData) {
            return MapEntry(
              segmentKey,
              Segment.fromMap(segmentData as Map<String, dynamic>),
            );
          }) ??
          {},
    );
  }

  @override
  List<Object?> get props => [
        flightId,
        journeyTime,
        transferCount,
        lastTktTime,
        segments,
      ];
}

class MiniRule extends Equatable {
  final int penaltyType;
  final int isPermited;
  final int when;
  final String? noShowTime;
  final String? noShowTimeUnit;
  final String? amount;
  final String? currencyCode;
  final String? percent;
  final String? baseType;

  const MiniRule({
    this.penaltyType = 0,
    this.isPermited = 0,
    this.when = 0,
    this.noShowTime,
    this.noShowTimeUnit,
    this.amount,
    this.currencyCode,
    this.percent,
    this.baseType,
  });

  MiniRule copyWith({
    int? penaltyType,
    int? isPermited,
    int? when,
    String? noShowTime,
    String? noShowTimeUnit,
    String? amount,
    String? currencyCode,
    String? percent,
    String? baseType,
  }) {
    return MiniRule(
      penaltyType: penaltyType ?? this.penaltyType,
      isPermited: isPermited ?? this.isPermited,
      when: when ?? this.when,
      noShowTime: noShowTime ?? this.noShowTime,
      noShowTimeUnit: noShowTimeUnit ?? this.noShowTimeUnit,
      amount: amount ?? this.amount,
      currencyCode: currencyCode ?? this.currencyCode,
      percent: percent ?? this.percent,
      baseType: baseType ?? this.baseType,
    );
  }

  factory MiniRule.fromMap(Map<String, dynamic> map) {
    return MiniRule(
      penaltyType: map['penaltyType'] ?? 0,
      isPermited: map['isPermited'] ?? 0,
      when: map['when'] ?? 0,
      noShowTime: map['noShowTime'],
      noShowTimeUnit: map['noShowTimeUnit'],
      amount: map['amount'],
      currencyCode: map['currencyCode'],
      percent: map['percent'],
      baseType: map['baseType'],
    );
  }

  @override
  List<Object?> get props => [
        penaltyType,
        isPermited,
        when,
        noShowTime,
        noShowTimeUnit,
        amount,
        currencyCode,
        percent,
        baseType,
      ];
}

class Baggage extends Equatable {
  final List<int> segmentIndexList;
  final String baggageAmount;
  final String? baggageWeight;
  final String carryOnAmount;
  final String carryOnWeight;
  final String? carryOnSize;

  const Baggage({
    this.segmentIndexList = const [],
    this.baggageAmount = '',
    this.baggageWeight,
    this.carryOnAmount = '',
    this.carryOnWeight = '',
    this.carryOnSize,
  });

  Baggage copyWith({
    List<int>? segmentIndexList,
    String? baggageAmount,
    String? baggageWeight,
    String? carryOnAmount,
    String? carryOnWeight,
    String? carryOnSize,
  }) {
    return Baggage(
      segmentIndexList: segmentIndexList ?? this.segmentIndexList,
      baggageAmount: baggageAmount ?? this.baggageAmount,
      baggageWeight: baggageWeight ?? this.baggageWeight,
      carryOnAmount: carryOnAmount ?? this.carryOnAmount,
      carryOnWeight: carryOnWeight ?? this.carryOnWeight,
      carryOnSize: carryOnSize ?? this.carryOnSize,
    );
  }

  factory Baggage.fromMap(Map<String, dynamic> map) {
    return Baggage(
      segmentIndexList: List<int>.from(map['segmentIndexList'] ?? []),
      baggageAmount: map['baggageAmount'] ?? '',
      baggageWeight: map['baggageWeight'] ?? '',
      carryOnAmount: map['carryOnAmount'] ?? '',
      carryOnWeight: map['carryOnWeight'] ?? '',
      carryOnSize: map['carryOnSize'] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        segmentIndexList,
        baggageAmount,
        baggageWeight,
        carryOnAmount,
        carryOnWeight,
        carryOnSize,
      ];
}

class Segment extends Equatable {
  final String segmentId;
  final String flightNum;
  final String cabinClass;
  final String bookingCode;
  final int availabilityCount;

  final Departure? departure;
  final Arrival? arrival;
  final Airline? airline;
  final Equipment? equipment;

  final String? departureTerminal;
  final String? arrivalTerminal;
  final int departureDate;
  final int arrivalDate;
  final int flightTime;
  final String? stayTime;
  final String codeShare;
  final String? opFltNo;
  final String? opFltAirline;
  final String? stopover;
  final String fareBasis;
  final String strDepartureDate;
  final String strDepartureTime;
  final String strArrivalDate;
  final String strArrivalTime;

  const Segment({
    this.segmentId = '',
    this.flightNum = '',
    this.cabinClass = '',
    this.bookingCode = '',
    this.availabilityCount = 0,
    this.departureTerminal,
    this.arrivalTerminal,
    this.departureDate = 0,
    this.arrivalDate = 0,
    this.flightTime = 0,
    this.stayTime,
    this.codeShare = '',
    this.opFltNo,
    this.opFltAirline,
    this.stopover,
    this.fareBasis = '',
    this.strDepartureDate = '',
    this.strDepartureTime = '',
    this.strArrivalDate = '',
    this.strArrivalTime = '',
    this.departure = const Departure(),
    this.arrival = const Arrival(),
    this.airline = const Airline(),
    this.equipment = const Equipment(),
  });

  Segment copyWith({
    String? segmentId,
    String? flightNum,
    String? cabinClass,
    String? bookingCode,
    int? availabilityCount,
    String? departureTerminal,
    String? arrivalTerminal,
    int? departureDate,
    int? arrivalDate,
    int? flightTime,
    String? stayTime,
    String? codeShare,
    String? opFltNo,
    String? opFltAirline,
    String? stopover,
    String? fareBasis,
    String? strDepartureDate,
    String? strDepartureTime,
    String? strArrivalDate,
    String? strArrivalTime,
    Departure? departure,
    Arrival? arrival,
    Airline? airline,
    Equipment? equipment,
  }) {
    return Segment(
      segmentId: segmentId ?? this.segmentId,
      flightNum: flightNum ?? this.flightNum,
      cabinClass: cabinClass ?? this.cabinClass,
      bookingCode: bookingCode ?? this.bookingCode,
      availabilityCount: availabilityCount ?? this.availabilityCount,
      departureTerminal: departureTerminal ?? this.departureTerminal,
      arrivalTerminal: arrivalTerminal ?? this.arrivalTerminal,
      departureDate: departureDate ?? this.departureDate,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      flightTime: flightTime ?? this.flightTime,
      stayTime: stayTime ?? this.stayTime,
      codeShare: codeShare ?? this.codeShare,
      opFltNo: opFltNo ?? this.opFltNo,
      opFltAirline: opFltAirline ?? this.opFltAirline,
      stopover: stopover ?? this.stopover,
      fareBasis: fareBasis ?? this.fareBasis,
      strDepartureDate: strDepartureDate ?? this.strDepartureDate,
      strDepartureTime: strDepartureTime ?? this.strDepartureTime,
      strArrivalDate: strArrivalDate ?? this.strArrivalDate,
      strArrivalTime: strArrivalTime ?? this.strArrivalTime,
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      airline: airline ?? this.airline,
      equipment: equipment ?? this.equipment,
    );
  }

  factory Segment.fromMap(Map<String, dynamic> map) {
    return Segment(
      segmentId: map['segmentId']?.toString() ?? '',
      flightNum: map['flightNum']?.toString() ?? '',
      cabinClass: map['cabinClass']?.toString() ?? '',
      bookingCode: map['bookingCode']?.toString() ?? '',
      availabilityCount: map['availabilityCount'] ?? 0,
      departureTerminal: map['departureTerminal'],
      arrivalTerminal: map['arrivalTerminal'],
      departureDate: map['departureDate'] ?? 0,
      arrivalDate: map['arrivalDate'] ?? 0,
      flightTime: map['flightTime'] ?? 0,
      stayTime: map['stayTime']?.toString() ?? '',
      codeShare: map['codeShare']?.toString() ?? '',
      opFltNo: map['opFltNo']?.toString() ?? '',
      opFltAirline: map['opFltAirline']?.toString() ?? '',
      stopover: map['stopover']?.toString() ?? '',
      fareBasis: map['fareBasis']?.toString() ?? '',
      strDepartureDate: map['strDepartureDate']?.toString() ?? '',
      strDepartureTime: map['strDepartureTime']?.toString() ?? '',
      strArrivalDate: map['strArrivalDate']?.toString() ?? '',
      strArrivalTime: map['strArrivalTime']?.toString() ?? '',
      departure: map['departure'] is Map<String, dynamic>
          ? Departure.fromMap(map['departure'] as Map<String, dynamic>)
          : Departure.fromMap({}),
      arrival: map['arrival'] is Map<String, dynamic>
          ? Arrival.fromMap(map['arrival'] as Map<String, dynamic>)
          : Arrival.fromMap({}),
      airline: map['airline'] is Map<String, dynamic>
          ? Airline.fromMap(map['airline'] as Map<String, dynamic>)
          : Airline.fromMap({}),
      equipment: map['equipment'] is Map<String, dynamic>
          ? Equipment.fromMap(map['equipment'] as Map<String, dynamic>)
          : Equipment.fromMap({}),
    );
  }

  @override
  List<Object?> get props => [
        segmentId,
        airline,
        flightNum,
        equipment,
        cabinClass,
        bookingCode,
        availabilityCount,
        departure,
        arrival,
        departureTerminal,
        arrivalTerminal,
        departureDate,
        arrivalDate,
        flightTime,
        stayTime,
        codeShare,
        opFltNo,
        opFltAirline,
        stopover,
        fareBasis,
        strDepartureDate,
        strDepartureTime,
        strArrivalDate,
        strArrivalTime,
        departure,
        arrival,
        airline,
        equipment,
      ];
}
//       "airline": {
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

class Departure extends Equatable {
  final String id;
  final String name;
  final String iata;
  final String stateName;
  final String stateCode;
  final String countryName;
  final String countryCode;

  const Departure({
    this.id = '',
    this.name = '',
    this.iata = '',
    this.stateName = '',
    this.stateCode = '',
    this.countryName = '',
    this.countryCode = '',
  });

  Departure copyWith({
    String? id,
    String? name,
    String? iata,
    String? stateName,
    String? stateCode,
    String? countryName,
    String? countryCode,
  }) {
    return Departure(
      id: id ?? this.id,
      name: name ?? this.name,
      iata: iata ?? this.iata,
      stateName: stateName ?? this.stateName,
      stateCode: stateCode ?? this.stateCode,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  factory Departure.fromMap(Map<String, dynamic> map) {
    return Departure(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      iata: map['iata']?.toString() ?? '',
      stateName: map['stateName']?.toString() ?? '',
      stateCode: map['stateCode']?.toString() ?? '',
      countryName: map['countryName']?.toString() ?? '',
      countryCode: map['countryCode']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        iata,
        stateName,
        stateCode,
        countryName,
        countryCode,
      ];
}

class Arrival extends Equatable {
  final String id;
  final String name;
  final String iata;
  final String stateName;
  final String stateCode;
  final String countryName;
  final String countryCode;

  const Arrival({
    this.id = '',
    this.name = '',
    this.iata = '',
    this.stateName = '',
    this.stateCode = '',
    this.countryName = '',
    this.countryCode = '',
  });

  Arrival copyWith({
    String? id,
    String? name,
    String? iata,
    String? stateName,
    String? stateCode,
    String? countryName,
    String? countryCode,
  }) {
    return Arrival(
      id: id ?? this.id,
      name: name ?? this.name,
      iata: iata ?? this.iata,
      stateName: stateName ?? this.stateName,
      stateCode: stateCode ?? this.stateCode,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  factory Arrival.fromMap(Map<String, dynamic> map) {
    return Arrival(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      iata: map['iata']?.toString() ?? '',
      stateName: map['stateName']?.toString() ?? '',
      stateCode: map['stateCode']?.toString() ?? '',
      countryName: map['countryName']?.toString() ?? '',
      countryCode: map['countryCode']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        iata,
        stateName,
        stateCode,
        countryName,
        countryCode,
      ];
}

class Airline extends Equatable {
  final int id;
  final String name;
  final String iata;
  final String image;
  final String createdAt;
  final String updatedAt;

  const Airline({
    this.id = 0,
    this.name = '',
    this.iata = '',
    this.image = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  Airline copyWith({
    int? id,
    String? name,
    String? iata,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return Airline(
      id: id ?? this.id,
      name: name ?? this.name,
      iata: iata ?? this.iata,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Airline.fromMap(Map<String, dynamic> map) {
    return Airline(
      id: map['id'] ?? 0,
      name: map['name']?.toString() ?? '',
      iata: map['iata']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
      createdAt: map['createdAt']?.toString() ?? '',
      updatedAt: map['updatedAt']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        iata,
        image,
        createdAt,
        updatedAt,
      ];
}

class Equipment extends Equatable {
  final int id;
  final String name;
  final String iata;
  final String createdAt;
  final String updatedAt;

  const Equipment({
    this.id = 0,
    this.name = '',
    this.iata = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  Equipment copyWith({
    int? id,
    String? name,
    String? iata,
    String? createdAt,
    String? updatedAt,
  }) {
    return Equipment(
      id: id ?? this.id,
      name: name ?? this.name,
      iata: iata ?? this.iata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Equipment.fromMap(Map<String, dynamic> map) {
    return Equipment(
      id: map['id'] ?? 0,
      name: map['name']?.toString() ?? '',
      iata: map['iata']?.toString() ?? '',
      createdAt: map['createdAt']?.toString() ?? '',
      updatedAt: map['updatedAt']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        iata,
        createdAt,
        updatedAt,
      ];
}
