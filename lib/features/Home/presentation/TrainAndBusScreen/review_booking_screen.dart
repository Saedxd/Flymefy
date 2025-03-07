import 'package:flutter/material.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/main.dart';

class ReviewBookingScreen extends StatelessWidget {
  ReviewBookingScreen({Key? key}) : super(key: key);

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
          text: "Review Booking",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: context.width,
                    color: yellowF7C.withOpacity(0.3),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                      child: CommonTextWidget.PoppinsRegular(
                        text: "Review booking, complete payment and enter "
                            "IRCTC login password in 10 mins.",
                        color: black2E2,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget.PoppinsMedium(
                                  text: "Boarding station",
                                  color: black2E2,
                                  fontSize: 14,
                                ),
                                CommonTextWidget.PoppinsRegular(
                                  text: "NDLS / NEW DELHI",
                                  color: grey717,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            CommonTextWidget.PoppinsMedium(
                              text: "5:40 PM (4 Oct)",
                              color: black2E2,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: context.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: grey515.withOpacity(0.25),
                                blurRadius: 6,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: CommonTextWidget.PoppinsSemiBold(
                              text: "Jhon Deo, 25 (m)",
                              color: black2E2,
                              fontSize: 16,
                            ),
                            subtitle: CommonTextWidget.PoppinsRegular(
                              text: "Middle Berth",
                              color: grey717,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        CommonTextWidget.PoppinsRegular(
                          text: "Price Breakup",
                          color: black2E2,
                          fontSize: 18,
                        ),
                        SizedBox(height: 20),
                        CommonTextWidget.PoppinsSemiBold(
                          text: "Base Fare",
                          color: black2E2,
                          fontSize: 14,
                        ),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget.PoppinsRegular(
                              text: "Ticket Charge",
                              color: black2E2,
                              fontSize: 14,
                            ),
                            CommonTextWidget.PoppinsMedium(
                              text: "₹ 810",
                              color: black2E2,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget.PoppinsRegular(
                              text: "Agent Service Charge & GST",
                              color: black2E2,
                              fontSize: 14,
                            ),
                            CommonTextWidget.PoppinsMedium(
                              text: "₹ 20",
                              color: black2E2,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget.PoppinsRegular(
                              text: "IRCTC Travel Insurance",
                              color: black2E2,
                              fontSize: 14,
                            ),
                            CommonTextWidget.PoppinsMedium(
                              text: "₹ 0",
                              color: black2E2,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget.PoppinsRegular(
                              text: "IRCTC Convenience Fee (incl. of GST)",
                              color: black2E2,
                              fontSize: 14,
                            ),
                            CommonTextWidget.PoppinsMedium(
                              text: "₹ 17.7",
                              color: black2E2,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget.PoppinsSemiBold(
                              text: "Total",
                              color: black2E2,
                              fontSize: 16,
                            ),
                            CommonTextWidget.PoppinsSemiBold(
                              text: "₹ 847.7",
                              color: black2E2,
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 110),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60,
                    width: context.width,
                    color: black2E2,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget.PoppinsSemiBold(
                            text: "₹ 847.7",
                            color: white,
                            fontSize: 16,
                          ),
                          MaterialButton(
                            onPressed: () {
                              //      Get.to(() => ReviewBookingScreen());
                              Navigator.pushNamed(
                                  context, Routes.reviewBookingScreen);
                            },
                            height: 40,
                            minWidth: 140,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            color: redCA0,
                            child: CommonTextWidget.PoppinsSemiBold(
                              fontSize: 16,
                              text: "Pay and Book",
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
