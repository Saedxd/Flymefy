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

// adtFare: 102 (but decimal part as well, so technically a float)
// adtTax: 10 (but decimal part as well, so technically a float)
// chdFare: 102 (but decimal part as well, so technically a float)
// chdTax: 10 (but decimal part as well, so technically a float)
// infFare: 20 (but decimal part as well, so technically a float)
// infTax: 10 (but decimal part as well, so technically a float)
// qCharge: 0
// tktFee: 0
// platformServiceFee: 0
// adults: 2
// children: 2
// infants: 1
// baggageAmount and carryOnAmount values are strings with "1PC" or "0PC", but not integers.
// All the values in the miniRules arrays related to penaltyType, isPermited, when, and segmentIndex arrays are all integers.
class FlightSearchModel extends Equatable {
  final String solutionKey;
  final String solutionId;
  final String fareType;
  final String currency;

  final String qCharge;
  final String tktFee;
  final String platformServiceFee;
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
// "infFare": 36.96,
//         "infTax": 9.48,

  final int adults;
  final int children;
  final int infants;

  final String adtFare;
  final String adtTax;
  final String chdFare;
  final String chdTax;
  final String infFare;
  final String infTax;

//make a fucntion to calculate total price of the flight * number of passengers

  double get totalPrice {
    return (double.parse(adtFare) + double.parse(adtTax)) * adults +
        (double.parse(chdFare) + double.parse(chdTax)) * children +
        (double.parse(infFare) + double.parse(infTax)) * infants;
  }

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
      lastTktTime: map['lastTktTime'],
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
  final String airline;
  final String flightNum;
  final String equipment;
  final String cabinClass;
  final String bookingCode;
  final int availabilityCount;
  final String departure;
  final String arrival;
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
    this.airline = '',
    this.flightNum = '',
    this.equipment = '',
    this.cabinClass = '',
    this.bookingCode = '',
    this.availabilityCount = 0,
    this.departure = '',
    this.arrival = '',
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
  });

  Segment copyWith({
    String? segmentId,
    String? airline,
    String? flightNum,
    String? equipment,
    String? cabinClass,
    String? bookingCode,
    int? availabilityCount,
    String? departure,
    String? arrival,
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
  }) {
    return Segment(
      segmentId: segmentId ?? this.segmentId,
      airline: airline ?? this.airline,
      flightNum: flightNum ?? this.flightNum,
      equipment: equipment ?? this.equipment,
      cabinClass: cabinClass ?? this.cabinClass,
      bookingCode: bookingCode ?? this.bookingCode,
      availabilityCount: availabilityCount ?? this.availabilityCount,
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
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
    );
  }

  factory Segment.fromMap(Map<String, dynamic> map) {
    return Segment(
      segmentId: map['segmentId'] ?? '',
      airline: map['airline'] ?? '',
      flightNum: map['flightNum'] ?? '',
      equipment: map['equipment'] ?? '',
      cabinClass: map['cabinClass'] ?? '',
      bookingCode: map['bookingCode'] ?? '',
      availabilityCount: map['availabilityCount'] ?? 0,
      departure: map['departure'] ?? '',
      arrival: map['arrival'] ?? '',
      departureTerminal: map['departureTerminal'],
      arrivalTerminal: map['arrivalTerminal'],
      departureDate: map['departureDate'] ?? 0,
      arrivalDate: map['arrivalDate'] ?? 0,
      flightTime: map['flightTime'] ?? 0,
      stayTime: map['stayTime'],
      codeShare: map['codeShare'] ?? '',
      opFltNo: map['opFltNo'],
      opFltAirline: map['opFltAirline'],
      stopover: map['stopover'],
      fareBasis: map['fareBasis'] ?? '',
      strDepartureDate: map['strDepartureDate'] ?? '',
      strDepartureTime: map['strDepartureTime'] ?? '',
      strArrivalDate: map['strArrivalDate'] ?? '',
      strArrivalTime: map['strArrivalTime'] ?? '',
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
      ];
}
