
import 'package:flutter/material.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';

class FlightDurationWidget extends StatelessWidget {
  final FlightBookCubit cubit;
  final int parentIndex;
  final int childIndex;

  const FlightDurationWidget({
    Key? key,
    required this.cubit,
    required this.parentIndex,
    required this.childIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final segment = cubit.state.flights.flights[parentIndex].journeys[0].segments[childIndex];
    final duration = context.read<FlightBookCubit>().convertMinutesToHours(segment.flightTime);
    final remainingMinutes = context.read<FlightBookCubit>().convertMinutesToRemainingMinutes(segment.flightTime);

    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: duration,
            style: TextStyle(
              fontFamily: FontFamily.PoppinsMedium,
              fontSize: 12,
              color: grey717,
            ),
            children: <TextSpan>[
              TextSpan(
                text: remainingMinutes,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamily.PoppinsMedium,
                  color: black2E2,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 3,
          width: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: redCA0.withOpacity(0.25),
          ),
        ),
      ],
    );
  }
}
