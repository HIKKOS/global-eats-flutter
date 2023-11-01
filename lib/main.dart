import 'package:flutter/material.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/themes/app_theme.dart';
import 'package:provider/provider.dart';

/// Dependencias:

/// *  device_info_plus,
/// *  flutter_secure_storage,
/// *  http,
/// *  logger,
/// *  path_provider,
/// *  provider,
/// *  shared_preferences,
/// *  sqflite,

void main() async {
  runApp(MultiProvider(providers: const [], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
