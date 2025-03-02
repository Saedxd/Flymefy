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
  final List<FlightDetails> fromList;
  final List<FlightDetails> toList;
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final MultiCity multiCity;
  final FlightType currentSelectedType;

  final List<bool> openedTickets;

  static const List<FlightDetails> defaultFromToList = [
    FlightDetails(
      city: "New Delhi",
      airportName: "Indira Gandhi International Airport",
      iataCode: "DEL",
    ),
    FlightDetails(
      city: "Mumbai, Maharashtra",
      airportName: "Chhatrapati Shivaji International Airport",
      iataCode: "BOM",
    ),
    FlightDetails(
      city: "Chennai, Tamil Nadu",
      airportName: "Chennai International Airport",
      iataCode: "MAA",
    ),
    FlightDetails(
      city: "Hyderabad, Telangana",
      airportName: "Rajiv Gandhi International Airport",
      iataCode: "HYD",
    ),
    FlightDetails(
      city: "Bangalore, Karnataka",
      airportName: "Kempegowda International Airport",
      iataCode: "BLR",
    ),
    FlightDetails(
      city: "London, United Kingdom",
      airportName: "Heathrow Airport",
      iataCode: "LHR",
    ),
    FlightDetails(
      city: "New York, USA",
      airportName: "John F. Kennedy International Airport",
      iataCode: "JFK",
    ),
    FlightDetails(
      city: "Los Angeles, USA",
      airportName: "Los Angeles International Airport",
      iataCode: "LAX",
    ),
    FlightDetails(
      city: "Paris, France",
      airportName: "Charles de Gaulle International Airport",
      iataCode: "CDG",
    ),
    FlightDetails(
      city: "Tokyo, Japan",
      airportName: "Narita International Airport",
      iataCode: "NRT",
    ),
    FlightDetails(
      city: "Dubai, United Arab Emirates",
      airportName: "Dubai International Airport",
      iataCode: "DXB",
    ),
    FlightDetails(
      city: "Singapore",
      airportName: "Changi Airport",
      iataCode: "SIN",
    ),
    FlightDetails(
      city: "Sydney, Australia",
      airportName: "Sydney Kingsford Smith International Airport",
      iataCode: "SYD",
    ),
    FlightDetails(
      city: "Toronto, Canada",
      airportName: "Toronto Pearson International Airport",
      iataCode: "YYZ",
    ),
    FlightDetails(
      city: "Berlin, Germany",
      airportName: "Berlin Brandenburg Airport",
      iataCode: "BER",
    ),
    FlightDetails(
      city: "Rome, Italy",
      airportName: "Leonardo da Vinci International Airport",
      iataCode: "FCO",
    ),
    FlightDetails(
      city: "Hong Kong",
      airportName: "Hong Kong International Airport",
      iataCode: "HKG",
    ),
    FlightDetails(
      city: "Beijing, China",
      airportName: "Beijing Capital International Airport",
      iataCode: "PEK",
    ),
    // New 50 Airports
    FlightDetails(
      city: "Frankfurt, Germany",
      airportName: "Frankfurt Airport",
      iataCode: "FRA",
    ),
    FlightDetails(
      city: "Amsterdam, Netherlands",
      airportName: "Schiphol Airport",
      iataCode: "AMS",
    ),
    FlightDetails(
      city: "Seoul, South Korea",
      airportName: "Incheon International Airport",
      iataCode: "ICN",
    ),
    FlightDetails(
      city: "Kuala Lumpur, Malaysia",
      airportName: "Kuala Lumpur International Airport",
      iataCode: "KUL",
    ),
    FlightDetails(
      city: "Bangkok, Thailand",
      airportName: "Suvarnabhumi Airport",
      iataCode: "BKK",
    ),
    FlightDetails(
      city: "San Francisco, USA",
      airportName: "San Francisco International Airport",
      iataCode: "SFO",
    ),
    FlightDetails(
      city: "Chicago, USA",
      airportName: "O'Hare International Airport",
      iataCode: "ORD",
    ),
    FlightDetails(
      city: "Dubai, UAE",
      airportName: "Dubai International Airport",
      iataCode: "DXB",
    ),
    FlightDetails(
      city: "Madrid, Spain",
      airportName: "Adolfo Suárez Madrid–Barajas Airport",
      iataCode: "MAD",
    ),
    FlightDetails(
      city: "Moscow, Russia",
      airportName: "Sheremetyevo International Airport",
      iataCode: "SVO",
    ),
    FlightDetails(
      city: "Cairo, Egypt",
      airportName: "Cairo International Airport",
      iataCode: "CAI",
    ),
    FlightDetails(
      city: "Rome, Italy",
      airportName: "Fiumicino Airport",
      iataCode: "FCO",
    ),
    FlightDetails(
      city: "Zurich, Switzerland",
      airportName: "Zurich Airport",
      iataCode: "ZRH",
    ),
    FlightDetails(
      city: "Los Angeles, USA",
      airportName: "Los Angeles International Airport",
      iataCode: "LAX",
    ),
    FlightDetails(
      city: "Barcelona, Spain",
      airportName: "Barcelona El Prat Airport",
      iataCode: "BCN",
    ),
    FlightDetails(
      city: "Vienna, Austria",
      airportName: "Vienna International Airport",
      iataCode: "VIE",
    ),
    FlightDetails(
      city: "Madrid, Spain",
      airportName: "Madrid–Barajas Adolfo Suárez Airport",
      iataCode: "MAD",
    ),
    FlightDetails(
      city: "Lisbon, Portugal",
      airportName: "Lisbon Portela Airport",
      iataCode: "LIS",
    ),
    FlightDetails(
      city: "Istanbul, Turkey",
      airportName: "Istanbul Airport",
      iataCode: "IST",
    ),
    FlightDetails(
      city: "Dubai, UAE",
      airportName: "Dubai International Airport",
      iataCode: "DXB",
    ),
    FlightDetails(
      city: "Doha, Qatar",
      airportName: "Hamad International Airport",
      iataCode: "DOH",
    ),
    FlightDetails(
      city: "Bali, Indonesia",
      airportName: "Ngurah Rai International Airport",
      iataCode: "DPS",
    ),
    FlightDetails(
      city: "Johannesburg, South Africa",
      airportName: "O.R. Tambo International Airport",
      iataCode: "JNB",
    ),
    FlightDetails(
      city: "Shanghai, China",
      airportName: "Shanghai Pudong International Airport",
      iataCode: "PVG",
    ),
    FlightDetails(
      city: "Shanghai, China",
      airportName: "Hongqiao International Airport",
      iataCode: "SHA",
    ),
    FlightDetails(
      city: "Mexico City, Mexico",
      airportName: "Mexico City International Airport",
      iataCode: "MEX",
    ),
    FlightDetails(
      city: "Buenos Aires, Argentina",
      airportName: "Ezeiza International Airport",
      iataCode: "EZE",
    ),
    FlightDetails(
      city: "Santiago, Chile",
      airportName: "Arturo Merino Benítez International Airport",
      iataCode: "SCL",
    ),
    FlightDetails(
      city: "Seoul, South Korea",
      airportName: "Incheon International Airport",
      iataCode: "ICN",
    ),
    FlightDetails(
      city: "Lagos, Nigeria",
      airportName: "Murtala Muhammed International Airport",
      iataCode: "LOS",
    ),
    FlightDetails(
      city: "Bangkok, Thailand",
      airportName: "Don Mueang International Airport",
      iataCode: "DMK",
    ),
    FlightDetails(
      city: "Cairo, Egypt",
      airportName: "Cairo International Airport",
      iataCode: "CAI",
    ),
    FlightDetails(
      city: "Kuala Lumpur, Malaysia",
      airportName: "Kuala Lumpur International Airport",
      iataCode: "KUL",
    ),
    FlightDetails(
      city: "Sao Paulo, Brazil",
      airportName: "São Paulo–Guarulhos International Airport",
      iataCode: "GRU",
    ),
    FlightDetails(
      city: "Rio de Janeiro, Brazil",
      airportName: "Galeão International Airport",
      iataCode: "GIG",
    ),
    FlightDetails(
      city: "Cape Town, South Africa",
      airportName: "Cape Town International Airport",
      iataCode: "CPT",
    ),
    FlightDetails(
      city: "Copenhagen, Denmark",
      airportName: "Copenhagen Airport",
      iataCode: "CPH",
    ),
    FlightDetails(
      city: "Athens, Greece",
      airportName: "Elefthérios Venizélos International Airport",
      iataCode: "ATH",
    ),
    FlightDetails(
      city: "Tel Aviv, Israel",
      airportName: "Ben Gurion International Airport",
      iataCode: "TLV",
    ),
    FlightDetails(
      city: "Kuwait City, Kuwait",
      airportName: "Kuwait International Airport",
      iataCode: "KWI",
    ),
    FlightDetails(
      city: "Lima, Peru",
      airportName: "Jorge Chávez International Airport",
      iataCode: "LIM",
    ),
    FlightDetails(
      city: "Dubai, United Arab Emirates",
      airportName: "Dubai International Airport",
      iataCode: "DXB",
    ),
  ];

  FlightBookState({
    this.failure = const Failure.empty(),
    this.flowStateApp = FlowStateApp.draft,
    this.flightSearchRequest = const FlightSearchRequest(),
    this.flights = const Flights(),
    this.roundTrip = const RoundTrip(),
    this.oneWayData = const OneWayData(),
    this.fromList = defaultFromToList,
    this.toList = defaultFromToList,
    this.calendarFormat = CalendarFormat.month,
    DateTime? focusedDay,
    this.multiCity = const MultiCity(),
    this.currentSelectedType = FlightType.oneWay,
    this.openedTickets = const [],
    this.flightData = const DynamicResponse(),
  }) : focusedDay = focusedDay ?? DateTime.now().add(Duration(days: 1));

  FlightBookState copyWith(
      {FlowStateApp? flowStateApp,
      Failure? failure,
      FlightSearchRequest? flightSearchRequest,
      Flights? flights,
      OneWayData? oneWayData,
      RoundTrip? roundTrip,
      List<FlightDetails>? fromList,
      List<FlightDetails>? toList,
      CalendarFormat? calendarFormat,
      DateTime? focusedDay,
      MultiCity? multiCity,
      FlightType? currentSelectedType,
      List<bool>? openedTickets,
      DynamicResponse? flightData}) {
    return FlightBookState(
        flowStateApp: flowStateApp ?? this.flowStateApp,
        failure: failure ?? this.failure,
        flightSearchRequest: flightSearchRequest ?? this.flightSearchRequest,
        flights: flights ?? this.flights,
        oneWayData: oneWayData ?? this.oneWayData,
        roundTrip: roundTrip ?? this.roundTrip,
        fromList: fromList ?? this.fromList,
        toList: toList ?? this.toList,
        calendarFormat: calendarFormat ?? this.calendarFormat,
        focusedDay: focusedDay ?? this.focusedDay,
        multiCity: multiCity ?? this.multiCity,
        currentSelectedType: currentSelectedType ?? this.currentSelectedType,
        openedTickets: openedTickets ?? this.openedTickets,
        flightData: flightData ?? this.flightData);
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        flightSearchRequest,
        flights,
        oneWayData,
        roundTrip,
        fromList,
        toList,
        calendarFormat,
        focusedDay,
        multiCity,
        currentSelectedType,
        openedTickets,
        flightData
      ];
}

