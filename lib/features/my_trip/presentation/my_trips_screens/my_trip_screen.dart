import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/features/my_trip/presentation/cancelled_trips_screens/cancelled_trip_screen.dart';
import 'package:flymefy/features/my_trip/presentation/upcoming_trips_screens/upcoming_trip_screen.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Controller/my_trip_controller.dart';

import 'package:flymefy/Screens/Utills/common_text_widget.dart';

class MyTripScreen extends StatelessWidget {
  MyTripScreen({Key? key}) : super(key: key);

  final MyTripTabController myTripTabController =
      Get.put(MyTripTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: black2E2, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "My Trips",
          color: black2E2,
          fontSize: 18,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(bottom: 16, right: 24),
            child: SvgPicture.asset(arrowCounterClockwise),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 45,
            width: context.width,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: grey363.withOpacity(0.25),
                  blurRadius: 4,
                ),
              ],
            ),
            child: TabBar(
              isScrollable: true,
              padding: EdgeInsets.only(left: 24, bottom: 7, right: 10),
              tabs: myTripTabController.myTabs,
              unselectedLabelColor: grey5F5,
              labelStyle:
                  TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14),
              unselectedLabelStyle:
                  TextStyle(fontFamily: "PoppinsMedium", fontSize: 14),
              labelColor: redCA0,
              controller: myTripTabController.controller,
              indicatorColor: redCA0,
              indicatorWeight: 2.5,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: myTripTabController.controller,
              children: [
                UpComingTripScreen(),
                CancelledTripScreen(),
                Scaffold(),
                Scaffold(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
