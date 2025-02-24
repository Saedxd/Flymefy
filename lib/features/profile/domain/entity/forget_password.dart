import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordData extends Equatable {
  final String phone;
  final String code;

  const ForgetPasswordData({required this.phone, required this.code});

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordData(
      phone: '',
      code: json['data'],
    );
  }

  //copyWith
  ForgetPasswordData copyWith({
    String? phone,
    String? code,
  }) {
    return ForgetPasswordData(
      phone: phone ?? this.phone,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [phone, code];
}

class OTPData extends Equatable {
  final String message;
  final String id;

  const OTPData({
    this.message = '',
    this.id = '',
  });

  OTPData copyWith({
    String? message,
    String? id,
  }) {
    return OTPData(
      message: message ?? this.message,
      id: id ?? this.id,
    );
  }

  //from map
  factory OTPData.fromMap(Map<String, dynamic> map) {
    return OTPData(
      message: map['message'] ?? '',
      id: map['id'] ?? '',
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'id': id,
    };
  }

  @override
  List<Object?> get props => [message, id];
}

class OTPResndCodeData extends Equatable {
  final List<String> message;
  final String id;
  final String resetToken;

  const OTPResndCodeData({
    this.message = const [],
    this.id = '',
    this.resetToken = '',
  });

  OTPResndCodeData copyWith({
    List<String>? message,
    String? id,
    String? resetToken,
  }) {
    return OTPResndCodeData(
      message: message ?? this.message,
      id: id ?? this.id,
      resetToken: resetToken ?? this.resetToken,
    );
  }

  //from map
  factory OTPResndCodeData.fromMap(Map<String, dynamic> map) {
    return OTPResndCodeData(
      message: map['message'] != null ? map['message'].cast<String>() : '',
      id: map['id'] ?? '',
      resetToken: map['reset_Token'] ?? '',
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'id': id,
      'resetToken': resetToken,
    };
  }

  @override
  List<Object?> get props => [message, id];
}

extension OTPDataExtension on OTPData {
  bool get isValid => message.isNotEmpty;
}

extension OTPDataExten on Response {
  OTPData toOTPDomain() {
    return OTPData.fromMap(data as Map<String, dynamic>);
  }
}

class GeneralSuccessData extends Equatable {
  final String message;
  final String id;
  final String newStatus;
  final String newStatusId;


  const GeneralSuccessData(
      {this.message = '',
      this.id = '',
      this.newStatus = '',
      this.newStatusId = "0"});

  //fromjson
  factory GeneralSuccessData.fromJson(Map<String, dynamic> map) {
    return GeneralSuccessData(
      message: map['message'] ?? '',
      id: map['id'] ?? '',
      newStatus: map['new_Status'] ?? '',
      newStatusId: map['new_Status_ID'] ?? '',
    );
  }

  @override
  List<Object?> get props => [message, id, newStatus, newStatusId];
}

/*

  
*/
class SuccessUploadFile extends Equatable {
  final String fileID;
  final String fileName;
  final String filePath;

  const SuccessUploadFile({
    this.fileID = '',
    this.fileName = '',
    this.filePath = '',
  });

  SuccessUploadFile copyWith({
    String? fileID,
    String? fileName,
    String? filePath,
  }) {
    return SuccessUploadFile(
      fileID: fileID ?? this.fileID,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  List<Object?> get props => [fileID, fileName, filePath];

  //from jsom
  factory SuccessUploadFile.fromMap(Map<String, dynamic> map) {
    return SuccessUploadFile(
      fileID: map['file_ID'] ?? '',
      fileName: map['file_Name'] ?? '',
      filePath: map['file_Path'] ?? '',
    );
  }
}

extension SuccessUploadFileExten on Response {
  SuccessUploadFile toSuccessUploadFileDomain() {
    return SuccessUploadFile.fromMap(data as Map<String, dynamic>);
  }
}

/*
[
  {
    "file_ID": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "file_Name": "string",
    "file_Path": "string"
}

]

*/

class SuccessUploadFiles extends Equatable {
  final List<SuccessUploadFile> files;

  const SuccessUploadFiles({
    this.files = const [],
  });

  SuccessUploadFiles copyWith({
    List<SuccessUploadFile>? files,
  }) {
    return SuccessUploadFiles(
      files: files ?? this.files,
    );
  }

  @override
  List<Object?> get props => [files];

  //from jsom
  factory SuccessUploadFiles.fromMap(List<dynamic> map) {
    return SuccessUploadFiles(
      files: List<SuccessUploadFile>.from(
          map.map((x) => SuccessUploadFile.fromMap(x))),
    );
  }
}

extension SuccessUploadFilesExten on Response {
  SuccessUploadFiles toSuccessUploadFilesDomain() {
    return SuccessUploadFiles.fromMap(data as List<dynamic>);
  }
}

/*

{
  "message": "string",
  "chat_ID": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
}
*/

class SuccessSendChat extends Equatable {
  final String message;
  final String chatID;

  const SuccessSendChat({
    this.message = '',
    this.chatID = '',
  });

  SuccessSendChat copyWith({
    String? message,
    String? chatID,
  }) {
    return SuccessSendChat(
      message: message ?? this.message,
      chatID: chatID ?? this.chatID,
    );
  }

  @override
  List<Object?> get props => [message, chatID];

  //from jsom
  factory SuccessSendChat.fromMap(Map<String, dynamic> map) {
    return SuccessSendChat(
      message: map['message'] ?? '',
      chatID: map['chat_ID'] ?? '',
    );
  }
}

extension SuccessSendChatExten on Response {
  SuccessSendChat toSuccessSendChatDomain() {
    return SuccessSendChat.fromMap(data as Map<String, dynamic>);
  }
}
