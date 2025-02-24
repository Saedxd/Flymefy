// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flymefy/core/di/locator.dart';
// import 'package:flymefy/core/extension/context.dart';
// import 'package:flymefy/core/extension/widget.dart';
// import 'package:flymefy/core/resources_manager/constant.dart';
// import 'package:flymefy/core/widget/loading.dart';
// import 'package:flymefy/core/widget/main_widget.dart';
// import 'package:flymefy/features/home/presentation/screen/home/see_more/points_see_more.dart';

// import '../../../../../core/enum/enums.dart';
// import '../../../../../core/resources_manager/color.dart';
// import '../../../../../core/widget/empty_content.dart';
// import '../../../../../core/widget/error_content.dart';
// import '../../logic/Genral_data_from_api/privacy_terms_cubit.dart';

// class SelfCheckInScreen extends StatelessWidget {
//   const SelfCheckInScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MainHomeWidget(
//       child: BlocProvider<PrivacyTermsCubit>(
//         create: (context) => instance<PrivacyTermsCubit>()
//           ..getTermsData(AppConstants.apiGetSelfCheckIn),
//         child: const ContentView(),
//       ),
//     );
//   }
// }

// class ContentView extends StatelessWidget {
//   const ContentView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.whiteColor,
//       body: const Content(),
//     );
//   }
// }

// class Content extends StatelessWidget {
//   const Content({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PrivacyTermsCubit, PrivacyTermsState>(
//       builder: (context, state) {
//         if (state.flowStateApp == FlowStateApp.loading) {
//           return const Center(
//             child: LoadinContent(),
//           );
//         } else if (state.flowStateApp == FlowStateApp.error) {
//           return Center(
//             child: ErrorContent(
//               message: state.failure.message,
//               onRefresh: () {
//                 context
//                     .read<PrivacyTermsCubit>()
//                     .getTermsData(AppConstants.apiGetSelfCheckIn);
//               },
//             ),
//           );
//         } else if (state.privacyTermsList.privacyTerms.title.isEmpty &&
//             state.privacyTermsList.privacyTerms.description.isEmpty) {
//           return Center(
//             child: EmptyContent(
//               onRefresh: () {
//                 context
//                     .read<PrivacyTermsCubit>()
//                     .getTermsData(AppConstants.apiGetSelfCheckIn);
//               },
//             ),
//           );
//         } else {
//           // list view
//           return SizedBox(
//               width: context.width,
//               height: context.height,
//               child: TitleAndDescription(
//                 title: state.privacyTermsList.privacyTerms.title,
//                 description: state.privacyTermsList.privacyTerms.description,
//               ));
//         }
//       },
//     );
//   }
// }

// class TitleAndDescription extends StatelessWidget {
//   final String title;
//   final String description;

//   const TitleAndDescription({
//     super.key,
//     required this.title,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 65,
//           width: context.width,
//           child: PageHeader(title: title)
//               .marginOnly(top: context.isIOS ? 13 : 20, bottom: 20),
//         ),
//         Expanded(
//           child: SingleChildScrollView(
//             physics:
//                 AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
//             child: Html(
//               data: description,
//             ),
//           ).marginSymmetric(horizontal: 16),
//         ),
//       ],
//     );
//   }
// }
