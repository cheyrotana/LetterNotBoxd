import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';

Future<void> mainCommon({required String env}) async {
  // Ensures Flutter engine is ready before doing anything
  WidgetsFlutterBinding.ensureInitialized();

  // Hive is a lightweight local database that stores data on the device
  // Think of it like a key-value store (like a Map but saved to disk)
  // We use it to save watchlist movies locally without needing a backend
  // initFlutter() sets up Hive to work with Flutter's file system
  await Hive.initFlutter();

  // Here you can later do env-specific setup
  // e.g. if (env == 'dev') { enable logging } else { disable logging }

  runApp(MyApp(env: env));
}

class MyApp extends StatelessWidget {
  final String env;

  const MyApp({super.key, required this.env});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterBoxd',
      debugShowCheckedModeBanner: env == 'dev', // Show debug banner only in dev
      theme: AppTheme.darkTheme,
      home: const Placeholder(), // We'll replace this with our router later
    );
  }
}
