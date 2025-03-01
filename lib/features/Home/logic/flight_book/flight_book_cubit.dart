import 'package:equatable/equatable.dart';
import 'package:flymefy/features/Home/data/requests/request.dart';
import 'package:flymefy/features/Home/domain/entity/flight_search.dart';
import 'package:flymefy/features/Home/domain/usecase/flight_book_usecase.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/features/Home/logic/ui_model/flight_structured_model.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/app_export.dart';

part 'flight_book_state.dart';

class FlightBookCubit extends Cubit<FlightBookState> {
  final GetFlightsFromSearch _getFlightsFromSearch;

  FlightBookCubit({
    required GetFlightsFromSearch getFlightsFromSearch,
  })  : _getFlightsFromSearch = getFlightsFromSearch,
        super(FlightBookState());

  void makeDefaultState() {
    emit(state.copyWith(flowStateApp: FlowStateApp.draft));
  }

  void getFlights(FlightType type) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));

    final result = await _getFlightsFromSearch(state.flightSearchRequest);

    await delayForCreateNewStatus();
    result.fold((failure) {
      print("failed to get flights ${failure.message}");
      emit(state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
    }, (flightsData) {
      List<Flight> flights = [];
      List<Segment> segments = [];
      List<JourneyUi> journeys = [];

      for (var entry in flightsData.details.entries) {
        segments.clear();
        journeys.clear();
        for (var journey in entry.value.journeys.values) {
          // Check if segments are available
          if (journey.segments.isNotEmpty) {
            for (var segment in journey.segments.values) {
              Segment segmentObject = Segment(
                strDepartureTime: segment.strDepartureTime,
                strArrivalTime: segment.strArrivalTime,
                strDepartureDate: segment.strDepartureDate,
                strArrivalDate: segment.strArrivalDate,
                segmentId: segment.segmentId,
                airline: segment.airline,
                flightNum: segment.flightNum,
                equipment: segment.equipment,
                cabinClass: segment.cabinClass,
                bookingCode: segment.bookingCode,
                availabilityCount: segment.availabilityCount,
                departure: segment.departure,
                arrival: segment.arrival,
                departureTerminal: segment.departureTerminal,
                arrivalTerminal: segment.arrivalTerminal,
                departureDate: segment.departureDate,
                arrivalDate: segment.arrivalDate,
                flightTime: segment.flightTime,
                stayTime: segment.stayTime,
                codeShare: segment.codeShare,
                opFltNo: segment.opFltNo,
                opFltAirline: segment.opFltAirline,
                stopover: segment.stopover,
                fareBasis: segment.fareBasis,
              );
              segments.add(segmentObject);
            }
            print("Segments: ${segments.length}");
            JourneyUi journeyObject = JourneyUi(
              flightId: journey.flightId,
              journeyTime: journey.journeyTime,
              transferCount: journey.transferCount,
              lastTktTime: journey.lastTktTime,
              segments: List.from(segments),
            );
            journeys.add(journeyObject);
          } else {
            print(
                "No segments found for journey with flightId: ${journey.flightId}");
          }
        }

        // Ensure that you add the flight only if journeys is not empty
        if (journeys.isNotEmpty) {
          Flight flight = Flight(
            adtFare: entry.value.adtFare,
            adtTax: entry.value.adtTax,
            chdFare: entry.value.chdFare,
            chdTax: entry.value.chdTax,
            infants: entry.value.infants,
            children: entry.value.children,
            adults: entry.value.adults,
            baggageMap: entry.value.baggageMap,
            miniRuleMap: entry.value.miniRuleMap,
            platformServiceFee: entry.value.platformServiceFee,
            qCharge: entry.value.qCharge,
            tktFee: entry.value.tktFee,
            currency: entry.value.currency,
            fareType: entry.value.fareType,
            solutionId: entry.value.solutionId,
            solutionKey: entry.value.solutionKey,
            merchantFee: entry.value.merchantFee,
            platingCarrier: entry.value.platingCarrier,
            prices: entry.value.prices,
            fareRule: entry.value.fareRule,
            rule: entry.value.rule,
            afterSaleRule: entry.value.afterSaleRule,
            infFare: entry.value.infFare,
            infTax: entry.value.infTax,
            comments: entry.value.comments,
            journeys: List.from(journeys),
          );

          flights.add(flight);
        } else {
          print("No journeys found for flight.");
        }
      }

      emit(state.copyWith(flights: Flights(flights: flights)));
      printFlightDetails(flights);
      emit(state.copyWith(
          flowStateApp: FlowStateApp.success,
          currentSelectedType: type,
          flightData: flightsData,
          openedTickets: List.generate(
              flightsData.details.entries.length, (index) => false)));
      // testPrintStatements(flightsData);
    });
  }

  void printFlightDetails(List<Flight> flights) {
    for (var flight in flights) {
      print("Flight:");
      print("  Fare Details:");
      print("    ADT Fare: ${flight.adtFare}");
      print("    ADT Tax: ${flight.adtTax}");
      print("    CHD Fare: ${flight.chdFare}");
      print("    CHD Tax: ${flight.chdTax}");
      print("    Infants: ${flight.infants}");
      print("    Children: ${flight.children}");
      print("    Adults: ${flight.adults}");
      print("    Currency: ${flight.currency}");
      print("    Fare Type: ${flight.fareType}");
      print("    Solution ID: ${flight.solutionId}");
      print("    Solution Key: ${flight.solutionKey}");
      print("    Merchant Fee: ${flight.merchantFee}");
      print("    Plating Carrier: ${flight.platingCarrier}");

      // Print Prices
      print("    Prices: ${flight.prices}");

      // Print Journeys
      print("  Journeys:");
      for (var journey in flight.journeys) {
        print("    Flight ID: ${journey.flightId}");
        print("    Journey Time: ${journey.journeyTime}");
        print("    Transfer Count: ${journey.transferCount}");
        print("    Last Ticket Time: ${journey.lastTktTime}");

        // Print Segments
        print("    Segments:");
        for (var segment in journey.segments) {
          print("      Segment ID: ${segment.segmentId}");
          print("      Airline: ${segment.airline}");
          print("      Flight Number: ${segment.flightNum}");
          print("      Equipment: ${segment.equipment}");
          print("      Cabin Class: ${segment.cabinClass}");
          print("      Booking Code: ${segment.bookingCode}");
          print("      Availability Count: ${segment.availabilityCount}");
          print("      Departure: ${segment.departure}");
          print("      Arrival: ${segment.arrival}");
          print("      Departure Terminal: ${segment.departureTerminal}");
          print("      Arrival Terminal: ${segment.arrivalTerminal}");
          print("      Departure Date: ${segment.strDepartureDate}");
          print("      Arrival Date: ${segment.strArrivalDate}");
          print("      Flight Time: ${segment.flightTime}");
          print("      Stay Time: ${segment.stayTime}");
          print("      Code Share: ${segment.codeShare}");
          print("      Operational Flight Number: ${segment.opFltNo}");
          print("      Operational Airline: ${segment.opFltAirline}");
          print("      Stopover: ${segment.stopover}");
          print("      Fare Basis: ${segment.fareBasis}");
        }
      }

      // Add a separator for each flight
      print("\n------------------------------------------------\n");
    }
  }

  void testPrintStatements(DynamicResponse flightsData) {
    // Checking the details in DynamicResponse
    print("Details: ${flightsData.details.entries.first.value.journeys}");

    // Checking first value of the 'details' map (assuming it has at least one entry)
    if (flightsData.details.isNotEmpty) {
      String firstKey = flightsData.details.keys.first;
      FlightSearchModel firstFlight = flightsData.details[firstKey]!;

      // Check the baggageMap for the first entry
      if (firstFlight.baggageMap.isNotEmpty) {
        String firstBaggageKey = firstFlight.baggageMap.keys.first;
        List<Baggage> firstBaggageList =
            firstFlight.baggageMap[firstBaggageKey]!;

        print(
            "Baggage for first flight: ${firstBaggageList.map((baggage) => baggage.baggageAmount).toList()}");
      } else {
        print("No baggage map found for the first flight.");
      }

      // Check the MiniRuleMap
      if (firstFlight.miniRuleMap.isNotEmpty) {
        String firstMiniRuleKey = firstFlight.miniRuleMap.keys.first;
        List<MiniRule> firstMiniRuleList =
            firstFlight.miniRuleMap[firstMiniRuleKey]!;

        print(
            "MiniRules for first flight: ${firstMiniRuleList.map((rule) => rule.amount).toList()}");
      } else {
        print("No miniRuleMap found for the first flight.");
      }

      // Check adults, children, and infants count
      print("Adults: ${firstFlight.adults}");
      print("Children: ${firstFlight.children}");
      print("Infants: ${firstFlight.infants}");

      // Check fare and tax values
      print("Adult Fare: ${firstFlight.adtFare}");
      print("Adult Tax: ${firstFlight.adtTax}");
      print("Child Fare: ${firstFlight.chdFare}");
      print("Child Tax: ${firstFlight.chdTax}");
    } else {
      print("No flights data available.");
    }
  }

  String formatDateDDMMM(DateTime date) {
    // Format for "22 Sep"
    final DateFormat formatterPart1 = DateFormat('dd MMM');
    return formatterPart1.format(date);
  }

  String convertMinutesToHours(int minutes) {
    int hours = minutes ~/ 60; // Integer division to get hours
    return '${hours}h';
  }

  String convertMinutesToRemainingMinutes(int minutes) {
    int remainingMinutes = minutes % 60; // Remainder gives minutes
    return '${remainingMinutes}m';
  }

  void toggleOpenTicket(int index) {
    final updatedOpenedTickets = List<bool>.from(state.openedTickets);
    updatedOpenedTickets[index] = !updatedOpenedTickets[index];
    emit(state.copyWith(openedTickets: updatedOpenedTickets));
  }

  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void assignDataToTheRequest(FlightType flightType) async {
    emit(state.copyWith(
        flightSearchRequest: FlightSearchRequest(
      adults: 1,
      children: 0,
      infants: 0,
      nonstop: 0,
      airline: '',
      solutions: 0,
      searchAirLegs: [
        SearchAirLegs(
          cabinClass: 'Economy',
          departureDate:
              //"2025-03-10",
              formatDate(flightType == FlightType.oneWay
                  ? state.oneWayData.dateWhen
                  : flightType == FlightType.roundTrip
                      ? state.roundTrip.departureDate
                      : flightType == FlightType.multiCity
                          ? state.multiCity!.cities[0].date
                          : ''),
          origin:
              //"LON",

              flightType == FlightType.oneWay
                  ? state.oneWayData.flightDetailsFrom.iataCode
                  : flightType == FlightType.roundTrip
                      ? state.roundTrip.flightDetailsFrom.iataCode
                      : flightType == FlightType.multiCity
                          ? state.multiCity!.cities[0].from.iataCode
                          : '',
          destination:
              //"CAI",

              flightType == FlightType.oneWay
                  ? state.oneWayData.flightDetailsTo.iataCode
                  : flightType == FlightType.roundTrip
                      ? state.roundTrip.flightDetailsTo.iataCode
                      : flightType == FlightType.multiCity
                          ? state.multiCity!.cities[0].to.iataCode
                          : '',
          airline: '',
        ),
        // SearchAirLegs(
        //   cabinClass: 'Economy',
        //   departureDate: "2025-03-15",
        //   origin: "CAI",
        //   destination: "LON",
        //   airline: '',
        // ),
        if (flightType != FlightType.oneWay)
          SearchAirLegs(
            cabinClass: 'Economy',
            departureDate: formatDate(flightType == FlightType.roundTrip
                ? state.roundTrip.arrivalDate
                : flightType == FlightType.multiCity
                    ? state.multiCity!.cities[1].date
                    : ""),
            origin: flightType == FlightType.roundTrip
                ? state.roundTrip.flightDetailsTo.iataCode
                : flightType == FlightType.multiCity
                    ? state.multiCity!.cities[1].from.iataCode
                    : '',
            destination: flightType == FlightType.roundTrip
                ? state.roundTrip.flightDetailsFrom.iataCode
                : flightType == FlightType.multiCity
                    ? state.multiCity!.cities[1].to.iataCode
                    : '',
            airline: '',
          )
      ],
    )));

    getFlights(flightType);
  }

  // Update Focused Day
  void updateFocusedDay(DateTime focusedDay) {
    emit(state.copyWith(focusedDay: focusedDay));
  }

  // Calendar Format Update
  void updateCalendarFormat(CalendarFormat format) {
    emit(state.copyWith(calendarFormat: format));
  }

  // Date Selection Updates
  void updateOneWaySelectedDay(DateTime selectedDay) {
    emit(state.copyWith(
        oneWayData:
            state.oneWayData.copyWith(dateWhen: selectedDay.toString())));
  }

  void updateRoundTripdepartureDate(DateTime selectedDay) {
    emit(state.copyWith(
        roundTrip:
            state.roundTrip.copyWith(departureDate: selectedDay.toString())));
  }

  void updateRoundTripArrivalDate(DateTime selectedDay) {
    emit(state.copyWith(
        roundTrip:
            state.roundTrip.copyWith(arrivalDate: selectedDay.toString())));
  }

  // Selecting cities for Round Trip and One Way (existing methods)
  void selectToCityTypeRoundTrip(FlightDetails selectedFlight) async {
    emit(state.copyWith(
        roundTrip: state.roundTrip.copyWith(flightDetailsTo: selectedFlight)));
  }

  void selectFromCityTypeRoundTrip(FlightDetails selectedFlight) async {
    emit(state.copyWith(
        roundTrip:
            state.roundTrip.copyWith(flightDetailsFrom: selectedFlight)));
  }

  void selectToCityTypeOneWay(FlightDetails selectedFlight) async {
    emit(state.copyWith(
        oneWayData:
            state.oneWayData.copyWith(flightDetailsTo: selectedFlight)));
  }

  void selectFromCityTypeOneWay(FlightDetails selectedFlight) async {
    emit(state.copyWith(
        oneWayData:
            state.oneWayData.copyWith(flightDetailsFrom: selectedFlight)));
  }

  void addCityEntry() {
    final updatedCities = List<CityEntry>.from(state.multiCity.cities);
    updatedCities.add(const CityEntry(
      from: FlightDetails(), // Default first city
      to: FlightDetails(),
      date: "", // Default tomorrow
    ));

    emit(state.copyWith(
        MultiCity: state.multiCity.copyWith(cities: updatedCities)));
  }

  void removeCityEntry(int index) {
    final updatedCities = List<CityEntry>.from(state.multiCity.cities);
    if (updatedCities.length > 1) {
      updatedCities.removeAt(index);
      emit(state.copyWith(
          MultiCity:
              state.multiCity.copyWith(cities: updatedCities)));
    }
  }

  void updateCityEntryFrom(int index, FlightDetails newFrom) {
    final updatedCities = List<CityEntry>.from(state.multiCity.cities);
    if (index >= 0 && index < updatedCities.length) {
      updatedCities[index] = updatedCities[index].copyWith(from: newFrom);
      emit(state.copyWith(
          MultiCity:
              state.multiCity.copyWith(cities: updatedCities)));
    }
  }

  void updateCityEntryTo(int index, FlightDetails newTo) {
    final updatedCities = List<CityEntry>.from(state.multiCity.cities);
    if (index >= 0 && index < updatedCities.length) {
      updatedCities[index] = updatedCities[index].copyWith(to: newTo);
      emit(state.copyWith(
          MultiCity:
              state.multiCity.copyWith(cities: updatedCities)));
    }
  }

  void updateCityEntryDate(int index, String newDate) {
    final updatedCities = List<CityEntry>.from(state.multiCity.cities);
    if (index >= 0 && index < updatedCities.length) {
      updatedCities[index] = updatedCities[index].copyWith(date: newDate);
      emit(state.copyWith(
          MultiCity:
              state.multiCity.copyWith(cities: updatedCities)));
    }
  }

  void updateMultiCitySelectedDay(DateTime selectedDay, int index) {
    final updatedCities = List<CityEntry>.from(state.multiCity.cities);

    if (index >= 0 && index < updatedCities.length) {
      updatedCities[index] =
          updatedCities[index].copyWith(date: selectedDay.toString());

      emit(state.copyWith(
          MultiCity:
              state.multiCity.copyWith(cities: updatedCities)));
    }
  }
    void onTravelersAdultsChanged(int value) {
      state.currentSelectedType == FlightType.oneWay?
    emit(state.copyWith(oneWayData: state.oneWayData.copyWith(adults: value)))
    : state.currentSelectedType == FlightType.roundTrip?
    emit(state.copyWith(roundTrip: state.roundTrip.copyWith(adults: value)))
    : state.currentSelectedType == FlightType.multiCity?
    emit(state.copyWith(MultiCity: state.multiCity!.copyWith(adults: value)))
    : emit(state.copyWith());
    }

  void onTravelersChildrenChanged(int value) {
    state.currentSelectedType == FlightType.oneWay?
    emit(state.copyWith(oneWayData: state.oneWayData.copyWith(children: value)))
    : state.currentSelectedType == FlightType.roundTrip?
    emit(state.copyWith(roundTrip: state.roundTrip.copyWith(children: value)))
    : state.currentSelectedType == FlightType.multiCity?
    emit(state.copyWith(MultiCity: state.multiCity!.copyWith(children: value)))
    : emit(state.copyWith());
  }

  void onTravelersInfantsChanged(int value) {
    state.currentSelectedType == FlightType.oneWay?
    emit(state.copyWith(oneWayData: state.oneWayData.copyWith(infants: value)))
    : state.currentSelectedType == FlightType.roundTrip?
    emit(state.copyWith(roundTrip: state.roundTrip.copyWith(infants: value)))
    : state.currentSelectedType == FlightType.multiCity?
    emit(state.copyWith(MultiCity: state.multiCity!.copyWith(infants: value)))
    : emit(state.copyWith());
  }

  void onCabinClassChanged(String cabinClass) {
    state.currentSelectedType == FlightType.oneWay?
    emit(state.copyWith(oneWayData: state.oneWayData.copyWith(classType: cabinClass)))
    : state.currentSelectedType == FlightType.roundTrip?
    emit(state.copyWith(roundTrip: state.roundTrip.copyWith(classType: cabinClass)))
    : state.currentSelectedType == FlightType.multiCity?
    emit(state.copyWith(MultiCity: state.multiCity!.copyWith(classType: cabinClass
    ))
    ): emit(state.copyWith());
  }
}
