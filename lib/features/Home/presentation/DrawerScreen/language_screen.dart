import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Controller/language_controller.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/main.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({Key? key}) : super(key: key);

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
          text: "Language",
          color: white,
          fontSize: 18,
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                CommonTextWidget.PoppinsSemiBold(
                  text: "Suggested",
                  color: black2E2,
                  fontSize: 16,
                ),
                SizedBox(height: 30),
                GetBuilder<LanguageController>(
                  init: LanguageController(),
                  builder: (controller) => ListView.builder(
                    itemCount: Lists.languageSuggestedList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: Lists.languageSuggestedList[index],
                            color: grey717,
                            fontSize: 14,
                          ),
                          InkWell(
                            onTap: () {
                              controller.onIndexChange(index);
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                                border: Border.all(color: redCA0),
                              ),
                              alignment: Alignment.center,
                              child: controller.selectedIndex == index
                                  ? Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: redCA0,
                                          shape: BoxShape.circle),
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: greyE2E, thickness: 1),
                SizedBox(height: 25),
                CommonTextWidget.PoppinsSemiBold(
                  text: "Language",
                  color: black2E2,
                  fontSize: 16,
                ),
                SizedBox(height: 30),
                GetBuilder<LanguageController>(
                  init: LanguageController(),
                  builder: (controller) => ListView.builder(
                    itemCount: Lists.languageList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: Lists.languageList[index],
                            color: grey717,
                            fontSize: 14,
                          ),
                          InkWell(
                            onTap: () {
                              controller.onIndexChange1(index);
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                                border: Border.all(color: redCA0),
                              ),
                              alignment: Alignment.center,
                              child: controller.selectedIndex1 == index
                                  ? Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: redCA0,
                                          shape: BoxShape.circle),
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
