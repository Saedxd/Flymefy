import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flymefy/core/extension/context.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/extension/widget.dart';

import '../../../core/helper/function.dart';
import '../../../core/resources_manager/assets.dart';
import '../../../core/resources_manager/color.dart';
import '../../../core/resources_manager/font.dart';
import '../../../core/resources_manager/strings.dart';
import '../../../core/resources_manager/values.dart';
import 'loading.dart';

abstract interface class IShowAlertMessage {
  void showErrorPopUpOk(BuildContext context, String message);
  void successCopied(
    BuildContext context,
  );

  void showSuccessPopUpOk(BuildContext context, String message,
      {String hint = ''});

  void showSuccessPopUpOkWithTitle(BuildContext context, String message,
      {String hint = '', String title = '', Function() onPressed});

  void showSuccessPopUpWithButton(BuildContext context, String message,
      {Widget button = const SizedBox()});
  void showSuccess(BuildContext context, String messag, String desc);
  void showSuccessPopUpOkWithoutClose(BuildContext context, String message);
  void showLoadingPopUp(BuildContext context);
  void showErrorPopupRetry(
      BuildContext context, String message, Function retryActionFunction);
  void showAskContinuePopup(
      BuildContext context, String message, Function retryActionFunction,
      {String ok = AppStrings.ok, String cancelText = AppStrings.dismiss});
  void showSnakeBar(BuildContext context, String message);
  void showSnakeBarLoading(BuildContext context, String message);
  void showSnakeBarSuccess(BuildContext context, String message);
  void showSnakeBarError(BuildContext context, String message);

  void showSnakeBarWithoutClose(BuildContext context, String message);
  void showAskContinueSettingPopup(BuildContext context, String message);
  void showModalLoading(BuildContext context);
  void dismissDialog(BuildContext context);

  void ShowAsktoConfirm(
      BuildContext context, String message, Function retryActionFunction,
      {String ok = AppStrings.ok, String cancelText = AppStrings.dismiss});

  void showPopUpOkWithCustomLottie(
    BuildContext context,
    String message, {
    String lottiePath = Assets.assetsJsonError,
  });
}

