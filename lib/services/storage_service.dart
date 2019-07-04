import 'package:shared_preferences/shared_preferences.dart';

/// Handle all local storage related tasks
class StorageService {
  SharedPreferences _instance;

  Future<void> createInstance() async {
    this._instance = await SharedPreferences.getInstance();
  }

  // return value from key
  Future<dynamic> getValue(String key) async {
    return this._instance.get(key) ?? null;
  }

  // set value to local storage
  Future<void> setLogin(String key) async {
    await this._instance.setBool(key, true);
  }

  // remove key from local storage
  Future<void> remove(String key) async {
    await this._instance.remove(key);
  }
}