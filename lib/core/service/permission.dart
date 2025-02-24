import 'dart:developer';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/routes/routes.dart';

import '../../app/app_development.dart';
import '../logger/logger.dart';

abstract class PermissionHandling {
  Future<bool> checkPermission(Permission permission);
}

class PermissionHandlingImpl implements PermissionHandling {
  PermissionHandlingImpl();

  @override
  Future<bool> checkPermission(Permission permission) async {
    try {
      DataSourcePermission permissionStatus =
          await _checkPermissioStatus(permission);

      log(permissionStatus.toString());

      if (permissionStatus == DataSourcePermission.allow) {
        return true;
      } else {
        if (permissionStatus == DataSourcePermission.permissionDenied ||
            permissionStatus == DataSourcePermission.permissionRestricted ||
            permissionStatus ==
                DataSourcePermission.permissionPermanentlyDenied) {
          final permsssion = await permission.request();
          log(permsssion.toString());

          if (permsssion == PermissionStatus.granted) {
            return true;
          } else if (permsssion == PermissionStatus.denied ||
              permsssion == PermissionStatus.permanentlyDenied ||
              permsssion == PermissionStatus.restricted ||
              permsssion == PermissionStatus.limited) {
            // openAppSettings();
          }
        }
      }

      navigator.pushNamed(Routes.permssion, arguments: {
        'permission': permission,
      });
      return false;
    } catch (e) {
      Logger.log(e.toString());
      return false;
    }
  }

  Future<DataSourcePermission> _checkPermissioStatus(
      Permission permission) async {
    PermissionStatus permissionStatus = await permission.status;
    if (permissionStatus.isGranted) {
      return DataSourcePermission.allow;
    } else if (permissionStatus.isDenied) {
      return DataSourcePermission.permissionDenied;
    } else if (permissionStatus.isRestricted) {
      return DataSourcePermission.permissionRestricted;
    } else if (Platform.isIOS || permissionStatus.isPermanentlyDenied) {
      return DataSourcePermission.permissionPermanentlyDenied;
    } else {
      return DataSourcePermission.unknownPermissionError;
    }
  }
}
