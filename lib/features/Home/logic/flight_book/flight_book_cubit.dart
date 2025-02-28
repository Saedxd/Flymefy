import 'package:equatable/equatable.dart';
import 'package:flymefy/features/Home/data/requests/request.dart';
import 'package:flymefy/features/Home/domain/entity/flight_search.dart';
import 'package:flymefy/features/Home/domain/usecase/flight_book_usecase.dart';
import 'package:flymefy/core/error/failure.dart';
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

  void getFlights() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));

    final result = await _getFlightsFromSearch(state.flightSearchRequest);

    await delayForCreateNewStatus();
    result.fold((failure) {
      emit(state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
    }, (flightsData) {
      emit(state.copyWith(
          flowStateApp: FlowStateApp.success, flightsData: flightsData));
    });
  }

  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void assignDataToTheRequest(FlightType flightType) async {
//     {

//     "search": {
//         "adults":1,
//         "children": 0,
//         "infants": 0,
//         "nonstop": 0,
//         "airline": "",
//         "solutions": 10,
//         "searchAirLegs": [
//             {
//                 "cabinClass": "Economy",
//                 "departureDate": "2025-03-01",
//                 "origin": "IST",
//                 "destination": "LON",
//                 "airline": ""
//             },
//              {
//                 "cabinClass": "Economy",
//                 "departureDate": "2025-03-10",
//                 "origin": "LON",
//                 "destination": "IST",
//                 "airline": ""
//             }
//         ]
//     }
// }

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
              //"2025-03-01",
              formatDate(flightType == FlightType.oneWay
                  ? state.oneWayData.dateWhen
                  : flightType == FlightType.roundTrip
                      ? state.roundTrip.departureDate
                      : flightType == FlightType.multiCity
                          ? state.multiCityBoxes!.cities[0].date
                          : ''),
          origin: flightType == FlightType.oneWay
              ? state.oneWayData.flightDetailsFrom.iataCode
              : flightType == FlightType.roundTrip
                  ? state.roundTrip.flightDetailsFrom.iataCode
                  : flightType == FlightType.multiCity
                      ? state.multiCityBoxes!.cities[0].from.iataCode
                      : '',
          destination: flightType == FlightType.oneWay
              ? state.oneWayData.flightDetailsTo.iataCode
              : flightType == FlightType.roundTrip
                  ? state.roundTrip.flightDetailsTo.iataCode
                  : flightType == FlightType.multiCity
                      ? state.multiCityBoxes!.cities[0].to.iataCode
                      : '',
          airline: '',
        ),
        flightType != FlightType.oneWay
            ? SearchAirLegs(
                cabinClass: 'Economy',
                departureDate: formatDate(flightType == FlightType.roundTrip
                    ? state.roundTrip.arrivalDate
                    : flightType == FlightType.multiCity
                        ? state.multiCityBoxes!.cities[1].date
                        : ""),
                origin: flightType == FlightType.roundTrip
                    ? state.roundTrip.flightDetailsTo.iataCode
                    : flightType == FlightType.multiCity
                        ? state.multiCityBoxes!.cities[1].from.iataCode
                        : '',
                destination: flightType == FlightType.roundTrip
                    ? state.roundTrip.flightDetailsFrom.iataCode
                    : flightType == FlightType.multiCity
                        ? state.multiCityBoxes!.cities[1].to.iataCode
                        : '',
                airline: '',
              )
            : SearchAirLegs(),
      ],
    )));

    getFlights();
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
    final updatedCities = List<CityEntry>.from(state.multiCityBoxes.cities);
    updatedCities.add(const CityEntry(
      from: FlightDetails(), // Default first city
      to: FlightDetails(),
      date: "", // Default tomorrow
    ));

    emit(state.copyWith(
        multiCityBoxes: state.multiCityBoxes.copyWith(cities: updatedCities)));
  }

  void removeCityEntry(int index) {
    final updatedCities = List<CityEntry>.from(state.multiCityBoxes.cities);
    if (updatedCities.length > 1) {
      updatedCities.removeAt(index);
      emit(state.copyWith(
          multiCityBoxes:
              state.multiCityBoxes.copyWith(cities: updatedCities)));
    }
  }

  void updateCityEntryFrom(int index, FlightDetails newFrom) {
    final updatedCities = List<CityEntry>.from(state.multiCityBoxes.cities);
    if (index >= 0 && index < updatedCities.length) {
      updatedCities[index] = updatedCities[index].copyWith(from: newFrom);
      emit(state.copyWith(
          multiCityBoxes:
              state.multiCityBoxes.copyWith(cities: updatedCities)));
    }
  }

  void updateCityEntryTo(int index, FlightDetails newTo) {
    final updatedCities = List<CityEntry>.from(state.multiCityBoxes.cities);
    if (index >= 0 && index < updatedCities.length) {
      updatedCities[index] = updatedCities[index].copyWith(to: newTo);
      emit(state.copyWith(
          multiCityBoxes:
              state.multiCityBoxes.copyWith(cities: updatedCities)));
    }
  }

  void updateCityEntryDate(int index, String newDate) {
    final updatedCities = List<CityEntry>.from(state.multiCityBoxes.cities);
    if (index >= 0 && index < updatedCities.length) {
      updatedCities[index] = updatedCities[index].copyWith(date: newDate);
      emit(state.copyWith(
          multiCityBoxes:
              state.multiCityBoxes.copyWith(cities: updatedCities)));
    }
  }

  void updateMultiCitySelectedDay(DateTime selectedDay, int index) {
    final updatedCities = List<CityEntry>.from(state.multiCityBoxes.cities);

    if (index >= 0 && index < updatedCities.length) {
      updatedCities[index] =
          updatedCities[index].copyWith(date: selectedDay.toString());

      emit(state.copyWith(
          multiCityBoxes:
              state.multiCityBoxes.copyWith(cities: updatedCities)));
    }
  }
}
