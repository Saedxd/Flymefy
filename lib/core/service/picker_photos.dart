import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/error/permission.dart';
import 'package:flymefy/core/extension/data_source.dart';
import 'package:flymefy/core/resources_manager/constant.dart';

import 'permission.dart';

abstract class ImagePickering {
  Future<Either<Failure, File>> pickImageGallery();
  Future<Either<Failure, File>> pickImageCamera();
  Future<Either<Failure, List<File>>> pickImageMulti({int max = 20});
}

class ImagePickerImpl implements ImagePickering {
  final PermissionHandling _permissionHandling;
  ImagePickerImpl(this._permissionHandling);
  @override
  Future<Either<Failure, File>> pickImageCamera() async {
    bool statusPermission =
        await _permissionHandling.checkPermission(Permission.camera);
    if (statusPermission) {
      try {
        final result = await _getImageFromCamera();
        if (result is File) {
          return Right(result);
        } else {
          return Left(DataSourcePermission.noImageSelected.getFailure());
        }
      } catch (error) {
        return Left(PermissionException.handlePermissionError(error).failure);
      }
    } else {
      return Left(PermissionException.handlePermissionError(
              DataSourcePermission.permissionPermanentlyDenied)
          .failure);
    }
  }

  Future<Permission> getPermissonImage() async {
    if (Platform.isIOS) {
      return Permission.photos;
    } else {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.version.sdkInt <= 32) {
        return Permission.storage;
      } else {
        return Permission.photos;
      }
    }
  }

  @override
  Future<Either<Failure, File>> pickImageGallery() async {
    Permission permission = await getPermissonImage();
    bool statusPermission =
        await _permissionHandling.checkPermission(permission);

    if (statusPermission) {
      try {
        final result = await _getImageFromGallery();
        if (result is File) {
          return Right(result);
        } else {
          return Left(DataSourcePermission.noImageSelected.getFailure());
        }
      } catch (error) {
        return Left(PermissionException.handlePermissionError(error).failure);
      }
    } else {
      return Left(PermissionException.handlePermissionError(
              DataSourcePermission.permissionPermanentlyDenied)
          .failure);
    }
  }

  @override
  Future<Either<Failure, List<File>>> pickImageMulti({int max = 20}) async {
    Permission permission = await getPermissonImage();
    bool statusPermission =
        await _permissionHandling.checkPermission(permission);

    if (statusPermission) {
      try {
        final result = await _loadMultiAssets(max: max);
        if (result.isNotEmpty) {
          return Right(result);
        } else {
          return Left(DataSourcePermission.noImageSelected.getFailure());
        }
      } catch (error) {
        return Left(PermissionException.handlePermissionError(error).failure);
      }
    } else {
      return Left(PermissionException.handlePermissionError(
              DataSourcePermission.permissionPermanentlyDenied)
          .failure);
    }
  }

  Future<File?> _getImageFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: AppConstants.maxWidthImgPickerCamera,
      maxHeight: AppConstants.maxHeightImgPickerCamera,
      imageQuality: AppConstants.qualityImgPickerCamera,
    );
    return File(pickedFile!.path);
  }

  Future<File?> _getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: AppConstants.maxWidthImgPickerGallery,
      maxHeight: AppConstants.maxHeightImgPickerGallery,
      //  imageQuality: AppConstants.qualityImgPickerGallery,
    );
    return File(pickedFile!.path);
  }

  Future<List<File>> _loadMultiAssets({int max = 20}) async {
    List<XFile> pickedFiles = await ImagePicker().pickMultiImage(
      limit: max,
      maxWidth: AppConstants.maxWidthImgPickerGallery,
      maxHeight: AppConstants.maxHeightImgPickerGallery,
    );
    if (pickedFiles.length > max) {
      pickedFiles = pickedFiles.sublist(0, max);
    }

    return pickedFiles.map((e) => File(e.path)).toList();
  }
}
