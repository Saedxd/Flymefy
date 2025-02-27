import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flymefy/app/app_development.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/auth/logic/login_persional_use/login_persional_use_cubit.dart';
import 'package:flymefy/features/auth/presentation/login_screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/images.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

NavigatorState get navigator => navigatorKey.currentState!;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("got in splashh");
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        // Check if the widget is still in the widget tree
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LogInScreen()),
            (route) => false);
      }
    });
  }

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
