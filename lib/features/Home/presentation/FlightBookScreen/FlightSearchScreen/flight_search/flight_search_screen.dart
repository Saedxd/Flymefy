import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flight_types/multicity_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flight_types/one_way_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/flight_types/round_trip_screen.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';

import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';

import 'package:flymefy/main.dart';

class MainFlightSearchScreen extends StatelessWidget {
  MainFlightSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => instance<FlightBookCubit>(),
        child: FlightSearchScreen());
  }
}

class FlightSearchScreen extends StatefulWidget {
  FlightSearchScreen({Key? key}) : super(key: key);

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen>
    with TickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'ONE WAY'),
    Tab(text: 'ROUNDTRIP'),
    Tab(text: 'MULTICITY'),
  ];

  late TabController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: myTabs.length, vsync: this);

    // Add listener to detect tab changes
    controller.addListener(() {
      if (!controller.indexIsChanging) {
        final cubit = context.read<FlightBookCubit>();

        // Map tab index to FlightType and update cubit
        switch (controller.index) {
          case 0:
            cubit.changeCurrentSelectedType(FlightType.oneWay);
            break;
          case 1:
            cubit.changeCurrentSelectedType(FlightType.roundTrip);
            break;
          case 2:
            cubit.changeCurrentSelectedType(FlightType.multiCity);
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBookCubit, FlightBookState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: white,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 155,
                  width: context.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(flightSearchTopImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, color: white, size: 20),
                        ),
                        CommonTextWidget.PoppinsSemiBold(
                          text: "Flight Search",
                          color: white,
                          fontSize: 18,
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(height: 15),
                Expanded(
                  child: TabBarView(
                    controller: controller,
                    children: [
                      OneWayS(
                        cubit: context.read<FlightBookCubit>(),
                      ),
                      RoundTripS(
                        cubit: context.read<FlightBookCubit>(),
                      ),
                      MultiCityS(
                        cubit: context.read<FlightBookCubit>(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 130, left: 24, right: 24),
              child: Container(
                height: 45,
                width: context.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: grey757.withOpacity(0.25),
                      blurRadius: 6,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: TabBar(
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: EdgeInsets.only(left: 10, bottom: 7, right: 10),
                  tabs: myTabs,
                  unselectedLabelColor: grey5F5,
                  labelStyle:
                      TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14),
                  unselectedLabelStyle:
                      TextStyle(fontFamily: "PoppinsMedium", fontSize: 14),
                  labelColor: redCA0,
                  controller: controller,
                  indicatorColor: redCA0,
                  indicatorWeight: 4,
                ),
              ),
            ),
            Positioned(
              right: 32,
              top: 335,
              child: InkWell(
                onTap: () {
                  // Get.to(() => SortAndFilterScreen());
                },
                child: Container(
                  height: 45,
                  width: 33,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: greyE2E,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(arrowsDownUp),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
