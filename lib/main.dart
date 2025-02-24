import 'package:flutter/material.dart';
import 'package:flymefy/app/app_production.dart';
import 'package:flymefy/core/network/api.dart';
import 'package:flymefy/core/routes/pages.dart';

void main() async {
  Config.appFlavor = Flavor.PRODUCTION;
  await initAppProduction();
  runApp(
    AppProductionStartPoint(
      appRouter: AppRouter(),
    ),
  );
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
