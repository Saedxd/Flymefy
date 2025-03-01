import 'package:flutter/material.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';

class FlightPriceWidget extends StatelessWidget {
  final FlightBookCubit cubit;
  final int parentIndex;

  const FlightPriceWidget({
    Key? key,
    required this.cubit,
    required this.parentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flight = cubit.state.flights.flights[parentIndex];
    final numStops = flight.journeys[0].segments.length - 1;

    return Column(
      children: [
        CommonTextWidget.PoppinsSemiBold(
          text: "₹ ${flight.totalPrice.toStringAsFixed(2)}",
          color: black2E2,
          fontSize: 14,
        ),
        CommonTextWidget.PoppinsMedium(
          text: "View Prices",
          color: redCA0,
          fontSize: 10,
        ),
        SizedBox(height: 20),
        CommonTextWidget.PoppinsMedium(
          text: numStops < 1 ? "Non Stop" : "$numStops Stop",
          color: grey717,
          fontSize: 10,
        ),
      ],
    );
  }
}
