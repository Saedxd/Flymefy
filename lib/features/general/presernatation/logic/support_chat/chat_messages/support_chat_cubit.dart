// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flymefy/core/enum/enums.dart';
// import 'package:flymefy/core/error/failure.dart';
// import 'package:flymefy/features/auth/domain/entity/user.dart';
// import 'package:flymefy/features/general/data/request/request.dart';
// import 'package:flymefy/features/general/domain/entity/support_chat.dart';
// import 'package:flymefy/features/general/domain/usecase/lang_usecase.dart';
// import 'package:flymefy/features/notification/data/request/request.dart';

// part 'support_chat_state.dart';

// class SupportChatCubit extends Cubit<SupportChatState> {
//   final SendMessageToHelpCenterUseCase _sendMessageToHelpCenterUseCase;
//   final GetMessagesSupportChatUseCase _getMessagesSupportChatUseCase;

//   SupportChatCubit(
//       {required SendMessageToHelpCenterUseCase sendMessageToHelpCenterUseCase,
//       required GetMessagesSupportChatUseCase getMessagesSupportChatUseCase})
//       : _sendMessageToHelpCenterUseCase = sendMessageToHelpCenterUseCase,
//         _getMessagesSupportChatUseCase = getMessagesSupportChatUseCase,
//         super(SupportChatState());
//   void getChatMessages(BuildContext context) async {
//     // Emit loading state
//     emit(state.copyWith(
//       flowStateApp: FlowStateApp.loading,
//     ));

//     // Fetch chat messages using the use case
//     final result = await _getMessagesSupportChatUseCase(
//       state.paginationRequest.copyWith(page: 1, pageSize: 10),
//     );

// // Define the predefined messages
//     // final List<SupportChatItem> initialMessages = [
//     //   SupportChatItem(
//     //     message: context.isArabic
//     //         ? "مرحبًا ${context.read<AuthenticationCubit>().state.user.firstName}، دعنا نقدم لك المساعدة. سنطرح عليك بعض الأسئلة ثم نضعك على اتصال مع أحد أعضاء فريقنا."
//     //         : "Hello ${context.read<AuthenticationCubit>().state.user.firstName}, let us assist you. We will ask you some questions and then connect you with a member of our team.",
//     //     date: DateTime.now().toString(),
//     //     fromAdmin: true,
//     //   ),
//     //   SupportChatItem(
//     //     message: context.isArabic
//     //         ? "هل يمكنك وصف مشكلتك بجمل قصيرة؟ سيساعد هذا فريقنا على فهم ما يحدث. الرجاء عدم ارسال اي بيانات حساسة مثل أرقام بطاقات الائتمان."
//     //         : "Can you describe your issue in short sentences? This will help our team understand what is happening. Please do not send any sensitive data like credit card numbers.",
//     //     date: DateTime.now().toString(),
//     //     fromAdmin: true,
//     //   ),
//     // ];

//     // Handle the result of the use case
//     result.fold(
//       (failure) {
//         // Emit error state if fetching chat fails
//         emit(
//             state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
//       },
//       (data) {
//         // Prepend predefined messages to the fetched chat messages
//         final List<SupportChatItem> updatedChat = [
//           ...data.chats,
//           //  ...initialMessages,
//         ];

//         emit(state.copyWith(
//           chat: data.copyWith(chats: updatedChat),
//           flowStateApp: FlowStateApp.success,
//         ));
//       },
//     );
//   }

//   void sendMessage(String message) async {
//     List<SupportChatItem> chat = state.chat.chats
//       ..insert(
//           0,
//           SupportChatItem(
//             message: message,
//             fromAdmin: false,
//             date: DateTime.now().toString(),
//           ));

//     emit(state.copyWith(chat: state.chat.copyWith(chats: chat)));

//     emit(state.copyWith(
//       flowStateApp: FlowStateApp.loading,
//     ));
//     final result = await _sendMessageToHelpCenterUseCase(
//       HelpCenterRequest(
//         message: message,
//       ),
//     );

//     result.fold(
//       (failure) {
//         emit(state.copyWith(
//           flowStateApp: FlowStateApp.error,
//           failure: failure,
//         ));
//       },
//       (data) {
//         emit(state.copyWith(
//           flowStateApp: FlowStateApp.success,
//         ));
//       },
//     );
//   }
// }
