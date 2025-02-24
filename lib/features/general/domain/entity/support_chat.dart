// import 'package:equatable/equatable.dart';
// import 'package:flymefy/features/add_propertys/domain/entity/preperty.dart';

// class SupportChat extends Equatable {
//   final List<SupportChatItem> chats;
//   final Pagination? pagination;

//   const SupportChat({
//     this.chats = const [],
//     this.pagination,
//   });

//   // copyWith method to create a modified copy of the object
//   SupportChat copyWith({
//     List<SupportChatItem>? chats,
//     Pagination? pagination,
//   }) {
//     return SupportChat(
//       chats: chats ?? this.chats,
//       pagination: pagination ?? this.pagination,
//     );
//   }
//   // Method to group messages by date

//   @override
//   List<Object?> get props => [chats, pagination];

//   // Factory method to parse JSON and create an instance of SupportChat
//   factory SupportChat.fromJson(Map<String, dynamic> json) {
//     return SupportChat(
//       chats: json['data'] == null
//           ? <SupportChatItem>[]
//           : (json['data'] as List)
//               .map((e) => SupportChatItem.fromJson(e))
//               .toList(),
//       pagination: json['pagination'] == null
//           ? null
//           : Pagination.fromJson(json['pagination']),
//     );
//   }

//   // Method to convert SupportChat to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'data': chats.map((e) => e.toJson()).toList(),
//       'pagination': pagination?.toJson(),
//     };
//   }
// }

// class SupportChatItem extends Equatable {
//   final int id;
//   final String userId;
//   final String message;
//   final String? file;
//   final bool fromAdmin;
//   final String date;

//   const SupportChatItem({
//     this.id = 0,
//     this.userId = '',
//     this.message = '',
//     this.file,
//     this.fromAdmin = false,
//     this.date = '',
//   });

//   @override
//   List<Object?> get props => [id, userId, message, file, fromAdmin, date];

//   // Factory method to parse JSON and create an instance of SupportChatItem
//   factory SupportChatItem.fromJson(Map<String, dynamic> json) {
//     return SupportChatItem(
//       id: json['id'] ?? 0,
//       userId: json['user_id'].toString() ?? '',
//       message: json['message'] ?? '',
//       file: json['file'],
//       fromAdmin: json['from_admin'] ?? false,
//       date: json['date'] ?? '',
//     );
//   }

//   // Method to convert SupportChatItem to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user_id': userId,
//       'message': message,
//       'file': file,
//       'from_admin': fromAdmin,
//       'date': date,
//     };
//   }
// }
