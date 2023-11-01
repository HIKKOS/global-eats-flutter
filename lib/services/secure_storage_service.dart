import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();
  static get storage => _storage;
  static _androidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static _iosOptions() => const IOSOptions(
        accountName: AppleOptions.defaultAccountName,
      );

  static Future<String?> read({required String key}) async {
    final data = await _storage.read(
      key: key,
      iOptions: _iosOptions(),
      aOptions: _androidOptions(),
    );
    return data;
  }

  static Future<void> delete({required String key}) async {
    await _storage.delete(
      key: key,
      iOptions: _iosOptions(),
      aOptions: _androidOptions(),
    );
  }

  static Future<void> write(
      {required String key, required String value}) async {
    await _storage.write(
      key: key,
      value: value,
      iOptions: _iosOptions(),
      aOptions: _androidOptions(),
    );
  }
}