class OneWayData extends Equatable {
  final FlightDetails flightDetailsFrom;
  final FlightDetails flightDetailsTo;

  final String dateWhen;
  final int adults;
  final int children;
  final int infants;
  final String classType;
  int get totalTravellers => adults + children + infants;

  const OneWayData({
    this.dateWhen = "",
    this.classType = "Economy",
    this.flightDetailsFrom = const FlightDetails(),
    this.flightDetailsTo = const FlightDetails(),
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
    FlightDetails? flightDetailsFrom,
    FlightDetails? flightDetailsTo,
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
  final FlightDetails flightDetailsFrom;
  final FlightDetails flightDetailsTo;

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
    this.flightDetailsFrom = const FlightDetails(),
    this.flightDetailsTo = const FlightDetails(),
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
    FlightDetails? flightDetailsFrom,
    FlightDetails? flightDetailsTo,
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

class FlightDetails {
  final String iataCode;
  final String city;
  final String airportName;

  const FlightDetails(
      {this.iataCode = '', this.city = '', this.airportName = ''});

  @override
  List<Object?> get props => [iataCode, city, airportName];

//copy With
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
  final FlightDetails from;
  final FlightDetails to;
  final String date;

  const CityEntry({
    required this.from,
    required this.to,
    required this.date,
  });

  CityEntry copyWith({FlightDetails? from, FlightDetails? to, String? date}) {
    return CityEntry(
      from: from ?? this.from,
      to: to ?? this.to,
      date: date ?? this.date,
    );
  }

  @override
  List<Object> get props => [from, to, date];
}
