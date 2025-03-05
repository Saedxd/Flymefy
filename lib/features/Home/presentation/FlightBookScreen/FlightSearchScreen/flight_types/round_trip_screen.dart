import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/domain/entity/city_airports.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flight_types/one_way_screen.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flight_types/widgets/travelers_and_class_bottom_sheet.dart';
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
                                            text:
                                                "${state.roundTrip.totalTravellers},",
                                            color: black2E2,
                                            fontSize: 18,
                                          ),
                                          CommonTextWidget.PoppinsMedium(
                                            text:
                                                "${state.roundTrip.classType} Class",
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
  const TravelBoxesRoundTrips({super.key, required this.cubit});
  final FlightBookCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBookCubit, FlightBookState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            _buildCityBox(
              context: context,
              cubit: cubit,
              type: TravelDetailsType.from,
              image: fromFlightImage,
              cityName: state.roundTrip.flightDetailsFrom.countryCode,
              iataCode: state.roundTrip.flightDetailsFrom.iata,
              airportName: state.roundTrip.flightDetailsFrom.name,
              onSelect: (selected) =>
                  cubit.selectFromCityTypeRoundTrip(selected),
            ),
            const SizedBox(height: 10),
            _buildCityBox(
              context: context,
              cubit: cubit,
              type: TravelDetailsType.to,
              image: toFlightImage,
              cityName: state.roundTrip.flightDetailsTo.countryName,
              iataCode: state.roundTrip.flightDetailsTo.iata,
              airportName: state.roundTrip.flightDetailsTo.name,
              onSelect: (selected) => cubit.selectToCityTypeRoundTrip(selected),
            ),
            const SizedBox(height: 10),
            _buildDatePicker(
              context: context,
              cubit: cubit,
              type: TravelDetailsType.departureDate,
              date: state.roundTrip.departureDate,
              routeType: "DEPARTURE",
            ),
            const SizedBox(height: 10),
            _buildDatePicker(
              cubit: cubit,
              context: context,
              type: TravelDetailsType.arrivalDate,
              date: state.roundTrip.arrivalDate,
              routeType: "ARRIVAL",
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }

  Widget _buildCityBox({
    required BuildContext context,
    required TravelDetailsType type,
    required String image,
    required String cityName,
    required String iataCode,
    required String airportName,
    required Function(CityAirport) onSelect,
    required FlightBookCubit cubit,
  }) {
    return TravelDetailsBox(
      type: type,
      image: image,
      cityName: cityName,
      iataCode: iataCode,
      airportName: airportName,
      cubit: cubit,
      onTap: () => _navigateToCitySelection(
        context,
        type: type,
        onSelect: onSelect,
      ),
    ).marginSymmetric(horizontal: 24);
  }

  void _navigateToCitySelection(
    BuildContext context, {
    required TravelDetailsType type,
    required Function(CityAirport) onSelect,
  }) {
    Navigator.pushNamed(
      context,
      type == TravelDetailsType.from
          ? Routes.flightFromScreen
          : Routes.flightToScreen,
      arguments: {
        'cubit': cubit,
        'type': "${type.displayName}RoundTrip",
        'onIataClicked': (CityAirport selected) => onSelect(selected),
      },
    );
  }

  Widget _buildDatePicker({
    required BuildContext context,
    required TravelDetailsType type,
    required String? date,
    required String routeType,
    required FlightBookCubit cubit,
  }) {
    return TravelDetailsBox.datePicker(
      chosenDate: date != null ? DateTime.tryParse(date) : null,
      cubit: cubit,
      onTap: () => Navigator.pushNamed(
        context,
        Routes.roundTripCalender,
        arguments: {
          'cubit': cubit,
          'type': routeType,
        },
      ),
    ).marginSymmetric(horizontal: 24);
  }
}
