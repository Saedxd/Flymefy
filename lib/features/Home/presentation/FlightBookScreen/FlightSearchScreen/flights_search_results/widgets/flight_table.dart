import 'package:flutter/material.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flights_search_results/widgets/ticket_list_screen.dart';

class FlightTable extends StatelessWidget {
  final FlightBookCubit cubit;
  final int parentIndex;
  FlightTable({
    Key? key,
    required this.cubit,
    required this.parentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        builder: (context, state) {
          return state.openedTickets[parentIndex] == true
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          "₹ ${cubit.state.flights.flights[parentIndex].totalPrice.toStringAsFixed(2)}",
                                      // .value.totalPrice.toStringAsFixed(2)}",
                                      color: black2E2,
                                      fontSize: 16,
                                    ),
                                    CommonTextWidget.PoppinsRegular(
                                      text: "",
                                      //  "${segment[widget.parentindex].value.availabilityCount} Seats left at this price",
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
                                    cubit.state.flights.flights[parentIndex]
                                        .getBaggageForPassengerType("ADT")[0],
                                    cubit.state.flights.flights[parentIndex]
                                        .adults),
                       
                                baggageCheckInAdults(
                                    cubit.state.flights.flights[parentIndex]
                                        .getBaggageForPassengerType("ADT")[0],
                                    cubit.state.flights.flights[parentIndex]
                                        .adults),
                         
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
                                      text: !cubit
                                              .state
                                              .flights
                                              .flights[parentIndex]
                                              .isCancellationAllowedDynamic
                                          ? "Cancellation not allowed"
                                          : "${cubit.state.flights.flights[parentIndex].getCancellationFeeDynamic("ADT", parentIndex)}",
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
                                      text:
                                          "${cubit.state.flights.flights[parentIndex].getDateChangeFeeDynamic("ADT", parentIndex)}",
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
              : SizedBox();
        });
  }
}
       // if (childBaggage.baggageWeight !=
                                //     null)
                                // baggageCheckInChildren(
                                //     cubit.state.flights
                                //         .flights[parentindex]
                                //         .getBaggageForPassengerType(
                                //             "CHD")[0],
                                //     cubit
                                //         .state
                                //         .flights
                                //         .flights[parentindex]
                                //         .children),
                                // // if (infantBaggage.baggageWeight !=
                                // //     null)
                                // baggageCheckInInfants(
                                //     cubit.state.flights
                                //         .flights[parentindex]
                                //         .getBaggageForPassengerType(
                                //             "INF")[0],
                                //     cubit
                                //         .state
                                //         .flights
                                //         .flights[parentindex]
                                //         .infants),
                                         // baggageCarryOnChildren(
                                //     cubit.state.flights
                                //         .flights[parentindex]
                                //         .getBaggageForPassengerType(
                                //             "CHD")[0],
                                //     cubit
                                //         .state
                                //         .flights
                                //         .flights[parentindex]
                                //         .children),

                                // baggageCarryOnInfants(
                                //     cubit.state.flights
                                //         .flights[parentindex]
                                //         .getBaggageForPassengerType(
                                //             "INF")[0],
                                //     cubit
                                //         .state
                                //         .flights
                                //         .flights[parentindex]
                                //         .infants),
                                // if (adultBaggage.baggageWeight !=
                                //     null)