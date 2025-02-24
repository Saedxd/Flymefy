import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/resources_manager/constant.dart';

import '../../../core/error/permission.dart';

abstract class LocationServices {
  Future<int> checkLocationPermission();
  Future<void> openSettingLocation();

  LocationSettings get locationSettings;
  AndroidSettings get androidSettingsLocation;
  AppleSettings get appleSettingsLocation;
  Future<Position> getCurrentLocation();
  Stream<Position> get streamSubscriptionPosition;
  Future<Uint8List> getMarkerIcon(String path);
}

class LocationServicesImpl implements LocationServices {
  LocationServicesImpl();

  @override
  Future<void> openSettingLocation() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Future<Uint8List> getMarkerIcon(String path) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 150);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Future<int> checkLocationPermission() async {
    LocationPermission permission;

    if (!(await Geolocator.isLocationServiceEnabled())) {
      return 0;
    } else {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever ||
            permission == LocationPermission.unableToDetermine) {
          return 1;
        }
      }
    }
    return 2;
  }

  @override
  Future<Position> getCurrentLocation() async {
    if (await checkLocationPermission() == 2) {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } else {
      throw PermissionException.handlePermissionError(
          DataSourcePermission.permissionDenied);
    }
  }

  @override
  AndroidSettings get androidSettingsLocation => AndroidSettings(
      forceLocationManager:
          LocationSettingConstant.enableForceLocationManagerAndroid,
      accuracy: LocationSettingConstant.locationAccuracyAndroid,
      distanceFilter: LocationSettingConstant.distanceFilterLocationAndroid,
      intervalDuration: LocationSettingConstant.intervalDurationLocationAndroid,
      timeLimit: LocationSettingConstant.timeLimitLocationAndroid,
      foregroundNotificationConfig: _foregroundNotificationConfigAndroid());

  @override
  AppleSettings get appleSettingsLocation => AppleSettings(
        timeLimit: LocationSettingConstant.timeLimitLocationIos,
        distanceFilter: LocationSettingConstant.distanceFilterLocationIos,
        accuracy: LocationSettingConstant.locationAccuracyIos,
        activityType: LocationSettingConstant.activityTypeLocationIos,
        pauseLocationUpdatesAutomatically:
            LocationSettingConstant.pauseLocationUpdatesAutomaticallyIos,
        showBackgroundLocationIndicator:
            LocationSettingConstant.showBackgroundLocationIndicatorIos,
      );
  LocationSettings _locationSettingsOtherPlatForm() {
    return const LocationSettings(
        accuracy: LocationSettingConstant.locationAccuracyOtherPlatForm,
        timeLimit: LocationSettingConstant.timeLimitLocationOtherPlatForm,
        distanceFilter:
            LocationSettingConstant.distanceFilterLocationOtherPlatForm);
  }

  ForegroundNotificationConfig _foregroundNotificationConfigAndroid() {
    return const ForegroundNotificationConfig(
      notificationText:
          LocationSettingConstant.notificationTextForegroundAndroidLocation,
      notificationTitle:
          LocationSettingConstant.notificationTitleForegroundAndroidLocation,
      enableWakeLock:
          LocationSettingConstant.enableWakeLockForegroundAndroidLocation,
      enableWifiLock:
          LocationSettingConstant.enableWifiLockForegroundAndroidLocation,
    );
  }

  @override
  LocationSettings get locationSettings {
    if (Platform.isIOS) {
      return appleSettingsLocation;
    } else if (Platform.isAndroid) {
      return androidSettingsLocation;
    } else {
      return _locationSettingsOtherPlatForm();
    }
  }

  @override
  Stream<Position> get streamSubscriptionPosition =>
      Geolocator.getPositionStream(locationSettings: locationSettings);
}
