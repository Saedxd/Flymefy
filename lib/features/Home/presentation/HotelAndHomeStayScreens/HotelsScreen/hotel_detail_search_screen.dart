import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:flymefy/Screens/Utills/common_textfeild_widget.dart';

class HotelDetailSearchScreen extends StatelessWidget {
  HotelDetailSearchScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 155,
                width: context.width,
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
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, color: white, size: 20),
                      ),
                      CommonTextWidget.PoppinsSemiBold(
                        text: "Search",
                        color: white,
                        fontSize: 18,
                      ),
                      Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(hotelDetailSearchImage,
                    height: 118, width: 227),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 130, left: 24, right: 24),
            child: Container(
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
              child: CommonTextFieldWidget.TextFormField2(
                keyboardType: TextInputType.text,
                controller: searchController,
                hintText: "Search for Amenities, Property...",
                prefixIcon: Icon(CupertinoIcons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
