import 'package:anime_app_flutter/common/domain/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData getDarkApplicationTheme() {
  return ThemeData(
    // main colors
    scaffoldBackgroundColor: DarkAppColors.primaryBackground,

    // Bottom nav bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DarkAppColors.secondaryBackground,
      selectedItemColor: DarkAppColors.primary,
      unselectedItemColor: DarkAppColors.primaryText,
      type: BottomNavigationBarType.fixed,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: DarkAppColors.primaryBackground,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: _getDarkTextStyle(
        fontSize: 18,
        color: DarkAppColors.secondaryText,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleMedium: _getDarkTextStyle(
        fontSize: 20,
        color: DarkAppColors.secondaryText,
      ),
      titleSmall: _getDarkTextStyle(
        fontSize: 18,
        color: DarkAppColors.secondaryText,
      ),
      bodyLarge: _getDarkTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: DarkAppColors.primaryText,
      ),
      bodyMedium: _getDarkTextStyle(
        fontSize: 14,
        color: DarkAppColors.secondaryText,
      ),
      bodySmall: _getDarkTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: DarkAppColors.primaryText,
      ),
    ),
  );
}

TextStyle _getDarkTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

ThemeData getLightApplicationTheme() {
  return ThemeData(
    // main colors
    scaffoldBackgroundColor: LightAppColors.primaryBackground,

    // Bottom nav bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: LightAppColors.secondaryBackground,
      selectedItemColor: LightAppColors.primary,
      unselectedItemColor: LightAppColors.primaryText,
      type: BottomNavigationBarType.fixed,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: LightAppColors.primaryBackground,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: _getLightTextStyle(
        fontSize: 18,
        color: LightAppColors.secondaryText,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleMedium: _getLightTextStyle(
        fontSize: 20,
        color: LightAppColors.secondaryText,
      ),
      titleSmall: _getLightTextStyle(
        fontSize: 18,
        color: LightAppColors.secondaryText,
      ),
      bodyLarge: _getLightTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: LightAppColors.primaryText,
      ),
      bodyMedium: _getLightTextStyle(
        fontSize: 14,
        color: LightAppColors.secondaryText,
      ),
      bodySmall: _getLightTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: LightAppColors.primaryText,
      ),
    ),
  );
}

TextStyle _getLightTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

