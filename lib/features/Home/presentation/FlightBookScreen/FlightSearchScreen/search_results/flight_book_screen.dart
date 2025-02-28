import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/search_results/widgets/ticket_list_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/search_results/widgets/keep_track_price_screen.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/main.dart';

class FlightBook extends StatelessWidget {
  const FlightBook({Key? key, required this.cubit}) : super(key: key);
  final FlightBookCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: FlightBookScreen(
          cubit: cubit,
        ));
  }
}

class FlightBookScreen extends StatefulWidget {
  FlightBookScreen({Key? key, required this.cubit}) : super(key: key);

  final FlightBookCubit cubit;

  @override
  State<FlightBookScreen> createState() => _FlightBookScreenState();
}

class _FlightBookScreenState extends State<FlightBookScreen>
    with TickerProviderStateMixin {
// ignore: prefer_typing_uninitialized_variables
  var selectedIndex;

  onIndexChange(index) {
    selectedIndex = index;
  }

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextWidget.PoppinsMedium(
            text: "Cheapest",
            fontSize: 10,
            textAlign: TextAlign.center,
          ),
          CommonTextWidget.PoppinsMedium(
            text: "₹ 5,956 | 2 h 15m",
            fontSize: 9,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextWidget.PoppinsMedium(
            text: "Fastest",
            fontSize: 10,
            textAlign: TextAlign.center,
          ),
          CommonTextWidget.PoppinsMedium(
            text: "₹ 11,956 | 1 h 15m",
            fontSize: 9,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextWidget.PoppinsMedium(
            text: "You May Prefer",
            fontSize: 10,
            textAlign: TextAlign.center,
          ),
          CommonTextWidget.PoppinsMedium(
            text: "₹ 8,956 | 2 h",
            fontSize: 9,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ];

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: redF9E,
        body: BlocConsumer<FlightBookCubit, FlightBookState>(
            bloc: widget.cubit,
            listener: (context, state) async {
              if (state.flowStateApp == FlowStateApp.success) {
                Navigator.pushNamed(context, Routes.flightBookScreen);
              }
            },
            builder: (context, state) {
              return state.flowStateApp == FlowStateApp.loading
                  ? const LoadinContent()
                  : Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 155,
                              width: context.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(flightSearch2TopImage),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 24, right: 24, top: 60, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        width: context.width,
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ListTile(
                                          horizontalTitleGap: -5,
                                          leading: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(Icons.arrow_back,
                                                color: grey888, size: 20),
                                          ),
                                          title:
                                              CommonTextWidget.PoppinsRegular(
                                            text: "New Delhi to Mumbai",
                                            color: black2E2,
                                            fontSize: 15,
                                          ),
                                          subtitle:
                                              CommonTextWidget.PoppinsRegular(
                                            text: "24 Sep | 1 Adult | Economy",
                                            color: grey717,
                                            fontSize: 12,
                                          ),
                                          trailing: InkWell(
                                            onTap: () {
                                              //  Get.to(() => FlightModifySearch());
                                              Navigator.pushNamed(context,
                                                  Routes.flightModifySearch);
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(draw),
                                                SizedBox(height: 10),
                                                CommonTextWidget.PoppinsMedium(
                                                  text: "Edit",
                                                  color: redCA0,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          // Get.bottomSheet(
                                          //   KeepTrackPriceScreen(),
                                          //   backgroundColor: Colors.transparent,
                                          //   isScrollControlled: true,
                                          // );
                                        },
                                        child: Container(
                                          width: context.width,
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 7),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(notification),
                                                CommonTextWidget.PoppinsMedium(
                                                  text: "Price Alert",
                                                  color: redCA0,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   width: context.width,
                            //   color: white,
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 24, vertical: 10),
                            //     child: Row(
                            //       children: [
                            //         Container(
                            //           decoration: BoxDecoration(
                            //             color: redCA0,
                            //             borderRadius: BorderRadius.only(
                            //               topLeft: Radius.circular(5),
                            //               bottomLeft: Radius.circular(5),
                            //             ),
                            //           ),
                            //           child: Padding(
                            //             padding: EdgeInsets.symmetric(
                            //                 horizontal: 5, vertical: 10),
                            //             child: RotatedBox(
                            //               quarterTurns: 3,
                            //               child: CommonTextWidget.PoppinsMedium(
                            //                 text: "SEP",
                            //                 color: white,
                            //                 fontSize: 12,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //         // Expanded(
                            //         //   child: SizedBox(
                            //         //     height: 40,
                            //         //     width: context.width,
                            //         //     child:

                            //         //       ListView.builder(
                            //         //         itemCount: Lists.flightBookList1.length,
                            //         //         padding: EdgeInsets.only(left: 6),
                            //         //         shrinkWrap: true,
                            //         //         scrollDirection: Axis.horizontal,
                            //         //         itemBuilder: (context, index) => Padding(
                            //         //           padding: EdgeInsets.only(right: 6),
                            //         //           child: InkWell(
                            //         //             onTap: () {
                            //         //             //  controller.onIndexChange(index);
                            //         //             },
                            //         //             child: Container(
                            //         //               decoration: BoxDecoration(
                            //         //                 color: state.selectedIndex == index
                            //         //                     ? redCA0
                            //         //                     : white,
                            //         //                 borderRadius: BorderRadius.circular(5),
                            //         //                 border: Border.all(
                            //         //                     color:
                            //         //                         state.selectedIndex == index
                            //         //                             ? redCA0
                            //         //                             : greyE2E,
                            //         //                     width: 1),
                            //         //               ),
                            //         //               child: Padding(
                            //         //                 padding: EdgeInsets.symmetric(
                            //         //                     horizontal: 20, vertical: 4),
                            //         //                 child: Column(
                            //         //                   children: [
                            //         //                     CommonTextWidget.PoppinsMedium(
                            //         //                       text: Lists.flightBookList1[index]
                            //         //                           ["text1"],
                            //         //                       color: state.selectedIndex ==
                            //         //                               index
                            //         //                           ? white
                            //         //                           : grey717,
                            //         //                       fontSize: 10,
                            //         //                     ),
                            //         //                     CommonTextWidget.PoppinsMedium(
                            //         //                       text: Lists.flightBookList1[index]
                            //         //                           ["text2"],
                            //         //                       color: state.selectedIndex ==
                            //         //                               index
                            //         //                           ? white
                            //         //                           : grey717,
                            //         //                       fontSize: 10,
                            //         //                     ),
                            //         //                   ],
                            //         //                 ),
                            //         //               ),
                            //         //             ),
                            //         //           ),
                            //         //         ),
                            //         //       ),

                            //         //   ),
                            //         // ),

                            //         InkWell(
                            //           onTap: () {
                            //             //Get.to(() => CalenderScreen());
                            //             //   Navigator.pushNamed(context, Routes.calenderScreen);
                            //           },
                            //           child: Container(
                            //             decoration: BoxDecoration(
                            //               color: redCA0,
                            //               borderRadius:
                            //                   BorderRadius.circular(5),
                            //             ),
                            //             child: Padding(
                            //               padding: EdgeInsets.symmetric(
                            //                   horizontal: 10, vertical: 10),
                            //               child: SvgPicture.asset(calendar),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            SizedBox(height: 12),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Container(
                                height: 55,
                                width: context.width,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TabBar(
                                  tabs: myTabs,
                                  unselectedLabelColor: black2E2,
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "PoppinsMedium"),
                                  unselectedLabelStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "PoppinsMedium"),
                                  labelColor: white,
                                  controller: controller,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: redCA0),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Expanded(
                              child: TabBarView(
                                controller: controller,
                                children: [
                                  PlanTicketsOffersList(
                                    cubit: widget.cubit,
                                  ),
                                  PlanTicketsOffersList(
                                    cubit: widget.cubit,
                                  ),
                                  PlanTicketsOffersList(
                                    cubit: widget.cubit,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 120),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 45, left: 24, right: 24),
                            child: Container(
                              height: 64,
                              width: context.width,
                              decoration: BoxDecoration(
                                color: redCA0,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 44,
                                      child: ScrollConfiguration(
                                        behavior: MyBehavior(),
                                        child: ListView.builder(
                                          itemCount:
                                              Lists.flightBookList2.length,
                                          padding: EdgeInsets.only(
                                              left: 10, right: 4),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding: EdgeInsets.only(right: 6),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                child: Center(
                                                  child: Text(
                                                    Lists
                                                        .flightBookList2[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      height: 1,
                                                      color: grey717,
                                                      fontFamily: FontFamily
                                                          .PoppinsSemiBold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 7),
                                    child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              //  Get.to(() => SortAndFilterScreen());
                                              Navigator.pushNamed(context,
                                                  Routes.sortAndFilterScreen);
                                            },
                                            child: SvgPicture.asset(
                                                slidersHorizontal)),
                                        SizedBox(height: 2),
                                        CommonTextWidget.PoppinsMedium(
                                          text: "Filter",
                                          color: white,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            }));
  }
}
