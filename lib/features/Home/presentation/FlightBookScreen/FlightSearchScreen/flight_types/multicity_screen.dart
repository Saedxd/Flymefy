import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/domain/entity/city_airports.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';

import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flight_types/widgets/travelers_and_class_bottom_sheet.dart';
import 'package:flymefy/main.dart';
import 'package:intl/intl.dart';

class MultiCityS extends StatelessWidget {
  MultiCityS({Key? key, required this.cubit}) : super(key: key);
  final FlightBookCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: MultiCityScreen(
          cubit: cubit,
        ));
  }
}

class MultiCityScreen extends StatelessWidget {
  MultiCityScreen({Key? key, required this.cubit}) : super(key: key);
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 24),
                        //   child: Image.asset(multicityImage),
                        // ),
                        // SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            width: context.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: CommonTextWidget.PoppinsMedium(
                                    text: "FROM",
                                    color: const Color.fromARGB(
                                        255, 178, 174, 174),
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: CommonTextWidget.PoppinsMedium(
                                    text: "TO",
                                    color: const Color.fromARGB(
                                        255, 178, 174, 174),
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 105,
                                  child: CommonTextWidget.PoppinsMedium(
                                    text: "DATE",
                                    color: const Color.fromARGB(
                                        255, 178, 174, 174),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MultiCityFlightEntries(cubit: cubit),
                        const SizedBox(height: 15),
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
                                            text: "${state.multiCity.adults},",
                                            color: black2E2,
                                            fontSize: 18,
                                          ),
                                          CommonTextWidget.PoppinsMedium(
                                            text:
                                                "${state.multiCity.classType} Class",
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
                              // Navigator.pushNamed(
                              //     context, Routes.flightBookScreen);
                              context
                                  .read<FlightBookCubit>()
                                  .assignDataToTheRequest(FlightType.multiCity);
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

class MultiCityFlightEntries extends StatelessWidget {
  final FlightBookCubit cubit;

  const MultiCityFlightEntries({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<FlightBookCubit, FlightBookState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildCityEntriesList(state),
              const SizedBox(height: 15),
              _buildAddRemoveButton(state),
              const SizedBox(height: 15),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCityEntriesList(FlightBookState state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.multiCity.cities.length,
      itemBuilder: (context, index) {
        final entry = state.multiCity.cities[index];
        return _CityEntryRow(
          cubit: cubit,
          index: index,
          entry: entry,
        );
      },
    );
  }

  Widget _buildAddRemoveButton(FlightBookState state) {
    return _AddRemoveButton(
      cubit: cubit,
      showAdd: state.multiCity.cities.length < 2,
    );
  }
}

class _CityEntryRow extends StatelessWidget {
  final FlightBookCubit cubit;
  final int index;
  final CityEntry entry;

  const _CityEntryRow({
    required this.cubit,
    required this.index,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CitySelectorBox(
            cubit: cubit,
            index: index,
            type: TravelEntryType.fromCity,
            entry: entry.from,
          ),
          const SizedBox(width: 15),
          _CitySelectorBox(
            cubit: cubit,
            index: index,
            type: TravelEntryType.toCity,
            entry: entry.to,
          ),
          const SizedBox(width: 15),
          _DateSelectorBox(
            cubit: cubit,
            index: index,
            date: entry.date,
          ),
          if (entry.date.isEmpty) ...[
            const SizedBox(width: 5),
            _RemoveButton(cubit: cubit, index: index),
          ],
        ],
      ),
    );
  }
}

class _CitySelectorBox extends StatelessWidget {
  final FlightBookCubit cubit;
  final int index;
  final TravelEntryType type;
  final CityAirport entry;

  const _CitySelectorBox({
    required this.cubit,
    required this.index,
    required this.type,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: _CityDateEntryBox(
        isEmpty: entry.countryName.isEmpty,
        label: type.name,
        content: entry.countryName.isEmpty ? null : entry.iata,
        subtitle: entry.countryName,
        onTap: () => _handleCitySelection(context),
      ),
    );
  }

  void _handleCitySelection(BuildContext context) {
    final route = type == TravelEntryType.fromCity
        ? Routes.flightFromScreen
        : Routes.flightToScreen;

    Navigator.pushNamed(context, route, arguments: {
      'cubit': cubit,
      'index': index,
      'onSelect': (CityAirport selected) => type == TravelEntryType.fromCity
          ? cubit.updateCityEntryFrom(index, selected)
          : cubit.updateCityEntryTo(index, selected),
    });
  }
}

class _DateSelectorBox extends StatelessWidget {
  final FlightBookCubit cubit;
  final int index;
  final String date;

  const _DateSelectorBox({
    required this.cubit,
    required this.index,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: date.isEmpty
          ? _DatePlaceholderBox(cubit: cubit, index: index)
          : _CityDateEntryBox(
              isEmpty: false,
              label: 'DATE',
              content: cubit.formatDateDDMMM(DateTime.parse(date)),
              subtitle: cubit.formatDateEEyyyy(DateTime.parse(date)),
              onTap: () => _handleDateSelection(context),
            ),
    );
  }

  void _handleDateSelection(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.multiCityCalender,
      arguments: {'cubit': cubit, 'index': index},
    );
  }
}

