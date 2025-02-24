import 'package:flutter/material.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/extension/functions.dart';
import 'package:flymefy/core/resources_manager/assets.dart';
import 'package:flymefy/core/resources_manager/strings.dart';
import 'package:flymefy/core/resources_manager/values.dart';

import '../resources_manager/color.dart';

class ErrorContent extends StatelessWidget {
  final String message;

  final VoidCallback? onRefresh;
  const ErrorContent({
    super.key,
    this.onRefresh,
    this.message = AppStrings.generalError,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.assetsJsonError.toAssetLottie(
            height: AppSize.appSize100,
            width: AppSize.appSize100,
          ),
          AppSize.appSize20.heightSizedBox,
          (message.isEmpty ? AppStrings.generalError : message).toText(context,
              fontSize: AppSize.appSize16,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              color: ColorManager.blackColor),
          AppSize.appSize10.heightSizedBox,
          onRefresh.toElevetatedButton(
            context,
            text: AppStrings.retryAgain,
          )
        ],
      ),
    );
  }
}
