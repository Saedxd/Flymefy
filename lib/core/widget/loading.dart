import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:flymefy/core/extension/context.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/extension/widget.dart';
import 'package:flymefy/core/resources_manager/strings.dart';
import 'package:flymefy/core/resources_manager/values.dart';

import '../resources_manager/color.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: AppSize.appSize24,
          width: AppSize.appSize24,
          child: DottedLoading()),
    );
  }
}

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DottedLoading(),
    );
  }
}

//shimmer loadin list
class ListLoading extends StatelessWidget {
  const ListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DottedLoading(),
    );
  }
}

class LoadinContent extends StatelessWidget {
  final String message;
  const LoadinContent({super.key, this.message = AppStrings.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: context.height / 2,
        width: context.width,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DottedLoading(),
          AppSize.appSize20.heightSizedBox,
          message.toText(
            context,
            color: ColorManager.primaryColor,
            fontSize: AppSize.appSize16,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// button load more

class LoadMoreData extends StatelessWidget {
  final Function() onTap;
  const LoadMoreData({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: [
        const Icon(Icons.refresh, color: ColorManager.primaryColor, size: 20),
        AppSize.appSize5.widthSizedBox,
        AppStrings.loadMore.toText(context,
            color: ColorManager.primaryColor,
            fontSize: AppSize.appSize14,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center),
      ]
          .toRow(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center)
          .toSizedBox(height: 40, width: 150),
    );
  }
}

// class LoadMore extends StatelessWidget {
//   const LoadMore({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => context
//           .read<ChatMessagesBloc>()
//           .add(const ChatClientEventGetMessages()),
//       child: [
//         const Icon(Icons.refresh, color: ColorManager.primaryColor),
//         AppSize.appSize5.widthSizedBox,
//         AppStrings.loadMore.toText(context,
//             color: ColorManager.primaryColor,
//             fontSize: AppSize.appSize16,
//             fontWeight: FontWeight.w500,
//             textAlign: TextAlign.center),
//       ]
//           .toRow(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center)
//           .toSizedBox(height: 40, width: 150),
//     );
//   }
// }

class DottedLoading extends StatefulWidget {
  const DottedLoading({
    super.key,
  });

  @override
  State<DottedLoading> createState() => _DottedLoadingState();
}

class _DottedLoadingState extends State<DottedLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<int> animation;

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    animation = StepTween(begin: 0, end: 8).animate(animController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      // decoration: BoxDecoration(color: Colors.red), //for debugging purposes
      child: CustomPaint(
        painter: DottedCircularProgressIndicatorPainterFb(
            dotColor: ColorManager.blackColor,
            currentDotColor: ColorManager.primaryColor,
            percentage: 0,
            numDots: 6,
            currentDotNum: animation.value,
            dotWidth: 3),
        child: const SizedBox(),
      ),
    );
  }
}

class DottedCircularProgressIndicatorPainterFb extends CustomPainter {
  final double percentage;
  final Color dotColor;
  final Color currentDotColor;
  final int numDots;
  final int currentDotNum;
  final double dotWidth;

  DottedCircularProgressIndicatorPainterFb(
      {required this.dotColor,
      required this.currentDotColor,
      required this.percentage,
      required this.numDots,
      required this.dotWidth,
      required this.currentDotNum});

  @override
  void paint(Canvas canvas, Size size) {
    final double smallestSide = Math.min(size.width, size.height);
    final double radius = (smallestSide / 2 - dotWidth / 2) - dotWidth / 2;
    final Offset centerPoint = Offset(size.width / 2, size.height / 2);

    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = dotColor;

    CircleData myCircle = CircleData(radius: radius, totalNumOfDots: numDots);
    for (var i = 0; i < numDots; i++) {
      if (i == currentDotNum) {
        dotPaint.color = currentDotColor;
      } else {
        dotPaint.color = dotColor;
      }
      canvas.drawCircle(
          centerPoint - myCircle.calcDotOffsetFromCenter(i, radius),
          dotWidth,
          dotPaint);
    }
  }

  @override
  bool shouldRepaint(DottedCircularProgressIndicatorPainterFb oldDelegate) =>
      oldDelegate.currentDotNum != currentDotNum ? true : false;
}

//  Calculats the offst each dot based on the total number of dots
class CircleData {
  int totalNumOfDots;
  double radius;

  CircleData({required this.totalNumOfDots, required this.radius});

  Offset calcDotOffsetFromCenter(int dotNumber, double radius) {
    return Offset(_calcDotX(dotNumber), _calcDotY(dotNumber));
  }

  double _calcDotAngle(int currentDotNumber) {
    return -currentDotNumber * _calcRadiansPerDot();
  }

  double _calcRadiansPerDot() {
    return 2 * Math.pi / (totalNumOfDots);
  }

  double _calcDotX(int thisDotNum) {
    return radius * Math.sin(_calcDotAngle(thisDotNum));
  }

  double _calcDotY(int thisDotNum) {
    return radius * Math.cos(_calcDotAngle(thisDotNum));
  }
}
