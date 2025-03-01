import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/domain/entity/flight_search.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';

import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/flight_boxs.dart';
import 'package:flymefy/main.dart';

class PlanTicketsOffersList extends StatelessWidget {
  PlanTicketsOffersList({Key? key, required this.cubit}) : super(key: key);
  final FlightBookCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: PlanTicketsOffersListScreen(
        cubit: cubit,
      ),
    );
  }
}

class PlanTicketsOffersListScreen extends StatefulWidget {
  PlanTicketsOffersListScreen({Key? key, required this.cubit})
      : super(key: key);
  final FlightBookCubit cubit;

  @override
  State<PlanTicketsOffersListScreen> createState() =>
      _PlanTicketsOffersListScreenScreenState();
}

class _PlanTicketsOffersListScreenScreenState
    extends State<PlanTicketsOffersListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightBookCubit, FlightBookState>(
        bloc: widget.cubit,
        listener: (context, state) async {},
        builder: (context, state) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                itemCount: widget.cubit.state.flights.flights.length,
                itemBuilder: (context, parentIndex) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Column(
                      children: [
                        PlainTicketClickableBox(
                          cubit: widget.cubit,
                          parentIndex: parentIndex,
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}

class PlainTicketClickableBox extends StatelessWidget {
  PlainTicketClickableBox(
      {Key? key, required this.cubit, required this.parentIndex})
      : super(key: key);
  final FlightBookCubit cubit;
  final int parentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: PlainTicketClickableBoxScreen(
        cubit: cubit,
        parentIndex: parentIndex,
      ),
    );
  }
}

class PlainTicketClickableBoxScreen extends StatefulWidget {
  PlainTicketClickableBoxScreen(
      {Key? key, required this.cubit, required this.parentIndex})
      : super(key: key);
  final FlightBookCubit cubit;
  final int parentIndex;

  @override
  State<PlainTicketClickableBoxScreen> createState() =>
      _plainTicketClickableBoxScreenState();
}

class _plainTicketClickableBoxScreenState
    extends State<PlainTicketClickableBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightBookCubit, FlightBookState>(
        bloc: widget.cubit,
        listener: (context, state) async {},
        builder: (context, state) {
          return [
            FlightBoxDetails(
              parentIndex: widget.parentIndex,
              cubit: widget.cubit,
            ),
          ].toColumn();
        });
  }
}

// Widget for adults carry-on baggage
TableRow baggageCarryOnAdults(Baggage adultBaggage, int adults) {
  return adults != 0
      ? TableRow(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, right: 10),
              child: SvgPicture.asset(briefcase),
            ),
            Text("Carry On",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(
              "${adultBaggage.carryOnAmount} ${adultBaggage.carryOnWeight}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(children: [
          SizedBox(),
          SizedBox(),
          SizedBox()
        ]); // If no adults, return an empty widget
}

// Widget for children carry-on baggage
TableRow baggageCarryOnChildren(Baggage childBaggage, int children) {
  return children != 0
      ? TableRow(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, right: 10),
              child: SvgPicture.asset(briefcase),
            ),
            Text("Carry On Children",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(
              "${childBaggage.carryOnAmount} ${childBaggage.carryOnWeight}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(children: [
          SizedBox(),
          SizedBox(),
          SizedBox()
        ]); // If no children, return an empty widget
}

// Widget for infants carry-on baggage
TableRow baggageCarryOnInfants(Baggage infantBaggage, int infants) {
  return infants != 0
      ? TableRow(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, right: 10),
              child: SvgPicture.asset(briefcase),
            ),
            Text("Carry On Infants",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(
              "${infantBaggage.carryOnAmount} ${infantBaggage.carryOnWeight}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(children: [
          SizedBox(),
          SizedBox(),
          SizedBox()
        ]); // If no infants, return an empty widget
}

// Widget for adults check-in baggage
TableRow baggageCheckInAdults(Baggage adultBaggage, int adults) {
  return adults != 0
      ? TableRow(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, right: 10),
              child: SvgPicture.asset(backpack),
            ),
            Text("Check-in",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(
              "${adultBaggage.baggageAmount} ${adultBaggage.baggageWeight!}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(children: [
          SizedBox(),
          SizedBox(),
          SizedBox()
        ]); // If no adults, return an empty widget
}

// Widget for children check-in baggage
TableRow baggageCheckInChildren(Baggage childBaggage, int children) {
  return children != 0
      ? TableRow(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, right: 10),
              child: SvgPicture.asset(backpack),
            ),
            Text("Check-in Children",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(
              "${(childBaggage.baggageAmount)} ${(childBaggage.baggageWeight!)}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(children: [
          SizedBox(),
          SizedBox(),
          SizedBox()
        ]); // If no children, return an empty widget
}

// Widget for infants check-in baggage
TableRow baggageCheckInInfants(Baggage infantBaggage, int infants) {
  return infants != 0
      ? TableRow(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, right: 10),
              child: SvgPicture.asset(backpack),
            ),
            Text("Check-in Infants",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(
              "${(infantBaggage.baggageAmount)} ${(infantBaggage.baggageWeight!)}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(children: [
          SizedBox(),
          SizedBox(),
          SizedBox()
        ]); // If no infants, return an empty widget
}
