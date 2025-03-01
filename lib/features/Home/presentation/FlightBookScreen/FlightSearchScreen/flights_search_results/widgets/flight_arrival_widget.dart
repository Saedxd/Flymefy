import 'package:flutter/material.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';

class FlightArrivalWidget extends StatelessWidget {
  final FlightBookCubit cubit;
  final int parentIndex;
  final int childIndex;

  const FlightArrivalWidget({
    Key? key,
    required this.cubit,
    required this.parentIndex,
    required this.childIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final segment = cubit.state.flights.flights[parentIndex].journeys[0].segments[childIndex];

    return Column(
      children: [
        CommonTextWidget.PoppinsSemiBold(
          text: segment.strArrivalTime,
          color: black2E2,
          fontSize: 14,
        ),
        CommonTextWidget.PoppinsMedium(
          text: segment.arrival,
          color: black2E2,
          fontSize: 10,
        ),
      ],
    );
  }
}
