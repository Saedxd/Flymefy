import 'package:flutter/material.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/select_room_screen.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';

class RatePlanDetailScreen extends StatelessWidget {
  RatePlanDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: redCA0,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: white, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Rate Plan Details",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Column(
        children: [
          Image.asset(ratePlanDetail),
          Spacer(),
          Container(
            width: context.width,
            color: black2E2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget.PoppinsSemiBold(
                        text: "₹ 7,950",
                        color: white,
                        fontSize: 16,
                      ),
                      CommonTextWidget.PoppinsRegular(
                        text: "+ ₹870 taxes & service fees",
                        color: white,
                        fontSize: 10,
                      ),
                      CommonTextWidget.PoppinsRegular(
                        text: "Per Night (2 Adults)",
                        color: white,
                        fontSize: 10,
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      //  Get.to(() => SelectRoomScreen());
                      Navigator.pushNamed(context, Routes.selectRoomScreen);
                    },
                    height: 40,
                    minWidth: 140,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: redCA0,
                    child: CommonTextWidget.PoppinsSemiBold(
                      fontSize: 16,
                      text: "SELECT ROOM",
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
