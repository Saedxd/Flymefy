import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flight_types/one_way_screen.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/main.dart';

class RoundTripS extends StatelessWidget {
  RoundTripS({Key? key, required this.cubit}) : super(key: key);
  final FlightBookCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: RoundTripScreen(
          cubit: cubit,
        ));
  }
}

class RoundTripScreen extends StatelessWidget {
  RoundTripScreen({Key? key, required this.cubit}) : super(key: key);
  final FlightBookCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        listener: (context, state) async {
          if (state.flowStateApp == FlowStateApp.success) {
            Navigator.pushNamed(context, Routes.flightBookScreen,
                arguments: {'cubit': cubit});
            cubit.makeDefaultState();
          }
        },
        builder: (context, state) {
          return state.flowStateApp == FlowStateApp.loading
              ? const LoadinContent()
              : ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TravelBoxesRoundTrips(cubit: cubit),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            width: context.width,
                            decoration: BoxDecoration(
                              color: grey9B9.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: greyE2E),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Row(
                                children: [
                                  SvgPicture.asset(user),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextWidget.PoppinsMedium(
                                        text: "TRAVELLERS & CLASS",
                                        color: grey888,
                                        fontSize: 14,
                                      ),
                                      Row(
                                        children: [
                                          CommonTextWidget.PoppinsSemiBold(
                                            text: "1,",
                                            color: black2E2,
                                            fontSize: 18,
                                          ),
                                          CommonTextWidget.PoppinsMedium(
                                            text: "TEconomy/Premium Economy",
                                            color: grey888,
                                            fontSize: 14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: CommonTextWidget.PoppinsMedium(
                            text: "SPECIAL FARES (OPTIONAL)",
                            color: grey888,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: context.width,
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: ListView.builder(
                              itemCount: Lists.flightSearchList2.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(
                                  top: 13, bottom: 13, left: 24, right: 12),
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: white,
                                    border:
                                        Border.all(color: greyE2E, width: 1),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: CommonTextWidget.PoppinsMedium(
                                        text: Lists.flightSearchList2[index],
                                        color: grey5F5,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: CommonButtonWidget(
                            buttonColor: redCA0,
                            onTap: () {
                              //Get.to(() => FlightBookScreen());
                              // Navigator.pushNamed(
                              //     context, Routes.flightBookScreen);
                              context
                                  .read<FlightBookCubit>()
                                  .assignDataToTheRequest(FlightType.roundTrip);
                            },
                            text: "SEARCH FLIGHTS",
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text: "OFFERS",
                                color: black2E2,
                                fontSize: 16,
                              ),
                              Row(
                                children: [
                                  CommonTextWidget.PoppinsRegular(
                                    text: "View All",
                                    color: redCA0,
                                    fontSize: 14,
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward_ios,
                                      color: redCA0, size: 18),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: greyDED, thickness: 1),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            onTap: () {
                              //  Get.to(() => OfferMakeYourTripScreen());
                              Navigator.pushNamed(
                                  context, Routes.offerMakeYourTripScreen);
                            },
                            child: CarouselSlider.builder(
                              itemCount: 4,
                              itemBuilder: (context, index, realIndex) =>
                                  Container(
                                height: 170,
                                width: context.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(flightSearchImage),
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high)),
                              ),
                              options: CarouselOptions(
                                  autoPlay: true,
                                  height: 170,
                                  enableInfiniteScroll: true,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    // realStateController.sliderIndex.value = index;
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: context.width,
                          color: redF9E,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget.PoppinsRegular(
                                  text:
                                      "Explore the cheapest flight from New Delhi to Mumbai",
                                  color: black2E2,
                                  fontSize: 14,
                                ),
                                Row(
                                  children: [
                                    CommonTextWidget.PoppinsMedium(
                                      text: "EXPLORE FARE CALENDAR",
                                      color: redCA0,
                                      fontSize: 14,
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.arrow_forward,
                                        color: redCA0, size: 16),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}

class TravelBoxesRoundTrips extends StatelessWidget {
  const TravelBoxesRoundTrips({Key? key, required this.cubit})
      : super(key: key);
  final FlightBookCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(children: [
            TravelDetailsBox(
              image: fromFlightImage,
              type: "FROM",
              onTap: () {
                Navigator.pushNamed(context, Routes.flightFromScreen,
                    arguments: {
                      'cubit': cubit,
                      'type': "FROMRoundTrip",
                      'onIataClicked': (FlightDetails selectedFlight) {
                        context
                            .read<FlightBookCubit>()
                            .selectFromCityTypeRoundTrip(selectedFlight);
                      }
                    });
              },
              cityName: state.roundTrip.flightDetailsFrom.city,
              iataName: state.roundTrip.flightDetailsFrom.iataCode,
              airportName: state.roundTrip.flightDetailsFrom.airportName,
              chosenDate: "",
            ).marginSymmetric(horizontal: 24),
            SizedBox(
              height: 10,
            ),
            TravelDetailsBox(
              image: toFlightImage,
              type: "TO",
              onTap: () {
                Navigator.pushNamed(context, Routes.flightToScreen, arguments: {
                  'cubit': cubit,
                  'type': "TORoundTrip",
                  'onIataClicked': (FlightDetails selectedFlight) {
                    context
                        .read<FlightBookCubit>()
                        .selectToCityTypeRoundTrip(selectedFlight);
                  }
                });
              },
              cityName: state.roundTrip.flightDetailsTo.city,
              iataName: state.roundTrip.flightDetailsTo.iataCode,
              airportName: state.roundTrip.flightDetailsTo.airportName,
              chosenDate: "",
            ).marginSymmetric(horizontal: 24),
            SizedBox(
              height: 10,
            ),
            TravelDetailsBox(
              image: calendarPlus,
              type: "DEPARTURE DATE",
              onTap: () {
                Navigator.pushNamed(context, Routes.roundTripCalender,
                    arguments: {'cubit': cubit, 'type': "DEPARTURE"});
              },
              cityName: '',
              iataName: '',
              airportName: '',
              chosenDate: state.roundTrip.departureDate,
            ).marginSymmetric(horizontal: 24),
            SizedBox(
              height: 10,
            ),
            TravelDetailsBox(
              image: calendarPlus,
              type: "ARRIVAL DATE",
              onTap: () {
                Navigator.pushNamed(context, Routes.roundTripCalender,
                    arguments: {'cubit': cubit, 'type': "ARRIVAL"});
              },
              cityName: '',
              iataName: '',
              airportName: '',
              chosenDate: state.roundTrip.arrivalDate,
            ).marginSymmetric(horizontal: 24),
            SizedBox(height: 15),
          ]);
        });
  }
}
