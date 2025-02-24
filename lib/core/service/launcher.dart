import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/logger/logger.dart';
import 'package:flymefy/core/resources_manager/constant.dart';
import 'package:flymefy/core/resources_manager/strings.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/enum/enums.dart';
import '../error/url_launcher.dart';

/////////////////////////////////////////////////////////////////
abstract class LauncherUrls {
  Future<Either<Failure, Unit>> launchLocationInGoogleMapOrAppleMap(
      LatLng latLng);
  Future<Either<Failure, Unit>> launchCaller(String phone);
  Future<Either<Failure, Unit>> launchMail(String email);
  Future<Either<Failure, Unit>> launchWhatsApp(String phone);
  Future<Either<Failure, Unit>> launchWebUrl(String url);
  Future<Either<Failure, Unit>> launchShareUrl();
  Future<Either<Failure, Unit>> launchTripUrl(String id);
}

abstract class FiringLink {
  Future<Either<Failure, Unit>> fireLink(String url);
}

abstract class MapUrlsMaker {
  Future<Either<Failure, String>> makeLinkMaps(LatLng latLng);
}

abstract class UrlsMaker {
  Future<Either<Failure, String>> makeUrl(String url);
}

abstract class ValidationUrls {
  Future<bool> isValidUrl(String url);
}

class ValidationUrlsImpl implements ValidationUrls {
  @override
  Future<bool> isValidUrl(String url) async {
    return await (canLaunchUrl(Uri.parse(url)));
  }
}

class MapUrlsImpl implements MapUrlsMaker {
  late ValidationUrls _validationUrls;

  MapUrlsImpl();
  @override
  Future<Either<Failure, String>> makeLinkMaps(LatLng latLng) async {
    String googleUrlMap =
        "${AppConstants.googleMapUrl1}${latLng.latitude},${latLng.longitude}";
    String appleUrlMap =
        '${AppConstants.appleMapUrl}${latLng.latitude},${latLng.longitude}';
    _validationUrls = ValidationUrlsImpl();
    if (Platform.isIOS && await _validationUrls.isValidUrl(appleUrlMap)) {
      return Right(appleUrlMap);
    } else if (await _validationUrls.isValidUrl(googleUrlMap)) {
      return Right(googleUrlMap);
    } else {
      return Left(UrlLauncherException.handleUrlLancherError(
              DataSourceLaunchUrl.inValidUrl)
          .failure);
    }
  }
}

class MailUrlsImpl implements UrlsMaker {
  late ValidationUrls _validationUrls;

  MailUrlsImpl();
  @override
  Future<Either<Failure, String>> makeUrl(String url) async {
    String email = "${AppConstants.mailSchemeUrlLauncher}$url";
    _validationUrls = ValidationUrlsImpl();
    if (await _validationUrls.isValidUrl(email)) {
      return Right(email);
    } else {
      return Left(UrlLauncherException.handleUrlLancherError(
              DataSourceLaunchUrl.inValidUrl)
          .failure);
    }
  }
}

class WebUrlsImpl implements UrlsMaker {
  late ValidationUrls _validationUrls;

  WebUrlsImpl();
  @override
  Future<Either<Failure, String>> makeUrl(String url) async {
    _validationUrls = ValidationUrlsImpl();
    if (await _validationUrls.isValidUrl(url)) {
      return Right(url);
    } else {
      return Left(UrlLauncherException.handleUrlLancherError(
              DataSourceLaunchUrl.inValidUrl)
          .failure);
    }
  }
}

class WhatsAppUrlsImpl implements UrlsMaker {
  late ValidationUrls _validationUrls;

  WhatsAppUrlsImpl();
  @override
  Future<Either<Failure, String>> makeUrl(String url,
      {String message = AppConstants.defaultEmptyString}) async {
    String whatsAppAndroid =
        "whatsapp://send?phone=+$url&text=${Uri.parse(message)}";
    String whatsAppIos = "https://wa.me/+$url?text=${Uri.parse(message)}";

    _validationUrls = ValidationUrlsImpl();
    if (Platform.isIOS && await _validationUrls.isValidUrl(whatsAppIos)) {
      return Right(whatsAppIos);
    } else if (!Platform.isIOS &&
        await _validationUrls.isValidUrl(whatsAppAndroid)) {
      return Right(whatsAppAndroid);
    } else {
      return Left(UrlLauncherException.handleUrlLancherError(
              DataSourceLaunchUrl.inValidUrl)
          .failure);
    }
  }
}

