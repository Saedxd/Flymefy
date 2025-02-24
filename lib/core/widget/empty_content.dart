import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/extension/functions.dart';

class EmptyContent extends StatelessWidget {
  final String message;
  final String subtitleMessage;
  final VoidCallback? onRefresh;
  final bool showButton;
  final bool showIcon;
  final Widget? iconWidget;

  const EmptyContent(
      {super.key,
      this.onRefresh,
      this.iconWidget,
      this.message = AppStrings.noData,
      this.showButton = false,
      this.showIcon = false,
      this.subtitleMessage = AppStrings.emptyInput});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 350,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showIcon)
              iconWidget ??
                  Assets.assetsJsonLikeLottieJson.toAssetLottie(
                    height: AppSize.appSize50,
                    width: context.width - 100,
                  ),
            [
              AppSize.appSize20.heightSizedBox,
              message.toText(context,
                  fontSize: AppSize.appSize28,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor),
              AppSize.appSize10.heightSizedBox,
              subtitleMessage.toText(context,
                  fontSize: AppSize.appSize16,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.hintGrayColor),
              AppSize.appSize10.heightSizedBox,
              if (showButton)
                () {
                  onRefresh?.call();
                }.toElevetatedButton(
                  context,
                  text: AppStrings.refresh,
                )
            ].toColumn()
          ],
        ),
      ),
    );
  }
}
