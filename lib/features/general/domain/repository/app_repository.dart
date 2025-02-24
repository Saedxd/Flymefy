import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flymefy/core/entity/data_value.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/general/data/request/request.dart';
import 'package:flymefy/features/general/domain/entity/faqs.dart';
import 'package:flymefy/features/general/domain/entity/privacy_terms.dart';
import 'package:flymefy/features/general/domain/entity/support_chat.dart';

import '../../../auth/domain/entity/user.dart';
import '../entity/location.dart';

abstract interface class AppRepository {
  Future<Either<Failure, String>> getLang();
  Future<Either<Failure, SuccessOperation>> cashLang(String value);

  Future<Either<Failure, AppAuthenticationLevelData>>
      getLevelAuthenticationApp();
  Future<Either<Failure, SuccessOperation>> cashLevelAuthenticationApp(
      AppAuthenticationLevelRequest appAuthenticationLevelRequest);

  Future<Either<Failure, LocationSearch>> getLocationNameByLatLng(LatLng input);

  Future<Either<Failure, LocationSearchData>> getAutoCompletePlaces(
      LocationSearchRequest locationSearchRequest);
  Future<Either<Failure, LocationSearchData>> getNearByPlaces(
      LocationNearByRequest locationNearByRequest);

  Future<Either<Failure, GeneralSuccessData>> logout();
  Future<Either<Failure, UserAppInfo>> getUser();

  Future<Either<Failure, SuccessOperation>> storeCountryIsoCode(
      UserAppInfo user);

}
