import 'package:flutter/material.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/RefundPolicyScreen/baggage_refund_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/RefundPolicyScreen/cancellation_refund_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/RefundPolicyScreen/date_change_refund_screen.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Controller/refund_policy_controller.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/main.dart';

class RefundPolicyTabScreen extends StatelessWidget {
  RefundPolicyTabScreen({Key? key}) : super(key: key);
  final RefundPolicyTabController refundPolicyTabController =
      Get.put(RefundPolicyTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 130,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(flightSearch2TopImage),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.close, color: white, size: 20),
                          ),
                          SizedBox(width: 25),
                          CommonTextWidget.PoppinsSemiBold(
                            text: "Refund & Baggage Policy",
                            color: white,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Image.asset(spicejet, height: 30, width: 30),
                    SizedBox(width: 10),
                    CommonTextWidget.PoppinsSemiBold(
                      text: "DEL - BOM",
                      color: black2E2,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: refundPolicyTabController.controller,
                  children: [
                    CancellationRefundScreen(),
                    DateChangeRefundScreen(),
                    BaggageRefundSCreen(),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 110, left: 24, right: 24),
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
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: EdgeInsets.only(left: 24, bottom: 7, right: 20),
                  tabs: refundPolicyTabController.myTabs,
                  unselectedLabelColor: grey5F5,
                  labelStyle:
                      TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 12),
                  unselectedLabelStyle:
                      TextStyle(fontFamily: "PoppinsMedium", fontSize: 12),
                  labelColor: redCA0,
                  controller: refundPolicyTabController.controller,
                  indicatorColor: redCA0,
                  indicatorWeight: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
