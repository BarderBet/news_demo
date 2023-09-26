/*
 * Copyright (c) 2019-2023 Larry Aasen. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only call clearSavedSettings() during testing to reset internal values.
  await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  // On Android, the default behavior will be to use the Google Play Store
  // version of the app.
  // On iOS, the default behavior will be to use the App Store version of
  // the app, so update the Bundle Identifier in example/ios/Runner with a
  // valid identifier already in the App Store.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // On Android, setup the Appcast.
    // On iOS, the default behavior will be to use the App Store version.
    final appcastURL =
        'https://raw.githubusercontent.com/larryaasen/upgrader/master/test/testappcast.xml';
    final cfg = AppcastConfiguration(url: appcastURL, supportedOS: ['android', 'iOS']);

    return MaterialApp(
      title: 'Upgrader Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Upgrader Example'),
        ),
        body: UpgradeAlert(
          upgrader: Upgrader(appcastConfig: cfg),
          child: const Center(
            child: Text('Checking...'),
          ),
        ),
      ),
    );
  }
}
