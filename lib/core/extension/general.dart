import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources_manager/constant.dart';
import '../service/either.dart';

extension OrientationExtension on Orientation {
  Orientation get toLandScape => Orientation.landscape;
  Orientation get toPortrait => Orientation.portrait;
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension FlutterSecureStorageEx on FlutterSecureStorage {
  Future<SuccessOperation> deleteAll() async =>
      await deleteAll().then((final value) => const SuccessOperation(true));

  Future<SuccessOperation> cash(
      {required final String key, required final String value}) async {
    try {
      await write(key: key, value: value).catchError((error) {});
      return const SuccessOperation(true);
    } catch (error) {
      return const SuccessOperation(false);
    }
  }

  Future<SuccessOperation> delete({required String key}) async =>
      await delete(key: key).then((value) => const SuccessOperation(true));

  Future<String> get({required String key}) async =>
      await read(key: key) ?? AppConstants.defaultEmptyString;
}

extension SharePrefEx on SharedPreferences {
  Future<SuccessOperation> cash(
          {required final String key, required final String value}) async =>
      await setString(key, value)
          .then((final value) => const SuccessOperation(true));

  Future<SuccessOperation> delete({required final String key}) async =>
      await remove(key).then((final value) => const SuccessOperation(true));

  String get({required final String key}) =>
      getString(key) ?? AppConstants.defaultEmptyString;
}
