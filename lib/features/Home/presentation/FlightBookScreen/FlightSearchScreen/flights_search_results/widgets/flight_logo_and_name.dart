import 'package:flutter/material.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';

class FlightLogoAndName extends StatelessWidget {
  const FlightLogoAndName(
      {Key? key,
      required this.cubit,
      required this.parentindex,
      required this.childIndex})
      : super(key: key);
  final FlightBookCubit cubit;
  final int parentindex;
  final int childIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        listener: (context, state) async {},
        builder: (context, state) {
          return Row(
            children: [
              Image.asset(
                spicejet,
                height: 30,
                width: 30,
              ),
              SizedBox(width: 8),
              // CommonTextWidget.PoppinsMedium(
              //   text: cubit.state.flights.flights[parentindex].journeys[0]
              //       .segments[childIndex].airline,
              //   color: black2E2,
              //   fontSize: 12,
              // ),
            ],
          );
        });
  }
}
