import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/domain/entity/city_airports.dart';
import 'package:flymefy/features/Home/domain/entity/flight_search.dart';
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
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            width: context.width,
                            decoration: BoxDecoration(
                              color: grey9B9.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: greyE2E),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Row(
                                children: [
                                  SvgPicture.asset(user),
                                  const SizedBox(width: 15),
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
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                              padding: const EdgeInsets.only(
                                  top: 13, bottom: 13, left: 24, right: 12),
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: white,
                                    border:
                                        Border.all(color: greyE2E, width: 1),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
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
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_forward_ios,
                                      color: redCA0, size: 18),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(color: greyDED, thickness: 1),
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
                                    image: const DecorationImage(
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
                        const SizedBox(height: 20),
                        Container(
                          width: context.width,
                          color: redF9E,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
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
                                    const SizedBox(width: 10),
                                    const Icon(Icons.arrow_forward,
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
  final TravelDetailsType type;
  final VoidCallback? onTap;
  final String image;
  final String cityName;
  final String iataCode;
  final String airportName;
  final DateTime? chosenDate;
  final FlightBookCubit cubit;

  const TravelDetailsBox({
    Key? key,
    required this.type,
    this.onTap,
    required this.image,
    required this.cityName,
    required this.iataCode,
    required this.airportName,
    this.chosenDate,
    required this.cubit,
  }) : super(key: key);

  factory TravelDetailsBox.datePicker({
    required VoidCallback onTap,
    required DateTime? chosenDate,
    required FlightBookCubit cubit,
  }) {
    return TravelDetailsBox(
      type: TravelDetailsType.departureDate,
      image: calendarPlus,
      onTap: onTap,
      cityName: '',
      iataCode: '',
      airportName: '',
      chosenDate: chosenDate,
      cubit: cubit,
    );
  }

  String get _mainTitle {
    if (type.isdepartureDateDatePicker) {
      return chosenDate != null
          ? cubit.formatDateDDMMM(chosenDate!)
          : "Choose Date";
    }
    return cityName.isNotEmpty ? cityName : "Choose City";
  }

  String? get _subtitle {
    if (type.isdepartureDateDatePicker) {
      return chosenDate != null ? cubit.formatDateEEyyyy(chosenDate!) : null;
    }
    return iataCode;
  }

  Color get _titleColor {
    if (type.isdepartureDateDatePicker)
      return chosenDate != null ? black2E2 : redCA0;
    return cityName.isNotEmpty ? black2E2 : redCA0;
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            const SizedBox(width: 15),
            _buildContentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonTextWidget.PoppinsMedium(
          text: type.displayName,
          color: grey888,
          fontSize: 14,
        ),
        Row(
          children: [
            CommonTextWidget.PoppinsSemiBold(
              text: _mainTitle,
              color: _titleColor,
              fontSize: cityName.isEmpty ? 16 : 18,
            ),
            if (_subtitle != null) ...[
              const SizedBox(width: 5),
              CommonTextWidget.PoppinsMedium(
                text: _subtitle!,
                color: grey888,
                fontSize: 12,
              ),
            ]
          ],
        ),
        if (!type.isdepartureDateDatePicker) ...[
          CommonTextWidget.PoppinsRegular(
            text: airportName,
            color: grey888,
            fontSize: 12,
          ),
        ]
      ],
    );
  }
}

enum TravelDetailsType {
  from('FROM'),
  to('TO'),
  departureDate('DEPARTURE DATE'),
  arrivalDate('ARRIVAL DATE');

  final String displayName;
  const TravelDetailsType(this.displayName);

  bool get isdepartureDateDatePicker => this == TravelDetailsType.departureDate;
  bool get isarrivalDateDatePicker => this == TravelDetailsType.arrivalDate;
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
            // Usage
            TravelDetailsBox(
              type: TravelDetailsType.from,
              image: fromFlightImage,
              onTap: () => cubit.navigateToSelection(context, "FROMOneWay"),
              cityName: state.oneWayData.flightDetailsFrom.countryName,
              iataCode: state.oneWayData.flightDetailsFrom.iata,
              airportName: state.oneWayData.flightDetailsFrom.name,
              cubit: cubit,
            ).marginSymmetric(horizontal: 24),
            const SizedBox(
              height: 10,
            ),
            TravelDetailsBox(
              type: TravelDetailsType.to,
              image: toFlightImage,
              onTap: () => cubit.navigateToSelection(context, "TOOneWay"),
              cityName: state.oneWayData.flightDetailsTo.countryName,
              iataCode: state.oneWayData.flightDetailsTo.iata,
              airportName: state.oneWayData.flightDetailsTo.name,
              cubit: cubit,
            ).marginSymmetric(horizontal: 24),
            const SizedBox(
              height: 10,
            ),
            TravelDetailsBox.datePicker(
              onTap: () => Navigator.pushNamed(
                  context, Routes.oneWaycalenderScreen,
                  arguments: {'cubit': cubit}),
              chosenDate: state.oneWayData.dateWhen.isNotEmpty
                  ? DateTime.parse(state.oneWayData.dateWhen)
                  : null,
              cubit: cubit,
            ).marginSymmetric(horizontal: 24),

            const SizedBox(height: 15),
          ]);
        });
  }
}
