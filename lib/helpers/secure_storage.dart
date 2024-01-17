// TODO: Implement flutter_secure_storage with entitlements.
Map<String, String?> inMemorySecureStorage = {};

class SecureStorage {
  const SecureStorage();

  Future<String?> read({required String key}) async {
    return inMemorySecureStorage[key];
  }

  Future<void> write({required String key, String? value}) async {
    inMemorySecureStorage[key] = value;
  }
}

const secureStorage = SecureStorage();
