import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';
import 'package:flymefy/Controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redCA0,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: SvgPicture.asset(makeYourTripLogo),
        ),
      ),
    );
  }
}
