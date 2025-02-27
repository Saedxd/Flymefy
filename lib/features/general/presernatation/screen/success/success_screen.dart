import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/extension/widget.dart';
import 'package:flymefy/core/resources_manager/assets.dart';
import 'package:flymefy/core/resources_manager/color.dart';
import 'package:flymefy/core/resources_manager/values.dart';
import 'package:flymefy/core/routes/routes.dart';
import 'package:flymefy/features/general/presernatation/logic/authentication/authentication_cubit.dart';

class SuccessScreen extends StatefulWidget {
  final String route;
  final String successMessage;
  final String subTitleSuccessMessage;
  final String buttonText;

  const SuccessScreen(
      {super.key,
      required this.route,
      required this.successMessage,
      required this.subTitleSuccessMessage,
      required this.buttonText});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {},
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            height: 55,
            child: widget.buttonText.toEelevatedButton(
              height: 55,
              context,
              () {
                if (widget.route == Routes.porfileScreen) {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Routes.porfileScreen));
                } else {
                  while (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  Navigator.pushReplacementNamed(context, widget.route);
                }
              },
              color: ColorManager.primaryColor,
              colortext: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              width: MediaQuery.of(context).size.width,
            ),
          ).paddingSymmetric(horizontal: 16),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 85,
                    width: 85,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFD6F5DF),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Image.asset(Assets.assetsImgSuccessIcon,
                            height: 48, width: 48, fit: BoxFit.fill),
                      ),
                    )),
                const SizedBox(height: 20),
                widget.successMessage.toText(
                  context,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                AppSize.appSize16.heightSizedBox,
                widget.subTitleSuccessMessage.toText(
                  context,
                  color: Colors.black.withOpacity(.2),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                )
              ],
            ),
          )),
    );
  }
}

class SuccessScreenRegister extends StatefulWidget {
  final String route;
  final String successMessage;
  final String subTitleSuccessMessage;
  final String buttonText;

  const SuccessScreenRegister(
      {super.key,
      required this.route,
      required this.successMessage,
      required this.subTitleSuccessMessage,
      required this.buttonText});

  @override
  State<SuccessScreenRegister> createState() => _SuccessScreenRegisterState();
}

class _SuccessScreenRegisterState extends State<SuccessScreenRegister> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {},
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            height: 55,
            child: widget.buttonText.toEelevatedButton(
              height: 55,
              context,
              () {
                context
                    .read<AuthenticationCubit>()
                    .changeAuthentication(AppAuthenticationLevel.authenticated);
              },
              color: ColorManager.primaryColor,
              colortext: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              width: MediaQuery.of(context).size.width,
            ),
          ).paddingSymmetric(horizontal: 16),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 85,
                    width: 85,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFD6F5DF),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Image.asset(Assets.assetsImgSuccessIcon,
                            height: 48, width: 48, fit: BoxFit.fill),
                      ),
                    )),
                const SizedBox(height: 20),
                widget.successMessage.toText(
                  context,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                AppSize.appSize16.heightSizedBox,
                widget.subTitleSuccessMessage.toText(
                  context,
                  color: Colors.black.withOpacity(.2),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                )
              ],
            ),
          )),
    );
  }
}
