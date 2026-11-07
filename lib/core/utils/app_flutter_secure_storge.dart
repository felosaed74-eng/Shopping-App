import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppFlutterSecureStorage {
  static final storge = FlutterSecureStorage();

  static Future<void> save(String key, String? value) async {
    await storge.write(key: key, value: value);
  }

  static Future<String?> getData(String key) async {
    return await storge.read(key: key);
  }

  static Future<void> delete(String key) async {
    await storge.delete(key: key);
  }
}
