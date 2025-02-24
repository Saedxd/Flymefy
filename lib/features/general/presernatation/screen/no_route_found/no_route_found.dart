import 'package:flutter/material.dart';
import 'package:flymefy/core/extension/context.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/extension/widget.dart';
import 'package:flymefy/core/resources_manager/assets.dart';
import 'package:flymefy/core/resources_manager/color.dart';
import 'package:flymefy/core/resources_manager/strings.dart';

class NoRouteFoundScreen extends StatelessWidget {
  final RouteSettings settings;
  const NoRouteFoundScreen({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.assetsJsonError.toAssetLottie(),
          AppStrings.noRouteFound.toText(context,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManager.blackColor,
              textAlign: TextAlign.center),
          AppStrings.exit.toEelevatedButton(context, () {
            Navigator.of(context).pop();
          },
              color: ColorManager.primaryColor,
              width: context.width,
              height: 45,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              colortext: ColorManager
                  .whiteColor).paddingSymmetric(horizontal: 16, vertical: 4)
        ],
      ),
    );
  }
}
