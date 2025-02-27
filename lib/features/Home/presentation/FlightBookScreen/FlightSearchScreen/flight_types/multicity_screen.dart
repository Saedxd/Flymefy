import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
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
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 24),
                            //   child: Image.asset(multicityImage),
                            // ),
                            // SizedBox(height: 8),
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
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.flightFromScreen,
                                              arguments: {
                                                'cubit': cubit,
                                                'type': "MultiCity",
                                                'index': index,
                                                'onIataClicked': (FlightDetails
                                                    selectedFlight) {
                                                  context
                                                      .read<FlightBookCubit>()
                                                      .updateCityEntryFrom(
                                                          index,
                                                          selectedFlight);
                                                }
                                              });
                                        },
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
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.flightToScreen,
                                              arguments: {
                                                'cubit': cubit,
                                                'type': "MultiCity",
                                                'index': index,
                                                'onIataClicked': (FlightDetails
                                                    selectedFlight) {
                                                  context
                                                      .read<FlightBookCubit>()
                                                      .updateCityEntryTo(index,
                                                          selectedFlight);
                                                }
                                              });
                                        },
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
                                                Navigator.pushNamed(context,
                                                    Routes.multiCityCalender,
                                                    arguments: {
                                                      'cubit': cubit,
                                                      'index': index
                                                    });
                                              },
                                              isEmpty: cityEntry.date.isEmpty,
                                            )
                                          : TravelDetailsSmallBox(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    Routes.multiCityCalender,
                                                    arguments: {
                                                      'cubit': cubit,
                                                      'index': index
                                                    });
                                              },
                                              cityName:
                                                  cityEntry.date.toString(),
                                              iataName: '',
                                              type: 'DATE',
                                              chosenDate: cityEntry.date,
                                              isEmpty: cityEntry.date.isEmpty,
                                            ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      cityEntry.date.isEmpty
                                          ? const Icon(
                                              Icons.close,
                                              size: 25,
                                              color: Colors.black,
                                            ).toButton(() {
                                              context
                                                  .read<FlightBookCubit>()
                                                  .removeCityEntry(index);
                                            })
                                          : SizedBox()
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 15),
                            DottedBorder(
                              borderType: BorderType.RRect, // Rounded Rectangle
                              radius: Radius.circular(6), // Border radius
                              dashPattern: [
                                5,
                                4
                              ], // Dotted pattern (length of dash, space)
                              color: const Color.fromARGB(
                                  255, 242, 82, 71), // Border color
                              strokeWidth: 1.5, // Border width
                              child: Container(
                                padding: EdgeInsets.all(16),
                                width: context.width,
                                height: 70,
                                child: Center(
                                  child: Text("+ ADD CITY",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 246, 16, 0),
                                          fontSize: 18)),
                                ),
                              ),
                            ).paddingSymmetric(horizontal: 24).toButton(() {
                              context.read<FlightBookCubit>().addCityEntry();
                            }),
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
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          child: isEmpty
              ? [
                  SizedBox(
                      width: 90,
                      height: 20,
                      child: Text(
                        type,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 194, 44, 33),
                            fontSize: 17),
                      ))
                ].toRow(mainAxisAlignment: MainAxisAlignment.start)
              : type == "DATE"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidget.PoppinsSemiBold(
                          text: formatDatePart1(DateTime.parse(chosenDate)),
                          color: black2E2,
                          fontSize: cityName.isEmpty ? 16 : 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CommonTextWidget.PoppinsMedium(
                          text: formatDatePart2(DateTime.parse(chosenDate)),
                          color: grey888,
                          fontSize: 11,
                        ),
                      ],
                    )
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
                          SizedBox(
                              width: 90,
                              child: Text(cityName,
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 174, 165, 165),
                                      fontSize: 11,
                                      overflow: TextOverflow.ellipsis)))
                        ],
                      ),
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
    required this.isEmpty,
  }) : super(key: key);
  final VoidCallback? onTap;

  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 67,
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
            [
              SizedBox(
                  child: Text(
                "Date",
                style: TextStyle(
                    color: const Color.fromARGB(255, 194, 44, 33),
                    fontSize: 18),
              ))
            ].toRow(mainAxisAlignment: MainAxisAlignment.start)
          ],
        ).marginSymmetric(horizontal: 10),
      ),
    );
  }
}