class PhoneUrlsImpl implements UrlsMaker {
  late ValidationUrls _validationUrls;

  PhoneUrlsImpl();
  @override
  Future<Either<Failure, String>> makeUrl(String url) async {
    String phoneUrl = '${AppConstants.telSchemeUrlLauncher}$url';
    _validationUrls = ValidationUrlsImpl();
    if (await _validationUrls.isValidUrl(phoneUrl)) {
      return Right(phoneUrl);
    } else {
      return Left(UrlLauncherException.handleUrlLancherError(
              DataSourceLaunchUrl.inValidUrl)
          .failure);
    }
  }
}

class FiringLinkImpl implements FiringLink {
  FiringLinkImpl();
  @override
  Future<Either<Failure, Unit>> fireLink(String url) async {
    Uri uri = Uri.parse(url);
    bool isLaunched = await launchUrl(uri);
    if (!isLaunched) {
      return Left(UrlLauncherException.handleUrlLancherError(
              DataSourceLaunchUrl.cantNotOpen)
          .failure);
    } else {
      return const Right(unit);
    }
  }
}

class LaunchUrlsImpl implements LauncherUrls {
  late PhoneUrlsImpl _phoneUrlsImpl;
  late MailUrlsImpl _mailUrlsImpl;
  late WhatsAppUrlsImpl _whatsAppUrlsImpl;
  late MapUrlsImpl _mapUrlsImpl;
  late WebUrlsImpl _webUrlsImpl;
  late FiringLinkImpl _firingLinkImpl;
  LaunchUrlsImpl();
  @override
  Future<Either<Failure, Unit>> launchCaller(String phone) async {
    _phoneUrlsImpl = PhoneUrlsImpl();
    _firingLinkImpl = FiringLinkImpl();
    final result = await _phoneUrlsImpl.makeUrl(phone);

    return result.fold(
        (l) => Left(l), (r) async => await _firingLinkImpl.fireLink(r));
  }

  @override
  Future<Either<Failure, Unit>> launchMail(String email) async {
    _mailUrlsImpl = MailUrlsImpl();
    _firingLinkImpl = FiringLinkImpl();
    final result = await _mailUrlsImpl.makeUrl(email);
    return result.fold(
        (l) => Left(l), (r) async => await _firingLinkImpl.fireLink(r));
  }

  @override
  Future<Either<Failure, Unit>> launchLocationInGoogleMapOrAppleMap(
      LatLng latLng) async {
    _mapUrlsImpl = MapUrlsImpl();
    _firingLinkImpl = FiringLinkImpl();
    final result = await _mapUrlsImpl.makeLinkMaps(latLng);
    return result.fold(
        (l) => Left(l), (r) async => await _firingLinkImpl.fireLink(r));
  }

  @override
  Future<Either<Failure, Unit>> launchWhatsApp(String phone) async {
    _whatsAppUrlsImpl = WhatsAppUrlsImpl();
    _firingLinkImpl = FiringLinkImpl();
    final result = await _whatsAppUrlsImpl.makeUrl(phone);
    return result.fold(
        (l) => Left(l), (r) async => await _firingLinkImpl.fireLink(r));
  }

  @override
  Future<Either<Failure, Unit>> launchWebUrl(String url) async {
    _webUrlsImpl = WebUrlsImpl();
    _firingLinkImpl = FiringLinkImpl();
    final result = await _webUrlsImpl.makeUrl(url);
    return result.fold(
        (l) => Left(l), (r) async => await _firingLinkImpl.fireLink(r));
  }

  @override
  Future<Either<Failure, Unit>> launchShareUrl() async {
    try {
      await Share.share(
        AppStrings.shareApp,
      );
      return const Right(unit);
    } catch (e) {
      Logger.log(e.toString());
      return const Left(AppConstants.unknownfailure);
    }
  }

  @override
  Future<Either<Failure, Unit>> launchTripUrl(String id) async {
    try {
      await Share.share(id);
      return const Right(unit);
    } catch (e) {
      Logger.log(e.toString());
      return const Left(AppConstants.unknownfailure);
    }
  }
}
