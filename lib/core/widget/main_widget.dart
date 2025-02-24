import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flymefy/core/extension/context.dart';
import 'package:flymefy/core/resources_manager/color.dart';

// class MainWidget extends StatelessWidget {
//   const MainWidget(
//       {super.key, required this.child, this.isCloseButton = false});
//   final Widget child;
//   final bool isCloseButton;

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//         value: const SystemUiOverlayStyle(
//             statusBarColor: Colors.white,
//             statusBarBrightness: Brightness.light,
//             statusBarIconBrightness: Brightness.dark,
//             systemNavigationBarColor: Colors.white,
//             systemNavigationBarIconBrightness: Brightness.dark),
//         child: MediaQuery(
//           data: context.mediaQueryData,
//           child: SafeArea(
//               bottom: true,
//               top: true,
//               child: Scaffold(
//                   backgroundColor: ColorManager.whiteColor,
//                   appBar: const CustomAppBar(
//                     index: 0,
//                   ),
//                   body: child)),
//         ));
//   }
// }

class MainHomeWidget extends StatelessWidget {
  const MainHomeWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: ColoredBox(
          color: ColorManager.whiteColor,
          child: MediaQuery(
            data: context.mediaQueryData,
            child: SafeArea(bottom: true, top: true, child: child),
          ),
        ));
  }
}

class MainNavgaitionWidget extends StatelessWidget {
  const MainNavgaitionWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: ColoredBox(
        color: ColorManager.whiteColor,
        child: MediaQuery(
          data: context.mediaQueryData,
          child: SafeArea(bottom: false, top: true, child: child),
        ),
      ),
    );
  }
}

class plainWidget extends StatelessWidget {
  const plainWidget({
    super.key,
    required this.child,
    this.bottomSafeArea = true,
  });
  final Widget child;
  final bool bottomSafeArea;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: MediaQuery(
        data: context.mediaQueryData,
        child: SafeArea(bottom: bottomSafeArea, top: false, child: child),
      ),
    );
  }
}

class ShadowWidget extends StatelessWidget {
  const ShadowWidget({
    super.key,
    required this.child,
    this.bottomSafeArea = true,
  });
  final Widget child;
  final bool bottomSafeArea;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Color(0XFF0D0D0D7D),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: MediaQuery(
          data: context.mediaQueryData,
          child: SafeArea(bottom: bottomSafeArea, top: false, child: child),
        ));
  }
}
