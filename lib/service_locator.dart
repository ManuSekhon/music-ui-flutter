import 'package:get_it/get_it.dart';

import 'package:flutter_login/models/login_model.dart';
import 'package:flutter_login/models/music_model/music_model.dart';
import 'package:flutter_login/models/user_model.dart';
import 'package:flutter_login/services/login_service.dart';
import 'package:flutter_login/services/music_service.dart';
import 'package:flutter_login/services/storage_service.dart';

/// Service locator instance
GetIt locator = GetIt();

/// Register models and services here
void setupLocator() {
  // services
  locator.registerLazySingleton<LoginService>(() => LoginService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<MusicService>(() => MusicService());

  // models
  locator.registerSingleton<LoginModel>(LoginModel());
  locator.registerLazySingleton<UserModel>(() => UserModel());
  locator.registerSingleton<MusicModel>(MusicModel());
}