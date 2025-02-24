import 'package:flutter/material.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/resources_manager/assets.dart';

import '../resources_manager/strings.dart';
import '../resources_manager/values.dart';

class UserBlockedContent extends StatelessWidget {
  const UserBlockedContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.assetsJsonBlocked.toAssetLottie(),
          AppSize.appSize10.heightSizedBox,
          AppStrings.userBlocked.toText(context),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
