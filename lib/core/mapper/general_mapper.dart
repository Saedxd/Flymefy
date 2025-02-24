import 'package:dio/dio.dart';

import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/general/domain/entity/faqs.dart';
import 'package:flymefy/features/general/domain/entity/support_chat.dart';


import '../../features/general/domain/entity/privacy_terms.dart';

extension PrivacyTermsListEx on Response {
  PrivacyTermsList toPrivacyTermsList() {
    if (data['data'] == null) {
      return const PrivacyTermsList(
          privacyTerms: PrivacyTerms(title: '', description: ''));
    }
    return PrivacyTermsList.fromJson(data);
  }

  // HomeTanentData toHomeTenantDomain() {
  //   if (data['data'] == null) {
  //     return const HomeTanentData();
  //   }
  //   return HomeTanentData.fromJson(data['data']);
  // }

  // UnitPagaintion toUnitPagaintion() {
  //   if (data['data'] == null) {
  //     return const UnitPagaintion(units: []);
  //   }

  //   return UnitPagaintion(
  //       pagination: data['pagination'] == null
  //           ? const Pagination()
  //           : Pagination.fromJson(data['pagination']),
  //       units: (data['data'] as List)
  //           .map((e) => UnitItemHomeTanent.fromJson(e))
  //           .toList());
  // }

  // UnitTenantDetails toUnitTenantDetails() {
  //   if (data['data'] == null) {
  //     return const UnitTenantDetails();
  //   }
  //   return UnitTenantDetails.fromJson(data['data']);
  // }

  // BookingData toBookingData() {
  //   if (data['data'] == null) {
  //     return const BookingData();
  //   }
  //   return BookingData.fromJson(data['data']);
  // }

  // BookingCheckOutData toBookingCheckOutData() {
  //   if (data['data'] == null) {
  //     return const BookingCheckOutData();
  //   }
  //   return BookingCheckOutData.fromJson(data['data']);
  // }

  // AddPromoCodeSuccess toAddPromoCodeSuccess() {
  //   if (data['data'] == null) {
  //     return const AddPromoCodeSuccess();
  //   }
  //   return AddPromoCodeSuccess.fromJson(data['data']);
  // }

  // PromoCodes toPromoCodes() {
  //   if (data['data'] == null) {
  //     return const PromoCodes();
  //   }
  //   return PromoCodes(
  //       promoCodes:
  //           (data['data'] as List).map((e) => PromoCode.fromJson(e)).toList());
  // }

  // Reservations toReservations() {
  //   if (data['data'] == null) {
  //     return const Reservations();
  //   }
  //   return Reservations.fromJson(data);
  // }

  // ReservationDetails toReservationDetails() {
  //   if (data['data'] == null) {
  //     return const ReservationDetails();
  //   }
  //   return ReservationDetails.fromJson(data['data']);
  // }

  // PromoCodeApply toPromoCodeApply() {
  //   if (data['data'] == null) {
  //     return const PromoCodeApply();
  //   }
  //   return PromoCodeApply.fromJson(data['data']);
  // }

  // WishList toWishList() {
  //   if (data['data'] == null) {
  //     return const WishList();
  //   }
  //   return WishList.fromJson(data);
  // }

  // ChatRoomsData toChatUsersToDomain() {
  //   if (data == null) {
  //     return const ChatRoomsData();
  //   } else if (data['results'] == null) {
  //     return const ChatRoomsData();
  //   } else {
  //     return ChatRoomsData.fromJson(data['results']);
  //   }
  // }

  // MessagesData toChatsHistoryToDomain() {
  //   if (data == null) {
  //     return const MessagesData();
  //   } else if (data['results'] == null) {
  //     return const MessagesData();
  //   } else {
  //     return MessagesData.fromJson(data['results']);
  //   }
  // }

  // String getRoomId() {
  //   if (data == null) {
  //     return '';
  //   } else if (data['chats'] == null) {
  //     return '';
  //   } else {
  //     return data['chats']['room_id'].toString();
  //   }
  // }

  // SupportChat toSupportChat() {
  //   if (data['data'] == null) {
  //     return const SupportChat();
  //   }
  //   return SupportChat.fromJson(data);
  // }

  // GetWalletWithdrawalRequests toWalletWithdrawalRequestDomain() {
  //   // Check if the 'data' key or its 'data' field is null
  //   if (data == null || data['data'] == null) {
  //     return const GetWalletWithdrawalRequests(); // Return an empty/default instance
  //   }

  //   // If 'data' is not null, convert it to GetWalletWithdrawalRequests
  //   return GetWalletWithdrawalRequests.fromJson(data);
  // }

  // PointsDetails toPointsDetails() {
  //   if (data['data'] == null) {
  //     return const PointsDetails();
  //   }
  //   return PointsDetails.fromJson(data['data']);
  // }

  // PointsDescription toPointsDescription() {
  //   if (data['data'] == null) {
  //     return PointsDescription();
  //   }
  //   return PointsDescription.fromJson(data);
  // }

  // Statuses toUnitStatues() {
  //   if (data['data'] == null) {
  //     return const Statuses();
  //   }
  //   return Statuses.fromJson(data);
  // }

  // LateEntryData toLateEntryData() {
  //   if (data['data'] == null) {
  //     return const LateEntryData();
  //   }
  //   return LateEntryData.fromJson(data['data']);
  // }

  // UnitChatsLastMessagesData toUnitChatsLastMessagesDataToDomain() {
  //   if (data['data'] == null) {
  //     return const UnitChatsLastMessagesData();
  //   }
  //   return UnitChatsLastMessagesData.fromJson(data);
  // }

  // MessagesData toUnitChatMessagesToDomain() {
  //   if (data == null) {
  //     return const MessagesData();
  //   } else if (data['data'] == null) {
  //     return const MessagesData();
  //   } else {
  //     return MessagesData.fromJson(data);
  //   }
  // }

  // LastReviews toLastReviewsDomain() {
  //   if (data['data'] == null) {
  //     return LastReviews();
  //   }
  //   return LastReviews.fromJson(data);
  // }

  // NotificationsResponse toUnReadDateCountDomain() {
  //   if (data['data'] == null) {
  //     return NotificationsResponse();
  //   }
  //   return NotificationsResponse.fromJson(data);
  // }

  // FaqsResponse faqDataToDomain() {
  //   if (data['data'] == null) {
  //     return FaqsResponse();
  //   }
  //   return FaqsResponse.fromJson(data);
  // }

  // ChangePhone toChangePhoneDomain() {
  //   if (data['data'] == null) {
  //     return ChangePhone();
  //   }
  //   return ChangePhone.fromJson(data);
  // }

  // ComplainTypesResponse toComplainTypesResponse() {
  //   if (data['data'] == null) {
  //     return ComplainTypesResponse();
  //   }
  //   return ComplainTypesResponse.fromJson(data);
  // }

  GeneralSuccessData toGeneralSuccessData() {
    if (data == null) {
      return GeneralSuccessData();
    }
    return GeneralSuccessData.fromJson(data);
  }
}
