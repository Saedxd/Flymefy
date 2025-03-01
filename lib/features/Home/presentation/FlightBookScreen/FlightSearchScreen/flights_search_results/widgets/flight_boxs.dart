import 'package:flutter/material.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/flight_arrival_widget.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/flight_departure_widget.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/flight_duration_widget.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/flight_logo_and_name.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/flight_price_widget.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/flight_table.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/ticket_list_screen.dart';

class FlightBoxDetails extends StatelessWidget {
  const FlightBoxDetails(
      {Key? key, required this.cubit, required this.parentIndex})
      : super(key: key);
  final FlightBookCubit cubit;
  final int parentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        listener: (context, state) async {},
        builder: (context, state) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  context.read<FlightBookCubit>().toggleOpenTicket(parentIndex);
                },
                child: Container(
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        FlightArrivalAndDeparture(
                            cubit: cubit, parentindex: parentIndex),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              FlightTable(cubit: cubit, parentIndex: parentIndex)
            ],
          );
        });
  }
}

class FlightArrivalAndDeparture extends StatelessWidget {
  const FlightArrivalAndDeparture(
      {super.key, required this.cubit, required this.parentindex});
  final FlightBookCubit cubit;
  final int parentindex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        listener: (context, state) async {},
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cubit.state.flights.flights[parentindex]
                        .journeys[0].segments.length,
                    itemBuilder: (context, childIndex) {
                      return [
                        FlightLogoAndName(
                            cubit: cubit,
                            parentindex: parentindex,
                            childIndex: childIndex),
                        const SizedBox(
                          width: 20,
                        ),
                        FlightDepartureWidget(
                          cubit: cubit,
                          parentIndex: parentindex,
                          childIndex: childIndex,
                        ),
                        FlightDurationWidget(
                          cubit: cubit,
                          parentIndex: parentindex,
                          childIndex: childIndex,
                        ),
                        FlightArrivalWidget(
                          cubit: cubit,
                          parentIndex: parentindex,
                          childIndex: childIndex,
                        ),
                      ].toRow();
                    }),
              ),
              FlightPriceWidget(
                cubit: cubit,
                parentIndex: parentindex,
              ),
            ],
          );
        });
  }
}
