// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flymefy/core/enum/enums.dart';
// import 'package:flymefy/core/widget/empty_content.dart';
// import 'package:flymefy/core/widget/error_content.dart';
// import 'package:flymefy/core/widget/loading.dart';
// import 'package:flymefy/features/general/presernatation/logic/support_chat/chat_messages/support_chat_cubit.dart';
// import 'package:flymefy/features/general/presernatation/screen/Support_chat/support_chat.dart';

// class ChatMesaagesListViewPaigation extends StatefulWidget {
//   const ChatMesaagesListViewPaigation({
//     super.key,
//   });

//   @override
//   State<ChatMesaagesListViewPaigation> createState() =>
//       _ChatMesaagesListViewPaigationState();
// }

// class _ChatMesaagesListViewPaigationState
//     extends State<ChatMesaagesListViewPaigation> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SupportChatCubit, SupportChatState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return state.flowStateApp == FlowStateApp.loading &&
//                 state.chat.chats.isEmpty
//             ? const Center(
//                 child: DottedLoading(),
//               )
//             : state.flowStateApp == FlowStateApp.error &&
//                     state.chat.chats.isEmpty
//                 ? Center(
//                     child: ErrorContent(
//                       message: state.failure.message,
//                       onRefresh: () {
//                         context
//                             .read<SupportChatCubit>()
//                             .getChatMessages(context);
//                       },
//                     ),
//                   )
//                 : state.flowStateApp == FlowStateApp.normal &&
//                         state.chat.chats.isEmpty
//                     ? Center(
//                         child: EmptyContent(
//                           onRefresh: () {
//                             // context.read<SupportChatCubit>()
//                           },
//                         ),
//                       )
//                     : Stack(
//                         alignment: Alignment.topCenter,
//                         children: [
//                           ListView.builder(
//                             reverse: true,
//                             itemCount: state.chat.chats.length,
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   DateTimeMessages(
//                                     date: state.chat.chats[index].date,
//                                   ),
//                                   MessageImageTextClientProviderBuilder(
//                                     message: state.chat.chats[index],
//                                   )
//                                 ],
//                               );
//                             },
//                           ),
//                         ],
//                       );
//       },
//     );
//   }

//   bool _isSameDay(DateTime date1, DateTime date2) {
//     return date1.year == date2.year &&
//         date1.month == date2.month &&
//         date1.day == date2.day;
//   }
// }
