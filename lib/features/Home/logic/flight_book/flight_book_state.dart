part of 'flight_book_cubit.dart';

class FlightBookState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final FlightSearchRequest flightSearchRequest;
  final DynamicResponse flightsData;
  final OneWayData oneWayData;
  final RoundTrip roundTrip;
  final MultiCity multiCity;
  final List<FlightDetails> fromList;
  final List<FlightDetails> toList;
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final MultiCityBoxes multiCityBoxes;

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
      airportName: "Chhatrapati Shivaji International",
      iataCode: "BOM",
    ),
    FlightDetails(
      city: "Chennai, Tamil Nadu",
      airportName: "Chennai Central",
      iataCode: "MAS",
    ),
    FlightDetails(
      city: "Hyderabad, Telangana",
      airportName: "Secunderbad Junction",
      iataCode: "SC",
    ),
    FlightDetails(
      city: "Bangalore, Karnataka",
      airportName: "Bangalore City Junction",
      iataCode: "SBC",
    ),
    FlightDetails(
      city: "Pune, Maharashtra",
      airportName: "Pune Junction",
      iataCode: "PUNE",
    ),
    FlightDetails(
      city: "Ahmedabad, Gujarat",
      airportName: "Ahmedabad Junction",
      iataCode: "ADI",
    ),
  ];

  FlightBookState(
      {this.failure = const Failure.empty(),
      this.flowStateApp = FlowStateApp.draft,
      this.flightSearchRequest = const FlightSearchRequest(),
      this.flightsData = const DynamicResponse(),
      this.multiCity = const MultiCity(),
      this.roundTrip = const RoundTrip(),
      this.oneWayData = const OneWayData(),
      this.fromList = defaultFromToList,
      this.toList = defaultFromToList,
      this.calendarFormat = CalendarFormat.month,
      DateTime? focusedDay,
      this.multiCityBoxes = const MultiCityBoxes()})
      : focusedDay = focusedDay ?? DateTime.now().add(Duration(days: 1));

  FlightBookState copyWith(
      {FlowStateApp? flowStateApp,
      Failure? failure,
      FlightSearchRequest? flightSearchRequest,
      DynamicResponse? flightsData,
      OneWayData? oneWayData,
      RoundTrip? roundTrip,
      MultiCity? multiCity,
      List<FlightDetails>? fromList,
      List<FlightDetails>? toList,
      CalendarFormat? calendarFormat,
      DateTime? focusedDay,
      MultiCityBoxes? multiCityBoxes}) {
    return FlightBookState(
        flowStateApp: flowStateApp ?? this.flowStateApp,
        failure: failure ?? this.failure,
        flightSearchRequest: flightSearchRequest ?? this.flightSearchRequest,
        flightsData: flightsData ?? this.flightsData,
        oneWayData: oneWayData ?? this.oneWayData,
        roundTrip: roundTrip ?? this.roundTrip,
        multiCity: multiCity ?? this.multiCity,
        fromList: fromList ?? this.fromList,
        toList: toList ?? this.toList,
        calendarFormat: calendarFormat ?? this.calendarFormat,
        focusedDay: focusedDay ?? this.focusedDay,
        multiCityBoxes: multiCityBoxes ?? this.multiCityBoxes);
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        flightSearchRequest,
        flightsData,
        oneWayData,
        roundTrip,
        multiCity,
        fromList,
        toList,
        calendarFormat,
        focusedDay,
        multiCityBoxes
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

class MultiCity extends Equatable {
  final FlightDetails flightDetails1;
  final FlightDetails flightDetails2;
  final FlightDetails flightDetails3;

  final String date1When;
  final String date2When;
  final String date3When;

  final bool showThiredDestination;
  final int numTravellers;
  final String classType;

  const MultiCity({
    this.date1When = "",
    this.date2When = "",
    this.date3When = "",
    this.numTravellers = 1,
    this.classType = "",
    this.showThiredDestination = false,
    this.flightDetails1 = const FlightDetails(),
    this.flightDetails2 = const FlightDetails(),
    this.flightDetails3 = const FlightDetails(),
  });

  @override
  List<Object?> get props => [
        date1When,
        date2When,
        date3When,
        numTravellers,
        classType,
        showThiredDestination,
        flightDetails1,
        flightDetails2,
        flightDetails3
      ];

  //copywith
  MultiCity copyWith({
    String? date1When,
    String? date2When,
    String? date3When,
    int? numTravellers,
    String? classType,
    bool? showThiredDestination,
    FlightDetails? flightDetails1,
    FlightDetails? flightDetails2,
    FlightDetails? flightDetails3,
  }) {
    return MultiCity(
        date1When: date1When ?? this.date1When,
        date2When: date2When ?? this.date2When,
        date3When: date3When ?? this.date3When,
        numTravellers: numTravellers ?? this.numTravellers,
        classType: classType ?? this.classType,
        showThiredDestination:
            showThiredDestination ?? this.showThiredDestination,
        flightDetails1: flightDetails1 ?? this.flightDetails1,
        flightDetails2: flightDetails2 ?? this.flightDetails2,
        flightDetails3: flightDetails3 ?? this.flightDetails3);
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
