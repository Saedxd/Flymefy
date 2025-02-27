// // custom Appbar() widget),

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart' as intl;
// import 'package:flymefy/core/enum/enums.dart';
// import 'package:flymefy/core/extension/context.dart';
// import 'package:flymefy/core/extension/data_type.dart';
// import 'package:flymefy/core/extension/widget.dart';
// import 'package:flymefy/core/helper/function.dart';
// import 'package:flymefy/core/resources_manager/assets.dart';
// import 'package:flymefy/core/resources_manager/constant.dart';
// import 'package:flymefy/core/resources_manager/strings.dart';
// import 'package:flymefy/core/resources_manager/values.dart';
// import 'package:flymefy/features/general/presernatation/logic/authentication/authentication_cubit.dart';
// import 'package:flymefy/features/general/presernatation/logic/langauge/langauge_cubit.dart';

// import '../resources_manager/color.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   CustomAppBar({super.key, required this.index, required this.onTap});
//   final int index;
//   void Function(int) onTap;
//   @override
//   Size get preferredSize => const Size.fromHeight(AppSize.appSize65);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width,
//       height: preferredSize.height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Assets.assetsImgLogo.toSvgAssetImage(height: 40, width: 100),
//           [
//             const MusicIcon(),
//             AppSize.appSize8.widthSizedBox,
//             NotificationIcon(
//               isHome: index == 2,
//               onTap: onTap,
//             ),
//           ].toRow(mainAxisAlignment: MainAxisAlignment.end)
//         ],
//       ).paddingSymmetric(
//           vertical: AppSize.appSize12, horizontal: AppSize.appSize16),
//     ).toMainColor(
//       color: Colors.white,
//     );
//   }
// }

// class CustomAppBarLeased extends StatelessWidget
//     implements PreferredSizeWidget {
//   final String title;
//   final bool showNotification;
//   final bool showMusic;
//   final bool showChat;
//   final bool showLogo;
//   final bool isTenant;
//   final int index;
//   final VoidCallback onLogoTapped;
//   void Function(int) onTap;

//   bool isAuthenicated = false;

//   CustomAppBarLeased({
//     super.key,
//     required this.title,
//     required this.isTenant,
//     required this.showNotification,
//     required this.showMusic,
//     required this.showLogo,
//     required this.index,
//     required this.showChat,
//     required this.onLogoTapped,
//     required this.onTap,
//   });

//   @override
//   Size get preferredSize =>
//       Size.fromHeight(index == 2 ? AppSize.appSize65 : AppSize.appSize65);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 0,
//       color: Colors.white,
//       child: Container(
//         decoration: const BoxDecoration(
//           //    color: Colors.red,
//           border: Border(
//             bottom: BorderSide(
//               color: Colors.grey, // Color of the bottom border
//               width: 0.15, // Width of the bottom border
//             ),
//           ),
//         ),
//         width: context.width,
//         height: preferredSize.height,
//         child: Row(
//           mainAxisAlignment:
//               //  index == 0
//               //     ?
//               MainAxisAlignment.spaceBetween,
//           // :
//           //   MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //if ((isTenant && index != 2) || !isTenant)

//             if (isTenant && index == 2)
//               const LogoAndUserNameAppbarTenant().toButton(() {
//                 onLogoTapped();
//               })
//             else
//               [
//                 // if (showLogo)
//                 //   Assets.assetsImgLogowithoutWord
//                 //       .toSvgAssetImage(fromLogin: true,
//                 //        height: 38,
//                 //        width: 35
//                 //        ),
//                 // const SizedBox(
//                 //   width: 6,
//                 // ),

//                 title
//                     .toText(context, fontSize: 23, fontWeight: FontWeight.w500)
//                     .marginOnly(top: 10),
//               ].toRow(),
//             [
//               if (showChat && !(isTenant && index == 2)) ...[
//                 const ChatIcon(),
//                 // AppSize.appSize8.widthSizedBox,
//               ],
//               if (showMusic && !(isTenant && index == 2)) ...[
//                 const MusicIcon(),
//                 // AppSize.appSize8.widthSizedBox,
//               ],
//               NotificationIcon(
//                 isHome: index == 2,
//                 onTap: onTap,
//               )
//             ].toRow(mainAxisAlignment: MainAxisAlignment.end)
//           ],
//         ).paddingOnly(
//           top: AppSize.appSize12,
//           right: AppSize.appSize30,
//           left: AppSize.appSize20,
//         ),
//       ).toMainColor(
//         color: Colors.white,
//       ),
//     );
//   }
// }