class _CityDateEntryBox extends StatelessWidget {
  final bool isEmpty;
  final String label;
  final String? content;
  final String? subtitle;
  final VoidCallback? onTap;

  const _CityDateEntryBox({
    required this.isEmpty,
    required this.label,
    this.content,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 60,
        decoration: BoxDecoration(
          color: isEmpty ? const Color(0xfff5c6cb) : grey9B9.withOpacity(0.15),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: isEmpty ? 1.5 : 0.1,
            color: isEmpty ? Colors.red : black2E2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (isEmpty) {
      return Text(
        label,
        style: const TextStyle(
          color: Color.fromARGB(255, 194, 44, 33),
          fontSize: 17,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonTextWidget.PoppinsMedium(
          text: content ?? '',
          color: black2E2,
          fontSize: 16,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 5),
          SizedBox(
            width: 90,
            child: Text(
              subtitle!,
              style: const TextStyle(
                color: Color.fromARGB(255, 174, 165, 165),
                fontSize: 11,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _DatePlaceholderBox extends StatelessWidget {
  final FlightBookCubit cubit;
  final int index;

  const _DatePlaceholderBox({
    required this.cubit,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: InkWell(
        onTap: () => _handleDateSelection(context),
        child: Container(
          width: 67,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xfff5c6cb),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1.5, color: Colors.red),
          ),
          child: const Center(
            child: Text(
              "Date",
              style: TextStyle(
                color: Color.fromARGB(255, 194, 44, 33),
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleDateSelection(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.multiCityCalender,
      arguments: {'cubit': cubit, 'index': index},
    );
  }
}

class _RemoveButton extends StatelessWidget {
  final FlightBookCubit cubit;
  final int index;

  const _RemoveButton({
    required this.cubit,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: IconButton(
        icon: const Icon(Icons.close, size: 25, color: Colors.black),
        onPressed: () => cubit.removeCityEntry(index),
      ),
    );
  }
}

class _AddRemoveButton extends StatelessWidget {
  final FlightBookCubit cubit;
  final bool showAdd;

  const _AddRemoveButton({
    required this.cubit,
    required this.showAdd,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(6),
        dashPattern: const [5, 4],
        color: const Color(0xFFF25247),
        strokeWidth: 1.5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              showAdd ? "+ ADD CITY" : "- Clear Selection",
              style: const TextStyle(color: Color(0xFFF61000), fontSize: 18),
            ),
          ),
        ),
      ).toButton(
          () => showAdd ? cubit.addCityEntry() : cubit.clearCityEntries()),
    );
  }
}

enum TravelEntryType { fromCity, toCity, date }

extension on TravelEntryType {
  String get displayName {
    switch (this) {
      case TravelEntryType.fromCity:
        return 'FROM';
      case TravelEntryType.toCity:
        return 'TO';
      case TravelEntryType.date:
        return 'DATE';
    }
  }
}

class DateFormatter {
  static String formatDDMMM(DateTime? date) =>
      date != null ? DateFormat('dd MMM').format(date) : '';

  static String formatEEyyyy(DateTime? date) =>
      date != null ? DateFormat('EEE yyyy').format(date) : '';
}
