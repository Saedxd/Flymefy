import 'dart:async';
import 'package:flymefy/features/welcome/presentation/WelcomeScreen/welcome_screen1.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(
      Duration(seconds: 6),
      () => Get.off(
        WelcomeScreen1(),
      ),
    );
    super.onInit();
  }
}