// class LogoAndUserNameAppbarTenant extends StatefulWidget {
//   const LogoAndUserNameAppbarTenant({super.key});

//   @override
//   State<LogoAndUserNameAppbarTenant> createState() =>
//       _LogoAndUserNameAppbarTenantState();
// }

// class _LogoAndUserNameAppbarTenantState
//     extends State<LogoAndUserNameAppbarTenant> {
//   bool isAuthenticated = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     isAuthenticated =
//         context.read<AuthenticationCubit>().state.appAuthenticationLevel ==
//             AppAuthenticationLevel.authenticated;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//         value: context.read<AuthenticationCubit>(),
//         child: SizedBox(
//             width: 250,
//             height: 80,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Assets.assetsImgLogowithoutWord
//                     .toSvgAssetImage(fromLogin: true, height: 38, width: 35),
//                 AppSize.appSize8.widthSizedBox,
//                 [
//                   AppSize.appSize2.heightSizedBox,
//                   formatDateWithSuffix(DateTime.now(), context.isArabic)
//                       .toText(
//                         context,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: const Color(0xFFA8A4A7),
//                         textAlign: TextAlign.start,
//                         overflow: TextOverflow.ellipsis,
//                       )
//                       .toSizedBox(
//                         width: 200,
//                         height: 17,
//                       ),
//                   BlocBuilder<AuthenticationCubit, AuthenticationState>(
//                     builder: (context, state) {
//                       return SizedBox(
//                         width: 205,
//                         height: 20,
//                         child: Row(
//                           children: [
//                             " ${trans(context, AppStrings.welcome)} ".toText(
//                               context,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: const Color(0xFF585558),
//                               textAlign: TextAlign.start,
//                               overflow: TextOverflow.ellipsis,
//                               // textDirection: TextDirection.rtl,
//                             ),
//                             context
//                                         .read<AuthenticationCubit>()
//                                         .state
//                                         .appAuthenticationLevel ==
//                                     AppAuthenticationLevel.authenticated
//                                 ? ",${processString(state.user.firstName)} !"
//                                     .toText(
//                                       context,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                       color: ColorManager.primaryColor,
//                                       textAlign: TextAlign.start,
//                                       overflow: TextOverflow.ellipsis,
//                                       // textDirection: TextDirection.rtl,
//                                     )
//                                     .towidthSizedBox(context.width * 0.30)
//                                 : const SizedBox(),
//                           ],
//                         ),
//                       );
//                     },
//                   )
//                 ].toColumn(
//                     mainAxisAlignment: !isAuthenticated
//                         ? MainAxisAlignment.center
//                         : MainAxisAlignment.start)
//               ],
//             )));
//   }
// }

// class CustomAppBarTenant extends StatelessWidget
//     implements PreferredSizeWidget {
//   final String title;
//   final bool showNotification;
//   final bool showMusic;
//   final bool showChat;
//   final int index;
//   final void Function(int) onTap;

//   const CustomAppBarTenant(
//       {super.key,
//       required this.title,
//       required this.showNotification,
//       required this.showMusic,
//       required this.showChat,
//       required this.index,
//       required this.onTap});

//   @override
//   Size get preferredSize => const Size.fromHeight(AppSize.appSize65);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width,
//       height: preferredSize.height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           title.toText(context, fontSize: 20, fontWeight: FontWeight.w500),
//           [
//             if (showChat) ...[
//               const ChatIcon(),
//               AppSize.appSize8.widthSizedBox,
//             ],
//             if (showMusic) ...[
//               const MusicIcon(),
//               AppSize.appSize8.widthSizedBox,
//             ],
//             if (showNotification)
//               NotificationIcon(
//                 isHome: index == 2,
//                 onTap: onTap,
//               )
//           ].toRow(mainAxisAlignment: MainAxisAlignment.end)
//         ],
//       ).paddingSymmetric(
//           vertical: AppSize.appSize12, horizontal: AppSize.appSize16),
//     ).toMainColor(
//       color: Colors.white,
//     );
//   }
// }

// class CustomAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool isCloseButton;
//   final bool showLogo;

