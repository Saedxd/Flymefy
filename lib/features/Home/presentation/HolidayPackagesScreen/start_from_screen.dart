import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/lists_widget.dart';
import 'package:flymefy/main.dart';

class StartFromSCreen extends StatelessWidget {
  StartFromSCreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 65),
            Container(
              width: context.width,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey515.withOpacity(0.25),
                    blurRadius: 6,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                cursorColor: black2E2,
                controller: searchController,
                style: TextStyle(
                  color: black2E2,
                  fontSize: 14,
                  fontFamily: FontFamily.PoppinsRegular,
                ),
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: grey717),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(15),
                    child: CommonTextWidget.PoppinsMedium(
                      color: redCA0,
                      text: "Clear",
                      fontSize: 12,
                    ),
                  ),
                  hintText: "Search Destinations",
                  hintStyle: TextStyle(
                    color: greyA1A,
                    fontSize: 15,
                    fontFamily: FontFamily.PoppinsRegular,
                  ),
                  filled: true,
                  fillColor: white,
                  contentPadding: EdgeInsets.only(left: 12),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: white, width: 0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: white, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: white, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: white, width: 0)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: white, width: 0)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.my_location, color: redFD3),
                SizedBox(width: 12),
                CommonTextWidget.PoppinsRegular(
                  color: black2E2,
                  text: "Use current Location",
                  fontSize: 14,
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(color: greyE8E, thickness: 1),
            SizedBox(height: 15),
            ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 25),
                shrinkWrap: true,
                itemCount: Lists.startFromList.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: CommonTextWidget.PoppinsRegular(
                    color: grey717,
                    text: Lists.startFromList[index],
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
