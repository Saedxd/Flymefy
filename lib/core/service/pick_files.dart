import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/error/permission.dart';
import 'package:flymefy/core/service/permission.dart';

abstract class FilePickerService {
  Future<Either<Failure, File>> pickSingleFile();
  Future<Either<Failure, List<File>>> pickMultipleFiles({int max = 20});
}

class FilePickerImpl implements FilePickerService {
  final PermissionHandling _permissionHandling;

  FilePickerImpl(this._permissionHandling);

  Future<Permission> getPermissionForFiles() async {
    if (Platform.isIOS || Platform.isAndroid) {
      return Permission.storage;
    } else {
      return Permission.manageExternalStorage;
    }
  }

  @override
  Future<Either<Failure, File>> pickSingleFile() async {
    Permission permission = await getPermissionForFiles();
    bool statusPermission =
        await _permissionHandling.checkPermission(permission);
    if (statusPermission) {
      try {
        final result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.any,
          allowedExtensions: [
            "pdf",
            "g3",
            "gif",
            "ief",
            "jpeg",
            "jpg",
            "jpe",
            "ktx",
            "png",
            "btif",
            "sgi",
            "svg",
            "svgz",
            "tiff",
            "tif"
          ],
        );
        if (result != null && result.files.isNotEmpty) {
          return Right(File(result.files.single.path!));
        } else {
          return Left(DataSourcePermission.noFileSelected.getFailure());
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
  Future<Either<Failure, List<File>>> pickMultipleFiles({int max = 20}) async {
    Permission permission = await getPermissionForFiles();
    bool statusPermission =
        await _permissionHandling.checkPermission(permission);

    if (statusPermission) {
      try {
        final result = await FilePicker.platform.pickFiles(allowMultiple: true);
        if (result != null && result.files.isNotEmpty) {
          final files = result.files.map((e) => File(e.path!)).toList();
          return Right(files.length > max ? files.sublist(0, max) : files);
        } else {
          return Left(DataSourcePermission.noFileSelected.getFailure());
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
}
