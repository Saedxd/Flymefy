part of 'flight_book_cubit.dart';

enum FlightType { oneWay, roundTrip, multiCity }

class FlightBookState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final FlightSearchRequest flightSearchRequest;
  final DynamicResponse flightsData;
  final OneWayData oneWayData;
  final RoundTrip roundTrip;
  final List<FlightDetails> fromList;
  final List<FlightDetails> toList;
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final MultiCityBoxes multiCityBoxes;
  final FlightType currentSelectedType;

  final List<bool> openedTickets;

  static const List<FlightDetails> defaultFromToList = [
    FlightDetails(
      city: "Ahmedabad",
      airportName: "Sardar Vallabhbhai Patel International Airport",
      iataCode: "AMD",
    ),
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
      city: "Pune, Maharashtra",
      airportName: "Pune International Airport",
      iataCode: "PNQ",
    ),
    FlightDetails(
      city: "Ahmedabad, Gujarat",
      airportName: "Sardar Vallabhbhai Patel International Airport",
      iataCode: "AMD",
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
  ];

  FlightBookState(
      {this.failure = const Failure.empty(),
      this.flowStateApp = FlowStateApp.draft,
      this.flightSearchRequest = const FlightSearchRequest(),
      this.flightsData = const DynamicResponse(),
      this.roundTrip = const RoundTrip(),
      this.oneWayData = const OneWayData(),
      this.fromList = defaultFromToList,
      this.toList = defaultFromToList,
      this.calendarFormat = CalendarFormat.month,
      DateTime? focusedDay,
      this.multiCityBoxes = const MultiCityBoxes(),
      this.currentSelectedType = FlightType.oneWay,
      this.openedTickets = const []})
      : focusedDay = focusedDay ?? DateTime.now().add(Duration(days: 1));

  FlightBookState copyWith(
      {FlowStateApp? flowStateApp,
      Failure? failure,
      FlightSearchRequest? flightSearchRequest,
      DynamicResponse? flightsData,
      OneWayData? oneWayData,
      RoundTrip? roundTrip,
      List<FlightDetails>? fromList,
      List<FlightDetails>? toList,
      CalendarFormat? calendarFormat,
      DateTime? focusedDay,
      MultiCityBoxes? multiCityBoxes,
      FlightType? currentSelectedType,
      List<bool>? openedTickets}) {
    return FlightBookState(
        flowStateApp: flowStateApp ?? this.flowStateApp,
        failure: failure ?? this.failure,
        flightSearchRequest: flightSearchRequest ?? this.flightSearchRequest,
        flightsData: flightsData ?? this.flightsData,
        oneWayData: oneWayData ?? this.oneWayData,
        roundTrip: roundTrip ?? this.roundTrip,
        fromList: fromList ?? this.fromList,
        toList: toList ?? this.toList,
        calendarFormat: calendarFormat ?? this.calendarFormat,
        focusedDay: focusedDay ?? this.focusedDay,
        multiCityBoxes: multiCityBoxes ?? this.multiCityBoxes,
        currentSelectedType: currentSelectedType ?? this.currentSelectedType,
        openedTickets: openedTickets ?? this.openedTickets);
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        flightSearchRequest,
        flightsData,
        oneWayData,
        roundTrip,
        fromList,
        toList,
        calendarFormat,
        focusedDay,
        multiCityBoxes,
        currentSelectedType,
        openedTickets
      ];
}

class OneWayData extends Equatable {
  final FlightDetails flightDetailsFrom;
  final FlightDetails flightDetailsTo;

  final String dateWhen;
  final int numTravellers;
  final String classType;

  const OneWayData({
    this.dateWhen = "",
    this.numTravellers = 0,
    this.classType = "",
    this.flightDetailsFrom = const FlightDetails(),
    this.flightDetailsTo = const FlightDetails(),
  });

  @override
  List<Object?> get props =>
      [dateWhen, numTravellers, classType, flightDetailsFrom, flightDetailsTo];
  //copy with
  OneWayData copyWith({
    String? dateWhen,
    int? numTravellers,
    String? classType,
    FlightDetails? flightDetailsFrom,
    FlightDetails? flightDetailsTo,
  }) {
    return OneWayData(
        dateWhen: dateWhen ?? this.dateWhen,
        numTravellers: numTravellers ?? this.numTravellers,
        classType: classType ?? this.classType,
        flightDetailsFrom: flightDetailsFrom ?? this.flightDetailsFrom,
        flightDetailsTo: flightDetailsTo ?? this.flightDetailsTo);
  }
}

class RoundTrip extends Equatable {
  final FlightDetails flightDetailsFrom;
  final FlightDetails flightDetailsTo;

  final String departureDate;
  final String arrivalDate;
  final int numTravellers;
  final String classType;

  const RoundTrip({
    this.departureDate = "",
    this.arrivalDate = "",
    this.numTravellers = 1,
    this.classType = "",
    this.flightDetailsFrom = const FlightDetails(),
    this.flightDetailsTo = const FlightDetails(),
  });

  @override
  List<Object?> get props => [
        departureDate,
        arrivalDate,
        numTravellers,
        classType,
        flightDetailsFrom,
        flightDetailsTo
      ];

//copywith
  RoundTrip copyWith({
    String? departureDate,
    String? arrivalDate,
    int? numTravellers,
    String? classType,
    FlightDetails? flightDetailsFrom,
    FlightDetails? flightDetailsTo,
  }) {
    return RoundTrip(
        departureDate: departureDate ?? this.departureDate,
        arrivalDate: arrivalDate ?? this.arrivalDate,
        numTravellers: numTravellers ?? this.numTravellers,
        classType: classType ?? this.classType,
        flightDetailsFrom: flightDetailsFrom ?? this.flightDetailsFrom,
        flightDetailsTo: flightDetailsTo ?? this.flightDetailsTo);
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

class MultiCityBoxes extends Equatable {
  final List<CityEntry> cities;

  const MultiCityBoxes({this.cities = const []});

  MultiCityBoxes copyWith({List<CityEntry>? cities}) {
    return MultiCityBoxes(
      cities: cities ?? this.cities,
    );
  }

  @override
  List<Object> get props => [cities];
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
