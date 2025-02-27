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
import 'package:flymefy/main.dart';

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
    return BlocBuilder<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        builder: (context, state) {
          return state.flowStateApp == FlowStateApp.loading
              ? const LoadinContent()
              : state.flowStateApp == FlowStateApp.error
                  ? ErrorContent(
                      message: state.failure.message,
                      onRefresh: () {},
                    )
                  : ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Image.asset(multicityImage),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: SizedBox(
                                width: context.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            SizedBox(height: 11),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.multiCityBoxes.cities.length,
                              itemBuilder: (context, index) {
                                final cityEntry =
                                    state.multiCityBoxes.cities[index];

                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TravelDetailsSmallBox(
                                        onTap: () {},
                                        cityName: cityEntry.from.city,
                                        iataName: cityEntry.from.iataCode,
                                        type: 'FROM',
                                        chosenDate: '',
                                        isEmpty: cityEntry.from.city.isEmpty,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      TravelDetailsSmallBox(
                                        onTap: () {},
                                        cityName: cityEntry.to.city,
                                        iataName: cityEntry.to.iataCode,
                                        type: 'TO',
                                        chosenDate: '',
                                        isEmpty: cityEntry.to.city.isEmpty,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      cityEntry.date.isEmpty
                                          ? TravelDetailsSmallerBox(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  Routes.multiCityCalender,
                                                );
                                              },
                                              cityName:
                                                  cityEntry.date.toString(),
                                              iataName: '',
                                              type: 'DATE',
                                              chosenDate: '',
                                              isEmpty: cityEntry.date.isEmpty,
                                            )
                                          : TravelDetailsSmallBox(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  Routes.multiCityCalender,
                                                );
                                              },
                                              cityName:
                                                  cityEntry.date.toString(),
                                              iataName: '',
                                              type: 'DATE',
                                              chosenDate: '',
                                              isEmpty: cityEntry.date.isEmpty,
                                            ),
                                      const Icon(
                                        Icons.close,
                                        size: 27,
                                        color: Colors.black,
                                      ).toButton(() {
                                        context
                                            .read<FlightBookCubit>()
                                            .removeCityEntry(index);
                                      }),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () => context
                                  .read<FlightBookCubit>()
                                  .addCityEntry(),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text("+ ADD CITY",
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
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
                                                text:
                                                    "TEconomy/Premium Economy",
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
                                        border: Border.all(
                                            color: greyE2E, width: 1),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: CommonTextWidget.PoppinsMedium(
                                            text:
                                                Lists.flightSearchList2[index],
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
                                  Navigator.pushNamed(
                                      context, Routes.flightBookScreen);
                                },
                                text: "SEARCH FLIGHTS",
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            image:
                                                AssetImage(flightSearchImage),
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

class TravelDetailsSmallBox extends StatelessWidget {
  const TravelDetailsSmallBox({
    Key? key,
    this.onTap,
    required this.cityName,
    required this.iataName,
    required this.type,
    required this.chosenDate,
    required this.isEmpty,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String cityName;
  final String iataName;
  final String type;
  final String chosenDate;
  final bool isEmpty;

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
              color: isEmpty ? Colors.red : black2E2),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isEmpty
                  ? [
                      SizedBox(
                        width: 75,
                        child: Center(
                            child: Text(
                          type,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 194, 44, 33),
                              fontSize: 17),
                        )),
                      )
                    ].toRow(mainAxisAlignment: MainAxisAlignment.center)
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: iataName,
                            color: black2E2,
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CommonTextWidget.PoppinsSemiBold(
                            text: cityName,
                            color: const Color.fromARGB(255, 174, 165, 165),
                            fontSize: 13,
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

class TravelDetailsSmallerBox extends StatelessWidget {
  const TravelDetailsSmallerBox({
    Key? key,
    this.onTap,
    required this.cityName,
    required this.iataName,
    required this.type,
    required this.chosenDate,
    required this.isEmpty,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String cityName;
  final String iataName;
  final String type;
  final String chosenDate;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: isEmpty ? const Color(0xfff5c6cb) : grey9B9.withOpacity(0.15),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: isEmpty ? 1.5 : 0.1,
              color: isEmpty ? Colors.red : black2E2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isEmpty
                ? [
                    SizedBox(
                      width: 75,
                      child: Center(
                          child: Text(
                        type,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 194, 44, 33),
                            fontSize: 17),
                      )),
                    )
                  ].toRow(mainAxisAlignment: MainAxisAlignment.center)
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextWidget.PoppinsMedium(
                          text: iataName,
                          color: black2E2,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CommonTextWidget.PoppinsSemiBold(
                          text: cityName,
                          color: const Color.fromARGB(255, 174, 165, 165),
                          fontSize: 13,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
