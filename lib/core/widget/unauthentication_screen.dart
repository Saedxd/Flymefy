import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/extension/widget.dart';
import 'package:flymefy/core/resources_manager/assets.dart';
import 'package:flymefy/core/resources_manager/color.dart';
import 'package:flymefy/core/resources_manager/strings.dart';
import 'package:flymefy/core/resources_manager/values.dart';
import 'package:flymefy/features/general/presernatation/logic/authentication/authentication_cubit.dart';

class UnAuthenticatedContent extends StatelessWidget {
  const UnAuthenticatedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          [
            Center(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: ColorManager.primaryColor,
                child: Assets.assetsImgLogowithoutWord.toSvgAssetImage(
                  fromLogin: true,
                  width: 35,
                  height: 35,
                  color: Colors.white,
                ),
              ),
            ),
            AppSize.appSize20.heightSizedBox,
            AppStrings.welcomeToRestFort.toText(context,
                fontSize: AppSize.appSize22,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                color: ColorManager.blackColor),
            AppSize.appSize10.heightSizedBox,
            SizedBox(
              width: 230,
              child: AppStrings
                  .pleaseLoginOrMakeANewAccountToEnjoyRentingYourPropertyOrFindingYourNextHome
                  .toText(context,
                      fontSize: AppSize.appSize14,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      color: ColorManager.hintGrayColor),
            ),
          ].toColumn(),
          AppSize.appSize20.heightSizedBox,
          [
            Button(
              text: AppStrings.login,
              onTap: () {
                context.read<AuthenticationCubit>().changeAuthentication(
                      AppAuthenticationLevel.unAuthenticated,
                    );
                // while (navigator.canPop()) {
                //   navigator.pop();
                // }
                // navigator.pushNamedAndRemoveUntil(
                //   Routes.login,
                //   (Route<dynamic> route) => false,
                // );
              },
            ),
          ].toRow(mainAxisAlignment: MainAxisAlignment.center)
        ],
      ).marginSymmetric(vertical: 15),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const Button({super.key, required this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 38,
      decoration: const BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          )),
      child: Center(
        child: text.toText(context,
            color: ColorManager.whiteColor,
            fontSize: AppSize.appSize18,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
      ),
    ).toButton(onTap);
  }
}
