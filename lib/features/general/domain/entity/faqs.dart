// import 'package:equatable/equatable.dart';

// class FaqItem extends Equatable {
//   final int id;
//   final String question;
//   final String answer;

//   const FaqItem({
//     required this.id,
//     required this.question,
//     required this.answer,
//   });

//   @override
//   List<Object?> get props => [id, question, answer];

//   factory FaqItem.fromJson(Map<String, dynamic> json) {
//     return FaqItem(
//       id: json['id'] ?? 0,
//       question: json['question'] ?? '',
//       answer: json['answer'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'question': question,
//       'answer': answer,
//     };
//   }
// }

// // Full response wrapper for handling the entire response
// class FaqsResponse extends Equatable {
//   final int status;
//   final bool success;
//   final String? message;
//   final List<FaqItem> data; // Change this to a List of FaqItem
//   final Pagination? pagination;

//   const FaqsResponse({
//     this.status = 0,
//     this.success = false,
//     this.message = "",
//     this.data = const [],
//     this.pagination = const Pagination(),
//   });

//   FaqsResponse copyWith({
//     int? status,
//     bool? success,
//     String? message,
//     List<FaqItem>? data,
//     Pagination? pagination,
//   }) {
//     return FaqsResponse(
//       status: status ?? this.status,
//       success: success ?? this.success,
//       message: message ?? this.message,
//       data: data ?? this.data,
//       pagination: pagination ?? this.pagination,
//     );
//   }

//   @override
//   List<Object?> get props => [status, success, message, data, pagination];

//   // From JSON
//   factory FaqsResponse.fromJson(Map<String, dynamic> json) {
//     return FaqsResponse(
//         status: json['status'] ?? 0,
//         success: json['success'] ?? false,
//         message: json['message'],
//         data: (json['data'] as List<dynamic>)
//             .map((e) => FaqItem.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         pagination: json['pagination'] == null
//             ? null
//             : Pagination.fromJson(json['pagination']));
//   }

//   // To JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'success': success,
//       'message': message,
//       'data': data.map((e) => e.toJson()).toList(),
//       // 'pagination': pagination?.toJson(),
//     };
//   }
// }
