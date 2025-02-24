import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flymefy/app/app_development.dart';
import 'package:flymefy/core/network/api.dart';
import 'package:flymefy/core/routes/pages.dart';

void main() async {
  Config.appFlavor = Flavor.DEVELOPMENT;
  await initAppDevelopemt();

  runApp(DevicePreview(
      enabled: true,
      builder: (context) => AppDevelopemntStartPoint(
            appRouter: AppRouter(),
          )));
}