class ShowAlertMessageImpl implements IShowAlertMessage {
  @override
  void showErrorPopUpOk(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize12),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonError),
                _getMessage(context,
                    message.isEmpty ? AppStrings.unknownError : message),
                _getPopUpButton(context)
              ]),
            ));
  }

  @override
  void showAskContinueSettingPopup(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize12),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonError),
                _getMessage(context,
                    message.isEmpty ? AppStrings.unknownError : message),
                _getDialogContentButton(context, [
                  _getPopUpDismissButton(context),
                  _getSettingButton(context),
                ])
              ]),
            ));
  }

  Widget _getSettingButton(
    BuildContext context,
  ) {
    return AppStrings.settings.toEelevatedButton(context, () async {
      //pop
      Navigator.of(context).pop();
      await openAppSettings();
    },
        color: ColorManager.primaryColor,
        fontSize: FontManager.fontSize12,
        height: AppSize.appSize40,
        colortext: ColorManager.whiteColor,
        fontWeight: FontWeight.bold).paddingAll(AppSize.appSize12);
  }

  @override
  void showSuccessPopUpOk(BuildContext context, String message,
      {String hint = ''}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                const Icon(
                  Icons.check_circle,
                  color: ColorManager.primaryColor,
                ),
                AppSize.appSize10.heightSizedBox,
                _getMessage(context, message),
                AppSize.appSize10.heightSizedBox,
                if (hint.isNotEmpty)
                  _getMessageDesc(
                    context,
                    hint,
                  ),
                _getPopUpButton(context)
              ]),
            ));
  }

  @override
  void showSuccessPopUpOkWithTitle(BuildContext context, String message,
      {String hint = '', String title = '', Function()? onPressed}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                const Icon(
                  Icons.check_circle,
                  color: ColorManager.primaryColor,
                ),
                AppSize.appSize10.heightSizedBox,
                _getMessage(context, message),
                AppSize.appSize10.heightSizedBox,
                if (hint.isNotEmpty)
                  _getMessageDesc(
                    context,
                    hint,
                  ),
                _getPopUpButtonWithValue(
                    context,
                    AppStrings.backToComplaints,
                    onPressed ??
                        () {
                          Navigator.of(context)
                            ..pop()
                            ..pop();
                        })
              ]),
            ));
  }

  @override
  void showSuccessPopUpWithButton(BuildContext context, String message,
      {Widget button = const SizedBox()}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                const Icon(
                  Icons.check_circle,
                  color: ColorManager.primaryColor,
                  size: 40,
                ),
                AppSize.appSize10.heightSizedBox,
                _getMessage(context, message),
                AppSize.appSize10.heightSizedBox,
                button == const SizedBox() ? _getPopUpButton(context) : button,
              ]),
            ));
  }

  @override
  void showSuccess(BuildContext context, String message, String desc) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                AppSize.appSize10.heightSizedBox,
                _getMessage(context, message),
                AppSize.appSize10.heightSizedBox,
                _getMessageDesc(context, desc),
              ]),
            ));
  }

  @override
  void showSuccessPopUpOkWithoutClose(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                _getAnimatedImage(Assets.assetsJsonSuccess),
                AppSize.appSize10.heightSizedBox,
                _getMessage(context, message),
                AppSize.appSize10.heightSizedBox,
                _getPopUpButton(context)
              ]),
            ));
  }

  @override
  void showLoadingPopUp(BuildContext context) {
    dismissDialog(context);
    Navigator.of(context).push(FullScreenModal());
  }

  void showLoadingPopUpr(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        useRootNavigator: true,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                const CircularLoadingIndicator(),
                _getMessage(context, AppStrings.loading),
                AppSize.appSize20.heightSizedBox,
              ]),
            ));
  }

  @override
  void showErrorPopupRetry(
      BuildContext context, String message, Function retryActionFunction) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize12),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonError),
                _getMessage(context,
                    message.isEmpty ? AppStrings.unknownError : message),
                _getRetryButton(context, retryActionFunction)
              ]),
            ));
  }

  @override
  void showAskContinuePopup(
      BuildContext context, String message, Function retryActionFunction,
      {String ok = AppStrings.ok, String cancelText = AppStrings.dismiss}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize12),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonSuccess),
                _getMessage(context,
                    message.isEmpty ? AppStrings.unknownError : message),
                _getDialogContentButton(context, [
                  _getPopUpDismissButton(context),
                  _getExitButton(context, retryActionFunction),
                ])
              ]),
            ));
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
  @override
  void dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.appSize14)),
      elevation: AppSize.appSize1_4,
      backgroundColor: ColorManager.transparentColor,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.appSize14),
            boxShadow: const [BoxShadow(color: ColorManager.primaryColor)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getDialogContentButton(BuildContext context, List<Widget> children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return Center(
      child: SizedBox(
        height: AppSize.appSize100,
        width: AppSize.appSize100,
        child: animationName.toAssetLottie(
          height: AppSize.appSize100,
          width: AppSize.appSize100,
        ),
      ),
    );
  }

  Widget _getMessage(BuildContext context, String message) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(AppSize.appSize8),
          child: (message.isEmpty ? AppStrings.unknownError : message).toText(
              context,
              color: ColorManager.blackColor,
              textAlign: TextAlign.center,
              fontSize: FontManager.fontSize18,
              fontWeight: FontWeight.w600)),
    );
  }

  Widget _getMessageDesc(BuildContext context, String message) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(AppSize.appSize8),
          child: message.toText(context,
              color: ColorManager.blackColor.withOpacity(0.5),
              textAlign: TextAlign.center,
              fontSize: FontManager.fontSize12,
              fontWeight: FontWeight.w300)),
    );
  }

  Widget _getPopUpButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.appSize12),
        child: SizedBox(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSize.appSize10))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: AppStrings.ok.toText(context,
                    color: ColorManager.whiteColor,
                    fontSize: FontManager.fontSize16,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget _getPopUpButtonWithValue(
      BuildContext context, String value, Function()? onPressed) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.appSize12),
        child: SizedBox(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSize.appSize10))),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed.call();
                  }
                },
                child: value.toText(context,
                    color: ColorManager.whiteColor,
                    fontSize: FontManager.fontSize16,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget _getButton(BuildContext context, String title, Function() onPressed) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(AppSize.appSize12),
          child: SizedBox(
              width: context.width - AppSize.appSize80,
              child: title.toEelevatedButton(context, () => onPressed,
                  color: ColorManager.primaryColor,
                  colortext: ColorManager.whiteColor,
                  fontSize: FontManager.fontSize16,
                  fontWeight: FontWeight.bold))),
    );
  }

  Widget _getPopUpDismissButton(BuildContext context,
      {String cancelText = AppStrings.cancel}) {
    return SizedBox(
      width: 90,
      child: cancelText
          .toEelevatedButton(context, () => Navigator.of(context).pop(),
              color: ColorManager.greyColor,
              fontSize: FontManager.fontSize12,
              height: AppSize.appSize40,
              fontWeight: FontWeight.bold)
          .paddingAll(AppSize.appSize12),
    );
  }

  Widget _getRetryButton(BuildContext context, Function retryActionFunction) {
    return AppStrings.ok
        .toEelevatedButton(context, () => retryActionFunction.call(),
            color: ColorManager.primaryColor,
            fontSize: FontManager.fontSize12,
            colortext: ColorManager.whiteColor,
            fontWeight: FontWeight.bold)
        .paddingAll(AppSize.appSize12);
  }

  Widget _getExitButton(BuildContext context, Function retryActionFunction,
      {String ok = AppStrings.yes}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.appSize12),
        child: SizedBox(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSize.appSize10))),
                onPressed: () {
                  retryActionFunction.call();
                },
                child: ok.toText(context,
                    color: ColorManager.whiteColor,
                    fontSize: FontManager.fontSize16,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  @override
  void showModalLoading(BuildContext context) {
    Navigator.of(context).push(FullScreenModal());
  }

  @override
  void showSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
        constraints: const BoxConstraints(maxHeight: 100, minHeight: 50),
        child: message
            .toText(
              context,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.start,
            )
            .towidthSizedBox(context.width * 0.70),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: trans(context, AppStrings.dismiss),
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }

  @override
  void showSnakeBarLoading(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorManager.primaryColor,
      content: Container(
        constraints: const BoxConstraints(maxHeight: 100, minHeight: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            message
                .toText(
                  context,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                )
                .towidthSizedBox(context.width * 0.70),
            const CircularLoadingIndicator()
          ],
        ),
      ),
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.appSize10),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppSize.appSize12),
    ));
  }

  @override
  void showSnakeBarSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorManager.primaryColor,
      content: Container(
        constraints: const BoxConstraints(maxHeight: 100, minHeight: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            message
                .toText(
                  context,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                )
                .towidthSizedBox(context.width * 0.70),
            const Icon(
              Icons.check_circle,
              color: Colors.white,
            )
          ],
        ),
      ),
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.appSize10),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppSize.appSize12),
    ));
  }

  @override
  void showSnakeBarError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorManager.primaryColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.error,
            color: ColorManager.whiteColor,
          ),
          const SizedBox(width: 10),
          Expanded(
              child: message.toText(
            context,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.start,
          )),
        ],
      ),
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.appSize10),
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
  // @override
  // void showSnakeBarError(BuildContext context, String message,
  //     {bool isError = true}) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     backgroundColor: isError ? Colors.white : Colors.greenAccent,
  //     content: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Icon(
  //           isError ? Icons.error_outline : Icons.check_circle_outline,
  //           color: ColorManager.redColor,
  //         ),
  //         const SizedBox(width: 12),
  //         Expanded(
  //           child: Text(
  //             message,
  //             style: const TextStyle(
  //               color: Colors.black,
  //               fontSize: 14,
  //               fontWeight: FontWeight.w500,
  //             ),
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //       ],
  //     ),
  //     duration: const Duration(seconds: 4),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(5.0),
  //       side: const BorderSide(color: ColorManager.primaryColor, width: 2),
  //     ),
  //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //     action: SnackBarAction(
  //       label: 'Dismiss',
  //       textColor: Colors.white,
  //       onPressed: () {
  //         ScaffoldMessenger.of(context).clearSnackBars();
  //       },
  //     ),
  //   ));
  // }

  @override
  void showSnakeBarWithoutClose(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: message
          .toText(
            context,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.start,
          )
          .towidthSizedBox(context.width * 0.70),
      duration: const Duration(seconds: 3),
    ));
  }

  @override
  void successCopied(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Container(
              height: 65,
              width: 130,
              decoration: BoxDecoration(
                color: const Color(0xFFEEEDED),
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: FittedBox(
                child: ColoredBox(
                  color: const Color(0xFFEEEDED),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Color(0xFF1D1B1C),
                        size: 26,
                      ),
                      AppStrings.copied.toText(context,
                          color: ColorManager.blackColor,
                          fontSize: FontManager.fontSize18,
                          fontWeight: FontWeight.w600),
                    ],
                  ).towidthSizedBox(100),
                ),
              ),
            ));
      },
    );
  }

  @override
  void ShowAsktoConfirm(
      BuildContext context, String message, Function retryActionFunction,
      {String ok = AppStrings.ok, String cancelText = AppStrings.dismiss}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize12),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonError),
                _getMessage(context,
                    message.isEmpty ? AppStrings.unknownError : message),
                _getDialogContentButton(context, [
                  SizedBox(
                    width: 100,
                    child: _getPopUpDismissButton(context),
                  ),
                  _getExitButton(context, retryActionFunction),
                ])
              ]),
            ));
  }

  @override
  void showPopUpOkWithCustomLottie(
    BuildContext context,
    String message, {
    String lottiePath = Assets.assetsJsonError,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppSize.appSize12),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(lottiePath),
                _getMessage(context,
                    message.isEmpty ? AppStrings.unknownError : message),
                _getPopUpButton(context)
              ]),
            ));
  }
}

class FullScreenModal extends ModalRoute {
  // constructor
  FullScreenModal();

  @override
  Duration get transitionDuration => const Duration(milliseconds: 50);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.3);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  static const colorizeColors = [
    Colors.white,
    Colors.blue,
    Colors.green,
    ColorManager.redColor,
  ];

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return PopScope(
      onPopInvoked: (value) async => false,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularLoadingIndicator(),
            AppSize.appSize30.heightSizedBox,
            AppStrings.loading.toText(context),
          ],
        )),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
    );
  }
}
