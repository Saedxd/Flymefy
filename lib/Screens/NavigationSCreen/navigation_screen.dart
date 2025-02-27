import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/presentation/DrawerScreen/drawer_screen.dart';
import 'package:flymefy/features/Home/presentation/home_screen.dart';
import 'package:flymefy/features/my_trip/presentation/my_trips_screens/my_trip_screen.dart';
import 'package:flymefy/features/profile/presentation/my_account_screen/my_account_screen.dart';
import 'package:flymefy/features/welcome/presentation/Where2GoScreen/where_2_go_screen.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Controller/navigation_controller.dart';

import 'package:flymefy/Screens/Utills/common_text_widget.dart';

class NavigationScreen extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final pages = [
    HomeScreen(),
    MyTripScreen(),
    Where2GoScreen(),
    MyAccountScreen(),
  ];

  buildMyNavBar(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: greyB9B.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => Column(
                children: [
                  InkWell(
                    enableFeedback: false,
                    onTap: () {
                      navigationController.pageIndex.value = 0;
                    },
                    child: SvgPicture.asset(
                      navigationController.pageIndex.value == 0
                          ? homeSelectedIcon
                          : homeUnSelectedIcon,
                      color: Color(0xff3e0fa9),
                    ),
                  ),
                  SizedBox(height: 6),
                  CommonTextWidget.PoppinsMedium(
                    text: "Home",
                    color: navigationController.pageIndex.value == 0
                        ? redCA0
                        : greyAAA,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  enableFeedback: false,
                  onTap: () {
                    //   Get.to(() => MyTripScreen());
                    Navigator.pushNamed(context, Routes.myTripScreen);
                  },
                  child: SvgPicture.asset(
                    suitcaseIcon,
                    color: Color(0xff3e0fa9),
                  ),
                ),
                SizedBox(height: 6),
                CommonTextWidget.PoppinsMedium(
                  text: "My Trips",
                  color: greyAAA,
                  fontSize: 12,
                ),
              ],
            ),
            Obx(
              () => Column(
                children: [
                  InkWell(
                    enableFeedback: false,
                    onTap: () {
                      navigationController.pageIndex.value = 2;
                    },
                    child: SvgPicture.asset(
                      navigationController.pageIndex.value == 2
                          ? selectedRightArrow
                          : unSelectedRightArrow,
                      color: Color(0xff3e0fa9),
                    ),
                  ),
                  SizedBox(height: 6),
                  CommonTextWidget.PoppinsMedium(
                    text: "Where2Go",
                    color: navigationController.pageIndex.value == 2
                        ? redCA0
                        : greyAAA,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  enableFeedback: false,
                  onTap: () {
                    //   Get.to(() => MyAccountScreen());
                    Navigator.pushNamed(context, Routes.myAccountScreen);
                  },
                  child: SvgPicture.asset(
                    userIcon,
                    color: Color(0xff3e0fa9),
                  ),
                ),
                SizedBox(height: 6),
                CommonTextWidget.PoppinsMedium(
                  text: "MY Account",
                  color: greyAAA,
                  fontSize: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
        key: key,
        backgroundColor: white,
        drawer: Drawer(
          backgroundColor: white,
          child: DrawerScreen(),
        ),
        body: Stack(
          children: [
            Obx(
              () => Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  pages[navigationController.pageIndex.value],
                  buildMyNavBar(context),
                ],
              ),
            ),
            navigationController.pageIndex.value == 0
                ? Positioned(
                    top: 65,
                    left: 24,
                    child: InkWell(
                      onTap: () {
                        key.currentState!.openDrawer();
                      },
                      child: Image.asset(menuIcon, height: 42, width: 42),
                    ),
                  )
                : SizedBox()
          ],
        ));
  }
}
