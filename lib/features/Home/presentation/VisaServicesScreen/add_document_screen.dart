import 'package:flutter/material.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';

class AddDocumentScreen extends StatelessWidget {
  AddDocumentScreen({Key? key}) : super(key: key);

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
          text: "Add Documents",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Image.asset(addDocumentImage, width: context.width),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CommonButtonWidget(
              buttonColor: redCA0,
              onTap: () {
                //  Get.to(() => AddDocumentScreen());
                Navigator.pushNamed(context, Routes.addDocumentScreen);
              },
              text: "SUBMIT APPLICATION",
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
