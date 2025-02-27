import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/from_to_screens/flight_from_screen.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/main.dart';

class FlightsTo extends StatelessWidget {
  const FlightsTo(
      {Key? key,
      required this.cubit,
      required this.onIataClicked,
      required this.type})
      : super(key: key);
  final FlightBookCubit cubit;
  final Function(FlightDetails) onIataClicked;
  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: FlightToScreen(
          cubit: cubit,
          onIataClicked: onIataClicked,
          type: type,
        ));
  }
}

class FlightToScreen extends StatelessWidget {
  FlightToScreen(
      {Key? key,
      required this.cubit,
      required this.onIataClicked,
      required this.type})
      : super(key: key);
  final FlightBookCubit cubit;
  final Function(FlightDetails) onIataClicked;
  final String type;

  /// Method to get city name for "From" and "To" text fields
  String getCityName({required bool isRoundTrip, required bool isFrom}) {
    if (isRoundTrip) {
      return isFrom
          ? cubit.state.roundTrip.flightDetailsFrom.city.isNotEmpty
              ? cubit.state.roundTrip.flightDetailsFrom.city
              : "Enter any City/Airport Name"
          : cubit.state.roundTrip.flightDetailsTo.city.isNotEmpty
              ? cubit.state.roundTrip.flightDetailsTo.city
              : "Enter any City/Airport Name";
    } else {
      return isFrom
          ? cubit.state.oneWayData.flightDetailsFrom.city.isNotEmpty
              ? cubit.state.oneWayData.flightDetailsFrom.city
              : "Enter any City/Airport Name"
          : cubit.state.oneWayData.flightDetailsTo.city.isNotEmpty
              ? cubit.state.oneWayData.flightDetailsTo.city
              : "Enter any City/Airport Name";
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isRoundTrip = type.contains("RoundTrip");
    final bool isFrom = type.contains("FROM");

    final String fromText = getCityName(isRoundTrip: isRoundTrip, isFrom: true);
    final String toText = getCityName(isRoundTrip: isRoundTrip, isFrom: false);

    return Scaffold(
      backgroundColor: white,
      body: BlocBuilder<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        builder: (context, state) {
          return state.flowStateApp == FlowStateApp.loading
              ? const LoadinContent()
              : state.flowStateApp == FlowStateApp.error
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
                                itemCount: state.toList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: CommonTextWidget.PoppinsRegular(
                                    text: state.toList[index].city,
                                    color: black2E2,
                                    fontSize: 16,
                                  ),
                                  subtitle: CommonTextWidget.PoppinsRegular(
                                    text: state.toList[index].airportName,
                                    color: grey717,
                                    fontSize: 12,
                                  ),
                                  trailing: CommonTextWidget.PoppinsMedium(
                                    text: state.toList[index].iataCode,
                                    color: grey717,
                                    fontSize: 16,
                                  ),
                                ).toButton(() {
                                  onIataClicked(state.toList[index]);
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
