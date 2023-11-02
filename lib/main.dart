import 'package:flutter/material.dart';
import 'package:global_eats/providers/auth_provider.dart';
import 'package:global_eats/providers/navigation_provider.dart';

import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/app_theme.dart';
import 'package:global_eats/utils/utils.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.initialRoute,
      navigatorKey: NavigationKey.navigatorKey,
      scaffoldMessengerKey: Toast.messengerKey,
      routes: AppRoutes.routes,
    );
  }
}