//   const CustomAuthAppBar(
//       {super.key, this.isCloseButton = false, this.showLogo = true});

//   @override
//   Size get preferredSize => const Size.fromHeight(AppSize.appSize85);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width,
//       height: preferredSize.height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           if (Navigator.canPop(context)) const CustomCloseButton(),
//           if (showLogo && !Navigator.canPop(context))
//             SizedBox(
//               width: context.width * 0.9,
//               child: [
//                 Assets.assetsImgLogo
//                     .toSvgAssetImage(fromLogin: true, height: 40, width: 85),
//                 BlocBuilder<LangaugeCubit, LangaugeState>(
//                     builder: (context, state) {
//                   return SizedBox(
//                     child: (state.locale.languageCode == "en"
//                             ? AppStrings.english
//                             : AppStrings.arabic)
//                         .toText(context,
//                             color: const Color.fromRGBO(124, 17, 74, 1),
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             lineHeight: 1.5),
//                   ).toButton(() {
//                     if (state.locale != AppConstants.englishLocal) {
//                       context.read<LangaugeCubit>().changeLang('en');
//                     } else {
//                       context.read<LangaugeCubit>().changeLang('ar');
//                     }
//                   });
//                 }),
//               ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
//             )
//         ],
//       ).paddingSymmetric(horizontal: AppSize.appSize0),
//     );
//   }
// }

// class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomHomeAppBar({super.key, required this.index, required this.onTap});
//   final int index;
//   final void Function(int) onTap;

//   @override
//   Size get preferredSize => const Size.fromHeight(AppSize.appSize85);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: AppSize.appSize8),
//       width: context.width,
//       height: preferredSize.height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const CustomDrawerButton(),
//           NotificationIcon(
//             isHome: index == 2,
//             onTap: onTap,
//           ),
//         ],
//       ).paddingSymmetric(horizontal: AppSize.appSize0),
//     );
//   }
// }

// class CustomOnBoradingAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   const CustomOnBoradingAppBar({super.key, this.onPressed});

//   final Function()? onPressed;

//   @override
//   Size get preferredSize => const Size.fromHeight(AppSize.appSize120);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: AppSize.appSize16),
//       padding: const EdgeInsets.symmetric(horizontal: AppSize.appSize16),
//       width: context.width,
//       height: preferredSize.height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Assets.assetsImgLogo.toSvgAssetImage(
//             width: AppSize.appSize80,
//             height: AppSize.appSize35,
//           ),
//           CustomCloseButton(
//             onPressed: onPressed,
//           ),
//         ],
//       ).paddingSymmetric(
//           horizontal: AppSize.appSize0, vertical: AppSize.appSize8),
//     );
//   }
// }
// // PreferredSizeWidget

// class CustomAppBarOptional extends StatelessWidget
//     implements PreferredSizeWidget {
//   final String? title;

//   const CustomAppBarOptional({super.key, this.title});

//   @override
//   Size get preferredSize => const Size.fromHeight(AppSize.appSize85);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width,
//       height: preferredSize.height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const CustomCloseButton(
//             isClose: false,
//           ),
//           AppSize.appSize0.widthSizedBox,
//           if (title != null)
//             title.toText(context,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: ColorManager.blackColor),
//           AppSize.appSize0.widthSizedBox,
//         ],
//       ).paddingSymmetric(horizontal: AppSize.appSize16),
//     );
//   }
// }

// String formatDateRangeWithoutYear(
//     String startDate, String endDate, bool isArabic) {
//   // Parse the date strings into DateTime objects
//   DateTime startDateTime = DateTime.tryParse(startDate) ?? DateTime.now();
//   DateTime endDateTime = DateTime.tryParse(endDate) ?? DateTime.now();

//   // Set the locale based on the language preference
//   String locale = isArabic ? 'ar' : 'en';

//   // Define a date formatter with abbreviated month names
//   intl.DateFormat formatter = intl.DateFormat('d MMM', locale);

//   // Check if the months are the same
//   if (startDateTime.month == endDateTime.month) {
//     return '${formatter.format(startDateTime)} - ${endDateTime.day} ${formatter.format(endDateTime).split(' ')[1]}';
//   } else {
//     return '${formatter.format(startDateTime)} - ${formatter.format(endDateTime)}';
//   }
// }
