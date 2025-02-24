import 'package:flutter/material.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/5pluse_rooms_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/hotel_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/upto5_rooms_screen.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Controller/hotel_and_homestay_controller.dart';

import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';

class HotelAndHomeStayTabScreen extends StatelessWidget {
  HotelAndHomeStayTabScreen({Key? key}) : super(key: key);

  final HotelAndHomeStayTabController hotelAndHomeStayTabController =
      Get.put(HotelAndHomeStayTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 155,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(hotelAndHomeStayTopImage),
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
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back, color: white, size: 20),
                      ),
                      CommonTextWidget.PoppinsSemiBold(
                        text: "Hotels & Homestays",
                        color: white,
                        fontSize: 18,
                      ),
                      Container(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: hotelAndHomeStayTabController.controller,
                  children: [
                    UpTo5RoomsScreen(),
                    FivePlusRoomsScreen(),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 130, left: 24, right: 24),
            child: Container(
              height: 45,
              width: Get.width,
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
                indicatorSize: TabBarIndicatorSize.label,
                padding: EdgeInsets.only(bottom: 7),
                tabs: hotelAndHomeStayTabController.myTabs,
                unselectedLabelColor: grey5F5,
                labelStyle:
                    TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14),
                unselectedLabelStyle:
                    TextStyle(fontFamily: "PoppinsMedium", fontSize: 14),
                labelColor: redCA0,
                controller: hotelAndHomeStayTabController.controller,
                indicatorColor: redCA0,
                indicatorWeight: 2.5,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: CommonButtonWidget.button(
              text: "SEARCH HOTELS",
              onTap: () {
                Get.to(() => HotelScreen());
              },
              buttonColor: redCA0,
            ),
          ),
        ],
      ),
    );
  }
}
