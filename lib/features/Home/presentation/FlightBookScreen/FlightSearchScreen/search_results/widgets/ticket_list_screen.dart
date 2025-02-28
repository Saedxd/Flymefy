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
                itemCount: state.flightsData.details.entries.toList().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Column(
                      children: [
                        PlainTicketClickableBox(
                          cubit: widget.cubit,
                          index: index,
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
  PlainTicketClickableBox({Key? key, required this.cubit, required this.index})
      : super(key: key);
  final FlightBookCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: PlainTicketClickableBoxScreen(
        cubit: cubit,
        index: index,
      ),
    );
  }
}

class PlainTicketClickableBoxScreen extends StatefulWidget {
  PlainTicketClickableBoxScreen(
      {Key? key, required this.cubit, required this.index})
      : super(key: key);
  final FlightBookCubit cubit;
  final int index;

  @override
  State<PlainTicketClickableBoxScreen> createState() =>
      _plainTicketClickableBoxScreenState();
}

class _plainTicketClickableBoxScreenState
    extends State<PlainTicketClickableBoxScreen> {
  String convertMinutesToHours(int minutes) {
    int hours = minutes ~/ 60; // Integer division to get hours
    return '${hours}h';
  }

  String convertMinutesToRemainingMinutes(int minutes) {
    int remainingMinutes = minutes % 60; // Remainder gives minutes
    return '${remainingMinutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightBookCubit, FlightBookState>(
        bloc: widget.cubit,
        listener: (context, state) async {
          // if (state.flowStateApp == FlowStateApp.success) {
          //   Navigator.pushNamed(context, Routes.flightBookScreen,
          //       arguments: {'cubit': cubit});
          //   widget.cubit.makeDefaultState();
          // }
        },
        builder: (context, state) {
          var flightData =
              state.flightsData.details.entries.toList()[widget.index];
          var journeys = flightData.value.journeys.entries.toList();
          var segment = journeys[widget.index % journeys.length]
              .value
              .segments
              .entries
              .first
              .value;
          var baggageMap = flightData.value.baggageMap.entries;
          var miniRuleMap = flightData.value.miniRuleMap.entries;

          final adultBaggageEntry = baggageMap.firstWhere(
            (entry) => entry.key == "ADT",
            orElse: () => MapEntry("", []),
          );
          final adultBaggage = adultBaggageEntry.value.isNotEmpty
              ? adultBaggageEntry.value.first
              : Baggage();

          final infantBaggageEntry = baggageMap.firstWhere(
            (entry) => entry.key == "INF",
            orElse: () => MapEntry("", []),
          );
          final infantBaggage = infantBaggageEntry.value.isNotEmpty
              ? infantBaggageEntry.value.first
              : Baggage();

          final childBaggageEntry = baggageMap.firstWhere(
            (entry) => entry.key == "CHD",
            orElse: () => MapEntry("", []),
          );
          final childBaggage = childBaggageEntry.value.isNotEmpty
              ? childBaggageEntry.value.first
              : Baggage();
// Check if Cancellation is allowed
          bool isCancellationAllowed = miniRuleMap.any((rule) => rule.value.any(
              (miniRule) =>
                  miniRule.penaltyType == 0 && miniRule.isPermited == 1));

// Check if Date Change is allowed
          bool isDateChangeAllowed = miniRuleMap.any((rule) => rule.value.any(
              (miniRule) =>
                  miniRule.penaltyType == 2 && miniRule.isPermited == 1));

// Get Cancellation Fee
          final cancellationRule =
              miniRuleMap.expand((entry) => entry.value).firstWhere(
                    (miniRule) =>
                        miniRule.penaltyType == 0 && miniRule.isPermited == 1,
                    orElse: () => MiniRule(),
                  );

          final cancellationFee = cancellationRule != null
              ? "Cancellation fee starting ₹ ${cancellationRule.amount}"
              : "Cancellation not allowed";

// Get Date Change Fee
          final dateChangeRule =
              miniRuleMap.expand((entry) => entry.value).firstWhere(
                    (miniRule) =>
                        miniRule.penaltyType == 2 && miniRule.isPermited == 1,
                    orElse: () => MiniRule(),
                  );

          final dateChangeFee = dateChangeRule != null
              ? "Date Change fee starting ₹ ${dateChangeRule.amount}"
              : "Date change not allowed";
          return [
            InkWell(
              onTap: () {
                context.read<FlightBookCubit>().toggleOpenTicket(widget.index);
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
                      Row(
                        children: [
                          Image.asset(
                            spicejet,
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(width: 8),
                          CommonTextWidget.PoppinsMedium(
                            text: segment.airline,
                            color: black2E2,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text: segment.strDepartureTime,
                                color: black2E2,
                                fontSize: 14,
                              ),
                              CommonTextWidget.PoppinsMedium(
                                text: segment.departure,
                                color: black2E2,
                                fontSize: 10,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                      convertMinutesToHours(segment.flightTime),
                                  style: TextStyle(
                                    fontFamily: FontFamily.PoppinsMedium,
                                    fontSize: 12,
                                    color: grey717,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: convertMinutesToRemainingMinutes(
                                          segment.flightTime),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: FontFamily.PoppinsMedium,
                                          color: black2E2),
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
                              CommonTextWidget.PoppinsMedium(
                                text: "Non Stop",
                                color: grey717,
                                fontSize: 10,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text: segment.strArrivalTime,
                                color: black2E2,
                                fontSize: 14,
                              ),
                              CommonTextWidget.PoppinsMedium(
                                text: journeys.first.value.segments.entries
                                    .first.value.arrival,
                                color: black2E2,
                                fontSize: 10,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text:
                                    "₹ ${flightData.value.totalPrice.toStringAsFixed(2)}",
                                color: black2E2,
                                fontSize: 14,
                              ),
                              CommonTextWidget.PoppinsMedium(
                                text: "View Prices",
                                color: redCA0,
                                fontSize: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 20,
                        width: context.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: orangeFFB.withOpacity(0.25),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          child: Row(
                            children: [
                              Icon(Icons.circle, size: 14, color: redCA0),
                              SizedBox(width: 7),
                              CommonTextWidget.PoppinsRegular(
                                text:
                                    "Use MMTBONUS and get FLAT Rs. 970 instant discount",
                                color: black2E2,
                                fontSize: 9,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            state.openedTickets[widget.index] == true
                ? Padding(
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Container(
                        width: context.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextWidget.PoppinsSemiBold(
                                        text: "Spicesaver", //todo : fix this
                                        color: black2E2,
                                        fontSize: 14,
                                      ),
                                      CommonTextWidget.PoppinsRegular(
                                        text: "Fare offered by airline.",
                                        color: grey717,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CommonTextWidget.PoppinsSemiBold(
                                        text:
                                            "₹ ${flightData.value.totalPrice.toStringAsFixed(2)}",
                                        color: black2E2,
                                        fontSize: 16,
                                      ),
                                      CommonTextWidget.PoppinsRegular(
                                        text:
                                            "${segment.availabilityCount} Seats left at this price",
                                        color: redCA0,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Table(
                                columnWidths: {
                                  0: FlexColumnWidth(1.5),
                                  1: FlexColumnWidth(4.5),
                                  2: FlexColumnWidth(6),
                                },
                                children: [
                                  baggageCarryOnAdults(
                                      adultBaggage, flightData.value.adults),
                                  // baggageCarryOnChildren(
                                  //     childBaggage, flightData.value.children),
                                  // baggageCarryOnInfants(
                                  //     infantBaggage, flightData.value.infants),
                                  // if (adultBaggage.baggageWeight != null)
                                  baggageCheckInAdults(
                                      adultBaggage, flightData.value.adults),
                                  // if (childBaggage.baggageWeight != null)
                                  //   baggageCheckInChildren(childBaggage,
                                  //       flightData.value.children),
                                  // if (infantBaggage.baggageWeight != null)
                                  //   baggageCheckInInfants(infantBaggage,
                                  //       flightData.value.infants),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, right: 10),
                                        child: SvgPicture.asset(currencyInr),
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: "Cancellation",
                                        color: black2E2,
                                        fontSize: 12,
                                      ),
                                      CommonTextWidget.PoppinsRegular(
                                        text: !isDateChangeAllowed
                                            ? "Cancellation not allowed"
                                            : "Cancellation fee starting ₹ ${cancellationRule.amount}",
                                        color: grey717,
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, right: 10),
                                        child: SvgPicture.asset(calendarPlus1,
                                            color: redCA0),
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: "Date Change",
                                        color: black2E2,
                                        fontSize: 12,
                                      ),
                                      CommonTextWidget.PoppinsRegular(
                                        text: !isDateChangeAllowed
                                            ? "Date change not allowed"
                                            : "Date Change fee starting ₹ ${dateChangeRule.amount}",
                                        color: grey717,
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, right: 10),
                                        child: SvgPicture.asset(seat),
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: "Seat",
                                        color: black2E2,
                                        fontSize: 12,
                                      ),
                                      CommonTextWidget.PoppinsRegular(
                                        text: "Free Seat available",
                                        color: grey717,
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: SvgPicture.asset(dish),
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: "Meal",
                                        color: black2E2,
                                        fontSize: 12,
                                      ),
                                      CommonTextWidget.PoppinsRegular(
                                        text: "Get complimentary",
                                        color: grey717,
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              CommonButtonWidget(
                                buttonColor: redCA0,
                                onTap: () {
                                  //  Get.to(() => FlightDetailScreen());
                                  Navigator.pushNamed(
                                      context, Routes.flightDetailScreen);
                                },
                                text: "Book Now",
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).toButton(() {
                    Navigator.pushNamed(context, Routes.priceAlertScreen);
                  })
                : SizedBox()
          ].toColumn();
        });
  }
}

// Helper function to parse baggage amount
String parseBaggageAmount(String baggage, int num) {
  final amount =
      baggage.replaceAll(RegExp(r'[^0-9]'), ''); // Extract the number part
  return "${amount.isNotEmpty ? int.parse(amount) * num : 0.0} pcs";
}

// Helper function to parse baggage weight
String parseBaggageWeight(String baggage, int num) {
  final weight =
      baggage.replaceAll(RegExp(r'[^0-9]'), ''); // Extract the number part
  return "${weight.isNotEmpty ? int.parse(weight) * num : 0.0} kg";
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
            Text("Carry On Adults",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(
              "${parseBaggageAmount(adultBaggage.carryOnAmount, adults)} ${parseBaggageWeight(adultBaggage.carryOnWeight, adults)}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(); // If no adults, return an empty widget
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
              "${parseBaggageAmount(childBaggage.carryOnAmount, children)} ${parseBaggageWeight(childBaggage.carryOnWeight, children)}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(); // If no children, return an empty widget
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
              "${parseBaggageAmount(infantBaggage.carryOnAmount, infants)} ${parseBaggageWeight(infantBaggage.carryOnWeight, infants)}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(); // If no infants, return an empty widget
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
            Text("Check-in Adults",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(
              "${parseBaggageAmount(adultBaggage.baggageAmount, adults)} ${parseBaggageWeight(adultBaggage.baggageWeight!, adults)}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(); // If no adults, return an empty widget
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
              "${parseBaggageAmount(childBaggage.baggageAmount, children)} ${parseBaggageWeight(childBaggage.baggageWeight!, children)}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(); // If no children, return an empty widget
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
              "${parseBaggageAmount(infantBaggage.baggageAmount, infants)} ${parseBaggageWeight(infantBaggage.baggageWeight!, infants)}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      : TableRow(); // If no infants, return an empty widget
}
