import 'package:flutter/material.dart';
import 'package:flymefy/core/extension/context.dart';
import 'package:flymefy/core/resources_manager/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            child: Image.asset(
              Assets.assetsImgSplash,
              fit: BoxFit.fill,
              height: context.height,
              width: context.width,
            ),
          ),
        ),
      ),
    );
  }
}
