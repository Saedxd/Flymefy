import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/main.dart';

class FlightsFrom extends StatelessWidget {
  const FlightsFrom(
      {Key? key,
      required this.cubit,
      required this.onIataClicked,
      required this.type,
      required this.index})
      : super(key: key);
  final FlightBookCubit cubit;
  final Function(FlightDetails) onIataClicked;
  final String type;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: FlightFromScreen(
          cubit: cubit,
          onIataClicked: onIataClicked,
          type: type,
          index: index,
        ));
  }
}

class FlightFromScreen extends StatefulWidget {
  FlightFromScreen(
      {Key? key,
      required this.cubit,
      required this.onIataClicked,
      required this.type,
      required this.index})
      : super(key: key);
  final FlightBookCubit cubit;
  final Function(FlightDetails) onIataClicked;
  final String type;
  final int index;

  @override
  State<FlightFromScreen> createState() => _FlightFromScreenState();
}

class _FlightFromScreenState extends State<FlightFromScreen> {
  String getCityName({required String type, required bool isFrom, int? index}) {
    if (type == "FROMRoundTrip") {
      return isFrom
          ? widget.cubit.state.roundTrip.flightDetailsFrom.city.isNotEmpty
              ? widget.cubit.state.roundTrip.flightDetailsFrom.city
              : "Enter any City/Airport Name"
          : widget.cubit.state.roundTrip.flightDetailsTo.city.isNotEmpty
              ? widget.cubit.state.roundTrip.flightDetailsTo.city
              : "Enter any City/Airport Name";
    } else if (type == "FROMOneWay") {
      return isFrom
          ? widget.cubit.state.oneWayData.flightDetailsFrom.city.isNotEmpty
              ? widget.cubit.state.oneWayData.flightDetailsFrom.city
              : "Enter any City/Airport Name"
          : widget.cubit.state.oneWayData.flightDetailsTo.city.isNotEmpty
              ? widget.cubit.state.oneWayData.flightDetailsTo.city
              : "Enter any City/Airport Name";
    } else if (type == "MultiCity") {
      // Ensure index is provided and valid
      if (index == null ||
          index < 0 ||
          index >= widget.cubit.state.multiCityBoxes.cities.length) {
        return "Enter any City/Airport Name";
      }

      final cityEntry = widget.cubit.state.multiCityBoxes.cities[index];
      return isFrom
          ? cityEntry.from.city.isNotEmpty
              ? cityEntry.from.city
              : "Enter any City/Airport Name"
          : cityEntry.to.city.isNotEmpty
              ? cityEntry.to.city
              : "Enter any City/Airport Name";
    }

    return "Enter any City/Airport Name"; // Default case
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: BlocBuilder<FlightBookCubit, FlightBookState>(
            bloc: widget.cubit,
            builder: (context, state) {
              final bool isRoundTrip = widget.type.contains("RoundTrip");
              final bool isOneWay = widget.type.contains("OneWay");
              final bool isMultiCity = widget.type.contains("MultiCity");

              final String fromText = getCityName(
                  type: widget.type, isFrom: true, index: widget.index);
              final String toText = getCityName(
                  type: widget.type, isFrom: false, index: widget.index);
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
                                  color: redF8E,
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
                                      SizedBox(width: 21),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonTextWidget.PoppinsMedium(
                                            text: "From",
                                            color: redCA0,
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
                                  color: white,
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
                                    itemCount: state.fromList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: CommonTextWidget.PoppinsRegular(
                                        text: state.fromList[index].city,
                                        color: black2E2,
                                        fontSize: 16,
                                      ),
                                      subtitle: CommonTextWidget.PoppinsRegular(
                                        text: state.fromList[index].airportName,
                                        color: grey717,
                                        fontSize: 12,
                                      ),
                                      trailing: CommonTextWidget.PoppinsMedium(
                                        text: state.fromList[index].iataCode,
                                        color: grey717,
                                        fontSize: 16,
                                      ),
                                    ).toButton(() {
                                      widget
                                          .onIataClicked(state.fromList[index]);
                                      Navigator.pop(context);
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
            }));
  }
}
