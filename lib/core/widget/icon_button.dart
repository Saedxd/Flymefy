import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onPressed;
  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.appSize40,
      width: AppSize.appSize40,
      padding: const EdgeInsets.all(AppSize.appSize0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorManager.hintGrayColor,
          borderRadius: BorderRadius.circular(AppSize.appSize4),
          shape: BoxShape.rectangle),
      child: IconButton(
          onPressed: onPressed ??
              () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: AppSize.appSize20,
            color: ColorManager.primaryColor,
          )),
    );
  }
}

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          size: AppSize.appSize35,
          color: ColorManager.primaryColor,
        ));
  }
}

class CustomCloseButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isClose;
  final double height;
  final double widht;
  final double size;
  const CustomCloseButton({
    super.key,
    this.onPressed,
    this.isClose = true,
    this.height = AppSize.appSize48,
    this.widht = AppSize.appSize48,
    this.size = 35,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, // border color
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: ColorManager.borderColor)),
      child: IconButton(
        padding: const EdgeInsets.all(AppSize.appSize0),
        iconSize: AppSize.appSize35,
        alignment: Alignment.center,
        onPressed: onPressed ??
            () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
        icon: Icon(
          isClose ? Icons.close : Icons.arrow_back_ios,
          size: size,
          color: const Color(0xFF101828),
        ),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  NotificationIcon({super.key, required this.isHome, required this.onTap});
  final bool isHome;
  void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.notification, arguments: {
              "onTap": onTap,
            });
          },
          child: Container(
            width: context.width * 0.1,
            height: context.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              border: Border.all(
                color: Color.fromRGBO(237, 236, 237, 1),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.width * 0.05,
                  height: context.width * 0.05,
                  child: SvgPicture.asset(
                    Assets.assetsImgNotification,
                    width: context.width * 0.05,
                    height: context.width * 0.05,
                    color: const Color(0xFF1D1B1C),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChatIcon extends StatelessWidget {
  const ChatIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.appSize45,
      width: AppSize.appSize45,
      decoration: BoxDecoration(
          color: Colors.white, // border color
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: const Color(0xFFEEEDED))),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.chat,
          );
        },
        child: Center(
          child: FittedBox(
            child: SizedBox(
              width: AppSize.appSize20,
              height: AppSize.appSize20,
              child: Image.asset(
                Assets.assetsImgIconchatIcon,
                width: AppSize.appSize20,
                height: AppSize.appSize20,
                color: const Color(0xFF1D1B1C),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MusicIcon extends StatelessWidget {
  const MusicIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.appSize45,
      width: AppSize.appSize45,
      decoration: BoxDecoration(
          color: Colors.white, // border color
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: const Color(0xFFEEEDED))),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.music,
          );
        },
        child: Center(
          child: FittedBox(
            child: SizedBox(
              width: AppSize.appSize20,
              height: AppSize.appSize20,
              child: Image.asset(
                Assets.assetsImgHeadsetMicmuiscIcon,
                width: AppSize.appSize20,
                height: AppSize.appSize20,
                color: const Color(0xFF1D1B1C),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
