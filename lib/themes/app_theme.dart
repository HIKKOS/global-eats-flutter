/* import 'package:flutter/material.dart';
import 'package:global_eats/themes/app_colors.dart';

class AppTheme {
  static const double borderRadius = 10.0;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4BB6B7)),
      primaryColor: DarkColors.primary,
      cardColor: Colors.white,
      cardTheme: const CardTheme(elevation: 0, surfaceTintColor: Colors.white),
      scaffoldBackgroundColor: const Color(0xffebebeb),
      useMaterial3: true);

  static final ThemeData darkTheme = ThemeData.dark()
      .copyWith(primaryColor: LightColors.primary, useMaterial3: true);
}
 */
import 'package:flutter/material.dart';
import 'package:global_eats/themes/app_colors.dart';

class AppTheme {
  static const double borderRadius = 10.0;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4BB6B7)),
    primaryColor: DarkColors.primary,
    cardColor: Colors.white,
    cardTheme: const CardTheme(elevation: 0, surfaceTintColor: Colors.white),
    scaffoldBackgroundColor: const Color(0xffebebeb),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
      backgroundColor: LightColors.primary,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      buttonColor: LightColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    dialogBackgroundColor: Colors.white,
    dialogTheme: DialogTheme(
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black54,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius / 2),
      ),
    ),
    dividerColor: LightColors.grey,
    dividerTheme: const DividerThemeData(
      color: LightColors.grey,
      thickness: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        elevation: MaterialStateProperty.all<double>(5),
        shadowColor: const MaterialStatePropertyAll<Color>(Colors.black54),
        overlayColor: MaterialStateProperty.all<Color>(
            LightColors.primary.withGreen(110)),
        surfaceTintColor: MaterialStateProperty.all<Color>(LightColors.primary),
        foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius / 2),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white)),
        backgroundColor: MaterialStateProperty.all<Color>(LightColors.primary),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightColors.primary,
      foregroundColor: Colors.white,
      splashColor: LightColors.primaryObscure,
      elevation: 5,
      focusColor: LightColors.primaryObscure,
      hoverColor: LightColors.primaryObscure,
      highlightElevation: 10,
      hoverElevation: 10,
      focusElevation: 10,
    ),
    highlightColor: LightColors.primaryObscure,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: LightColors.primary),
      ),
      prefixIconColor: LightColors.grey,
      suffixIconColor: LightColors.primary,
      fillColor: Colors.white,
      filled: true,
      iconColor: LightColors.primary,
      contentPadding: const EdgeInsets.all(20),
      floatingLabelStyle: const TextStyle(color: LightColors.secondary),

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: LightColors.primary, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: LightColors.primary, width: 2)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: LightColors.primary, width: 2)),
      // prefixIcon: Icon( Icons.verified_user_outlined ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black,
      indicatorColor: LightColors.primary,
      surfaceTintColor: LightColors.primary,
      indicatorShape: InputBorder.none,
      labelTextStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white, fontSize: 16)),
    ),
    indicatorColor: LightColors.primary,
    snackBarTheme: const SnackBarThemeData(
      /* shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius / 2))), */
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: LightColors.secondary,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    splashColor: LightColors.primaryObscure,
    splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: LightColors.primary,
    ),
    switchTheme: SwitchThemeData(
      trackOutlineColor: MaterialStateProperty.all<Color>(LightColors.primary),
      thumbColor: MaterialStateProperty.all<Color>(LightColors.primary),
      trackColor:
          MaterialStateProperty.all<Color>(LightColors.primary.withAlpha(50)),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      surfaceTintColor: MaterialStateProperty.all<Color>(LightColors.primary),
    )),
  );

  static final ThemeData darkTheme = ThemeData.dark()
      .copyWith(useMaterial3: true, primaryColor: LightColors.primary);
}
