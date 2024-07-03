import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_flavor/app.dart';
import 'package:test_flavor/config/app_config.dart';
import 'package:test_flavor/config/app_singleton_config.dart';
import 'package:test_flavor/config/flavor_type_config.dart';

Future<void> main() async {
  // LOAD ENV
  await dotenv.load(fileName: ".env");

  // Initialize your AppConfig
  final prodAppConfig = AppConfig(
    appName: 'Test Flutter Flavor',
    flavor: FlavorType.prod,
  );

  // Set the global AppConfig
  appConfigSingleton.config = prodAppConfig;

  // Initialize and run the app
  runApp(initializeApp(prodAppConfig));
}
