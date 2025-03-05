import 'package:dio/dio.dart';
import 'package:flymefy/features/Home/domain/entity/city_airports.dart';
import 'package:flymefy/features/Home/domain/entity/flight_search.dart';

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

  GeneralSuccessData toGeneralSuccessData() {
    if (data == null) {
      return GeneralSuccessData();
    }
    return GeneralSuccessData.fromJson(data);
  }

  DynamicResponse toFlightsSearchData() {
    if (data == null) {
      return const DynamicResponse();
    }
    return DynamicResponse.fromMap(data as Map<String, dynamic>);
  }

    CityAirportsList toCitysAirportsData() {
    if (data == null) {
      return const CityAirportsList();
    }
    return CityAirportsList.fromJson(data);
  }

}
