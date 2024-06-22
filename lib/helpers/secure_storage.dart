import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Map<String, String?> inMemorySecureStorage = {};

class SecureStorage {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  const SecureStorage();

  Future<String?> read({required String key}) async {
    return _storage.read(key: key);
  }

  Future<void> write({required String key, String? value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }
}

const secureStorage = SecureStorage();
