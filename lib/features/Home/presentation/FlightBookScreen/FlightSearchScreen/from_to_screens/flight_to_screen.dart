import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/domain/entity/city_airports.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/from_to_screens/flight_from_screen.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/main.dart';
import 'package:intl/intl.dart';

class FlightsTo extends StatelessWidget {
  const FlightsTo(
      {Key? key,
      required this.cubit,
      required this.onIataClicked,
      required this.type,
      required this.index})
      : super(key: key);
  final FlightBookCubit cubit;
  final Function(CityAirport) onIataClicked;
  final String type;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: FlightToScreen(
          cubit: cubit,
          onIataClicked: onIataClicked,
          type: type,
          index: index,
        ));
  }
}

class FlightToScreen extends StatefulWidget {
  FlightToScreen(
      {Key? key,
      required this.cubit,
      required this.onIataClicked,
      required this.type,
      required this.index})
      : super(key: key);
  final FlightBookCubit cubit;
  final Function(CityAirport) onIataClicked;
  final String type;
  final int index;

  @override
  State<FlightToScreen> createState() => _FlightToScreenState();
}

class _FlightToScreenState extends State<FlightToScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cubit.GetCitysAirportsList("IST");
  }

  String getCityName({required String type, required bool isFrom, int? index}) {
    if (type == "TORoundTrip") {
      return isFrom
          ? widget.cubit.state.roundTrip.flightDetailsFrom.countryName
                  .isNotEmpty
              ? widget.cubit.state.roundTrip.flightDetailsFrom.countryName
              : "Enter any City/Airport Name"
          : widget.cubit.state.roundTrip.flightDetailsTo.countryName.isNotEmpty
              ? widget.cubit.state.roundTrip.flightDetailsTo.countryName
              : "Enter any City/Airport Name";
    } else if (type == "TOOneWay") {
      return isFrom
          ? widget.cubit.state.oneWayData.flightDetailsFrom.countryName
                  .isNotEmpty
              ? widget.cubit.state.oneWayData.flightDetailsFrom.countryName
              : "Enter any City/Airport Name"
          : widget.cubit.state.oneWayData.flightDetailsTo.countryName.isNotEmpty
              ? widget.cubit.state.oneWayData.flightDetailsTo.countryName
              : "Enter any City/Airport Name";
    } else if (type == "MultiCity") {
      // Ensure index is provided and valid
      if (index == null ||
          index < 0 ||
          index >= widget.cubit.state.multiCity.cities.length) {
        return "Enter any City/Airport Name";
      }

      final cityEntry = widget.cubit.state.multiCity.cities[index];
      return isFrom
          ? cityEntry.from.countryName.isNotEmpty
              ? cityEntry.from.countryName
              : "Enter any City/Airport Name"
          : cityEntry.to.countryName.isNotEmpty
              ? cityEntry.to.countryName
              : "Enter any City/Airport Name";
    }

    return "Enter any City/Airport Name"; // Default case
  }

  @override
  Widget build(BuildContext context) {
    final bool isRoundTrip = widget.type.contains("RoundTrip");
    final bool isOneWay = widget.type.contains("OneWay");
    final bool isMultiCity = widget.type.contains("MultiCity");

    final String fromText =
        getCityName(type: widget.type, isFrom: true, index: widget.index);
    final String toText =
        getCityName(type: widget.type, isFrom: false, index: widget.index);

    return Scaffold(
      backgroundColor: white,
      body: BlocBuilder<FlightBookCubit, FlightBookState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.flowStateApp == FlowStateApp.getAirportsLoading
              ? const LoadinContent()
              : state.flowStateApp == FlowStateApp.getAirportsError
                  ? ErrorContent(
                      message: state.failure.message,
                      onRefresh: () {},
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60),
                          Container(
                            width: context.width,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: greyE8E, width: 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.arrow_back,
                                        color: black2E2, size: 20),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextWidget.PoppinsMedium(
                                        text: "From",
                                        color: grey717,
                                        fontSize: 14,
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: fromText,
                                        color: grey717,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: context.width,
                            decoration: BoxDecoration(
                              color: redF8E,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: greyE8E, width: 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    toFlightImage,
                                    width: 22.94,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextWidget.PoppinsMedium(
                                        text: "To",
                                        color: black2E2,
                                        fontSize: 14,
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: toText,
                                        color: grey717,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          CommonTextWidget.PoppinsMedium(
                            text: "Popular Searches",
                            color: grey717,
                            fontSize: 12,
                          ),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount:
                                    state.cityAirportsList.cityAirports.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: CommonTextWidget.PoppinsRegular(
                                    text: state.cityAirportsList
                                        .cityAirports[index].countryName,
                                    color: black2E2,
                                    fontSize: 16,
                                  ),
                                  subtitle: CommonTextWidget.PoppinsRegular(
                                    text: state.cityAirportsList
                                        .cityAirports[index].name,
                                    color: grey717,
                                    fontSize: 12,
                                  ),
                                  trailing: CommonTextWidget.PoppinsMedium(
                                    text: state.cityAirportsList
                                        .cityAirports[index].iata,
                                    color: grey717,
                                    fontSize: 16,
                                  ),
                                ).toButton(() {
                                  widget.onIataClicked(state
                                      .cityAirportsList.cityAirports[index]);
                                  Navigator.pop(context);
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
