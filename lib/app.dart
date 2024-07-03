import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_flavor/config/app_config.dart';
import 'package:test_flavor/config/flavor_type_config.dart';

MyApp initializeApp(AppConfig config) {
  WidgetsFlutterBinding.ensureInitialized();
  return MyApp(config: config);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.config});
  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner:
          config.flavor == FlavorType.dev ? true : false,
      home: MyHomePage(title: 'Flutter Flavor ${dotenv.env['ENV']}'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String apiURL = "${dotenv.env['API_URL']}";
  static String version = "${dotenv.env['VERSION']}";
  static String versionSuffix = "${dotenv.env['VERSION_SUFFIX']}";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Platform : ${Platform.operatingSystem},',
                style: Theme.of(context).textTheme.headlineSmall),
            Text(
              'Version : $version$versionSuffix',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'API URL : \n$apiURL',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
