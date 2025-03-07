import 'package:flutter/material.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/Home/presentation/DrawerScreen/language_screen.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

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
          text: "Settings",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget.PoppinsMedium(
                  text: "Country/Region",
                  color: black2E2,
                  fontSize: 16,
                ),
                Image.asset(settingImage1, height: 31, width: 109),
              ],
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget.PoppinsMedium(
                  text: "Language",
                  color: black2E2,
                  fontSize: 16,
                ),
                InkWell(
                  onTap: () {
                    //  Get.to(() => LanguageScreen());
                    Navigator.pushNamed(context, Routes.languageScreen);
                  },
                  child: Image.asset(settingImage2, height: 31, width: 109),
                ),
              ],
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget.PoppinsMedium(
                  text: "Currency",
                  color: black2E2,
                  fontSize: 16,
                ),
                CommonTextWidget.PoppinsMedium(
                  text: "Indian Rupee (₹)",
                  color: greyBCB,
                  fontSize: 14,
                ),
              ],
            ),
            Spacer(),
            CommonButtonWidget(
              buttonColor: redCA0,
              onTap: () {},
              text: "APPLY CHANGES",
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
