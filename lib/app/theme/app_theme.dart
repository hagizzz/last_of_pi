import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.surfacePrimary,
      ),
      scaffoldBackgroundColor: AppColors.surfacePrimary,
      textTheme: GoogleFonts.lexendDecaTextTheme(),
    );
  }
}
