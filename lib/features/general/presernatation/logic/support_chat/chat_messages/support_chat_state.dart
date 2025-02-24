// part of 'support_chat_cubit.dart';

// class SupportChatState extends Equatable {
//   final UserAppInfo myAccount;
//   final Failure failure;
//   final FlowStateApp flowStateApp;
//   final SupportChat chat;
//   final String currentMessage;
//   List<Message> chatMessages;

//   final PaginationRequest paginationRequest;

//   // Map<String, List<SupportChatItem>> groupMessagesByDate() {
//   //   // Create a copy of chats and sort it by date
//   //   List<SupportChatItem> sortedChats = List.from(chat.chats);
//   //   sortedChats.sort(
//   //       (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));

//   //   Map<String, List<SupportChatItem>> groupedMessages = {};

//   //   for (var message in sortedChats) {
//   //     // Create a date key based on message date
//   //     String dateKey =
//   //         "${DateTime.parse(message.date).year}-${DateTime.parse(message.date).month}-${DateTime.parse(message.date).day}";

//   //     if (!groupedMessages.containsKey(dateKey)) {
//   //       groupedMessages[dateKey] = [];
//   //     }
//   //     groupedMessages[dateKey]!.add(message);
//   //   }

//   //   return groupedMessages;
//   // }

//   SupportChatState({
//     this.failure = const Failure.empty(),
//     this.flowStateApp = FlowStateApp.normal,
//     this.currentMessage = '',
//     this.myAccount = const UserAppInfo(),
//     this.chat = const SupportChat(),
//     this.chatMessages = const [],
//     PaginationRequest? paginationRequest, // nullable and passed to constructor
//   }) : paginationRequest =
//             paginationRequest ?? PaginationRequest(1); // default value

//   SupportChatState copyWith({
//     Failure? failure,
//     FlowStateApp? flowStateApp,
//     String? currentMessage,
//     bool? userIsOnline,
//     UserAppInfo? myAccount,
//     SupportChat? chat,
//     List<Message>? chatMessages,
//   }) =>
//       SupportChatState(
//         failure: failure ?? this.failure,
//         flowStateApp: flowStateApp ?? this.flowStateApp,
//         currentMessage: currentMessage ?? this.currentMessage,
//         myAccount: myAccount ?? this.myAccount,
//         chat: chat ?? this.chat,
//         chatMessages: chatMessages ?? this.chatMessages,
//       );

//   @override
//   List<Object?> get props =>
//       [failure, flowStateApp, currentMessage, myAccount, chat, chatMessages];
// }

// class Message extends Equatable {
//   final int id;
//   final String content;
//   final String type; // Either 'TEXT' or 'IMAGE'
//   final String sentAt;
//   final bool isReaded;
//   final bool isAdmin;

//   const Message({
//     this.id = 0,
//     this.content = '',
//     this.type = '',
//     this.sentAt = '',
//     this.isReaded = false,
//     this.isAdmin = false,
//   });

//   factory Message.fromJson(Map<String, dynamic> json) {
//     return Message(
//       id: json['id'] ?? 0,
//       content: json['content'] ?? '',
//       type: json['type'] ?? '',
//       sentAt: json['sent_at'] ?? '',
//       isReaded: json['is_readed'] ?? false,
//       isAdmin: json['is_admin'] ?? false,
//     );
//   }

//   bool get isImage => type == 'IMAGE';
//   bool get isText => type == 'TEXT';
//   bool get isAudio => type == 'AUDIO';

//   DateTime get date => DateTime.tryParse(sentAt) ?? DateTime.now();

//   //copy with
//   Message copyWith({
//     int? id,
//     bool? isAdmin,
//     String? content,
//     String? type,
//     String? sentAt,
//   }) {
//     return Message(
//       id: id ?? this.id,
//       content: content ?? this.content,
//       type: type ?? this.type,
//       sentAt: sentAt ?? this.sentAt,
//       isAdmin: isAdmin ?? this.isAdmin,
//     );
//   }

//   @override
//   List<Object> get props => [
//         id,
//         content,
//         type,
//         sentAt,
//         isReaded,
//         isAdmin,
//       ];
// }
