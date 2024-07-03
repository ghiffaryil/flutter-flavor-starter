import 'package:test_flavor/config/app_config.dart';

class AppConfigSingleton {
  static final AppConfigSingleton _singleton = AppConfigSingleton._internal();

  late AppConfig config;

  factory AppConfigSingleton() {
    return _singleton;
  }

  AppConfigSingleton._internal();
}

AppConfigSingleton appConfigSingleton = AppConfigSingleton();
