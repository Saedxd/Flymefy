import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flymefy/core/extension/context.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/extension/widget.dart';
import 'package:flymefy/core/resources_manager/color.dart';
import 'package:flymefy/core/resources_manager/strings.dart';

import '../../../../../core/resources_manager/font.dart';
import '../../../../../core/resources_manager/values.dart';

class PermssionScreen extends StatefulWidget {
  final Permission permission;
  const PermssionScreen(
      {super.key = const Key("PermssionScreen"), required this.permission});

  @override
  State<PermssionScreen> createState() => _PermssionScreenState();
}

class _PermssionScreenState extends State<PermssionScreen> {
  PermissionStatus _status = PermissionStatus.denied;
  @override
  void initState() {
    super.initState();

    _requestPermission();
  }

  Future<void> _requestPermission() async {
    _status = await widget.permission.request();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppStrings.permissions.toText(context,
            fontSize: FontManager.fontSize20,
            fontWeight: FontWeight.w500,
            color: ColorManager.primaryColor),
        shape: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(.3), width: 1)),
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          color: ColorManager.primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppStrings.needPermissions
              .toText(context,
                  fontSize: FontManager.fontSize16,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  color: ColorManager.blackColor)
              .towidthSizedBox(context.width - 50),
          AppSize.appSize16.heightSizedBox,
          AppStrings.settings.toEelevatedButton(
            context,
            () {
              openAppSettings();
            },
            color: ColorManager.primaryColor,
            width: context.width - 40,
            height: 45,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            colortext: ColorManager.whiteColor,
          )
        ],
      ).paddingAll(AppSize.appSize16),
    );
  }
}
