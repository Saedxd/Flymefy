import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flight_types/widgets/travelers_and_class_bottom_sheet.dart';
import 'package:flymefy/main.dart';
import 'package:intl/intl.dart';

class OneWayS extends StatelessWidget {
  const OneWayS({Key? key, required this.cubit}) : super(key: key);
  final FlightBookCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: OneWayScreen(
          cubit: cubit,
        ));
  }
}

class OneWayScreen extends StatelessWidget {
  OneWayScreen({Key? key, required this.cubit}) : super(key: key);
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
                        TravelBoxes(
                          cubit: cubit,
                        ),
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
                                            text:
                                                "${state.oneWayData.totalTravellers},",
                                            color: black2E2,
                                            fontSize: 18,
                                          ),
                                          CommonTextWidget.PoppinsMedium(
                                            text:
                                                "${state.oneWayData.classType} Class",
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
                        ).toButton(() async {
                          await showCustomModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return TravelersAndClassBottomSheet(
                                cubit: cubit,
                              );
                            },
                          );
                        }),
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
                              context
                                  .read<FlightBookCubit>()
                                  .assignDataToTheRequest(FlightType.oneWay);
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
                              //   Get.to(() => OfferMakeYourTripScreen());
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

class TravelDetailsBox extends StatelessWidget {
  const TravelDetailsBox({
    Key? key,
    this.onTap,
    required this.image,
    required this.cityName,
    required this.iataName,
    required this.type,
    required this.airportName,
    required this.chosenDate,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String image;
  final String cityName;
  final String iataName;
  final String type;
  final String airportName;
  final String chosenDate;

  String formatDatePart1(DateTime date) {
    // Format for "22 Sep"
    final DateFormat formatterPart1 = DateFormat('dd MMM');
    return formatterPart1.format(date);
  }

  String formatDatePart2(DateTime date) {
    // Format for "Thursday, 2022"
    final DateFormat formatterPart2 = DateFormat('EEEE, yyyy');
    return formatterPart2.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: grey9B9.withOpacity(0.15),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: greyE2E),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
              ),
              SizedBox(width: 15),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextWidget.PoppinsMedium(
                      text: type,
                      color: grey888,
                      fontSize: 14,
                    ),
                    Row(
                      children: [
                        CommonTextWidget.PoppinsSemiBold(
                          text: cityName.isEmpty
                              ? (type == "DEPARTURE DATE" ||
                                      type == "ARRIVAL DATE"
                                  ? (chosenDate.isEmpty
                                      ? "Choose Date"
                                      : formatDatePart1(
                                          DateTime.parse(chosenDate)))
                                  : (cityName.isEmpty
                                      ? "Choose City"
                                      : cityName))
                              : (type == "DEPARTURE DATE" ||
                                      type == "ARRIVAL DATE"
                                  ? (chosenDate.isEmpty
                                      ? "Choose Date"
                                      : formatDatePart1(
                                          DateTime.parse(chosenDate)))
                                  : cityName),
                          color: (cityName.isNotEmpty || chosenDate.isNotEmpty)
                              ? black2E2
                              : redCA0,
                          fontSize: cityName.isEmpty ? 16 : 18,
                        ),
                        chosenDate.isNotEmpty
                            ? SizedBox(
                                width: 5,
                              )
                            : SizedBox(),
                        CommonTextWidget.PoppinsMedium(
                          text: chosenDate.isEmpty
                              ? iataName
                              : formatDatePart2(DateTime.parse(chosenDate)),
                          color: grey888,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    CommonTextWidget.PoppinsRegular(
                      text: airportName,
                      color: grey888,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TravelBoxes extends StatelessWidget {
  const TravelBoxes({
    Key? key,
    required this.cubit,
  });

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
                      'type': "FROMOneWay",
                      'onIataClicked': (FlightDetails selectedFlight) {
                        context
                            .read<FlightBookCubit>()
                            .selectFromCityTypeOneWay(selectedFlight);
                      }
                    });
              },
              cityName: state.oneWayData.flightDetailsFrom.city,
              iataName: state.oneWayData.flightDetailsFrom.iataCode,
              airportName: state.oneWayData.flightDetailsFrom.airportName,
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
                  'type': "TOOneWay",
                  'onIataClicked': (FlightDetails selectedFlight) {
                    context
                        .read<FlightBookCubit>()
                        .selectToCityTypeOneWay(selectedFlight);
                  }
                });
              },
              cityName: state.oneWayData.flightDetailsTo.city,
              iataName: state.oneWayData.flightDetailsTo.iataCode,
              airportName: state.oneWayData.flightDetailsTo.airportName,
              chosenDate: "",
            ).marginSymmetric(horizontal: 24),
            SizedBox(
              height: 10,
            ),
            TravelDetailsBox(
              image: calendarPlus,
              type: "DEPARTURE DATE",
              onTap: () {
                Navigator.pushNamed(context, Routes.oneWaycalenderScreen,
                    arguments: {
                      'cubit': cubit,
                    });
              },
              cityName: '',
              iataName: '',
              airportName: '',
              chosenDate: state.oneWayData.dateWhen,
            ).marginSymmetric(horizontal: 24),
            SizedBox(height: 15),
          ]);
        });
  }
}
