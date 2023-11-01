import 'package:flutter/material.dart';
import 'package:global_eats/themes/app_colors.dart';

class AppTheme {
  static const double borderRadius = 10.0;
  static final ThemeData lightTheme =
      ThemeData.light().copyWith(primaryColor: DarkColors.primary);

  static final ThemeData darkTheme =
      ThemeData.dark().copyWith(primaryColor: LightColors.primary);
}
