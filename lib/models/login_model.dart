import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_login/service_locator.dart';
import 'package:flutter_login/services/login_service.dart';
import 'package:flutter_login/services/storage_service.dart';
import 'package:flutter_login/models/user_model.dart';

/// Model to handle authentication
class LoginModel extends Model {
  bool _error = false;
  bool _loading = false;
  LoginService _loginService = locator<LoginService>();
  String _password = '123456';
  StorageService _storageService = locator<StorageService>();
  String _username = '';

  // getters
  bool get isError => _error;
  bool get isLoading => _loading;
  String get username => _username;

  // return true is user is already logged in
  Future<bool> isAuthenticated() async {
    await _storageService.createInstance();
    return await _storageService.getValue('logged_in') ?? false;
  }

  // login user if exists
  Future<void> login(String username, String password) async {
    _loading = true;
    notifyListeners();

    if (password != this._password) {
      _loading = false;
      notifyListeners();
      throw StateError('Invalid credentials');
    }

    var user = await _loginService.getUser('1');
    UserModel _userInstance = locator<UserModel>();
    _userInstance.createUser(user);
    await _storageService.setLogin('logged_in');

    _loading = false;
    notifyListeners();
  }

  // logout user
  Future<void> logout() async {
    _storageService.remove('logged_in');
  }
}
