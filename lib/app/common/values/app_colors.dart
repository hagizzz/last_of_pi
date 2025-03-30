import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color contentBrandPrimary = Color(0xFF3280F6);
  static const Color contentPrimaryInverse = Color(0xFFFFFFFF);
  static const Color surfaceBrandLight = Color(0xFFE6F1FF);
  static const Color surfaceBrandSecondaryLight = Color(0xFFECFFFA);
  static const Color surfaceBrandSecondary = Color(0xFF63DEBF);
  static const Color surfaceBrandDark = Color(0xFF2567CC);
  static const Color surfaceDark = Color(0xFF2D3748);
  static const Color surfaceSafeLight = Color(0xFFF0FFF4);
  static const Color surfaceSafe = Color(0xFF39A26A);
  static const Color surfaceSecondary = Color(0xFFF8FAFC);
  static const Color surfaceWarningLight = Color(0xFFFFFAF0);
  static const Color surfacePrimary = Color(0xFF1F1F1F);

  static Color primaryColorWithOpacity =
      const Color(0xFF3280F6).withOpacity(0.5);
  static const Color white = Colors.white;
  static const Color grey = Color.fromARGB(255, 242, 242, 242);
  static const Color black = Colors.black;
  // static Color green = const Color(0xFF39A26A);
  // static Color yellow = const Color(0xFFD69E2E);
  static const Color contentTertiary = Color(0xFF718096);
  static const Color contentSecondary = Color(0xFF4A5568);
  static const Color contentSecondaryInverse =
      Color.fromRGBO(255, 255, 255, 0.4);
  static const Color surfaceTertiary = Color(0xFFEDF2F7);
  static const Color surfaceDangerLight = Color(0xFFFFF5F5);
  static const Color contentDivider = Color(0xFFE2E8F0);
  static const Color contentWarning = Color(0xFFDF6C20);
  static const Color contentSafe = Color(0xFF39A26A);
  static const Color contentSafeLight = Color(0xFFF0FFF4);
  static const Color contentPrimary = Color(0xFFD1CFC0);
  static const Color contentBorder = Color(0xFFCBD5E0);
  static const Color contentDanger = Color(0xFFE53E3E);

  static const Color foundationWarning = Color(0xFFDD6B20);
  static const Color foundationSafe = Color(0xFF38A169);

  static const int _grayPrimaryValue = 0xFF718096;
  static const int _greenPrimaryValue = 0xFF38A169;
  static const int _redPrimaryValue = 0xFFE53E3E;
  static const int _orangePrimaryValue = 0xFFDD6B20;
  static const int _bluePrimaryValue = 0xFF3280F6;
  static const int _yellowPrimaryValue = 0xFFD69E2E;
  static const int _purplePrimaryValue = 0xFF805AD5;

  static const MaterialColor gray = MaterialColor(
    _grayPrimaryValue,
    <int, Color>{
      50: Color(0xFFF8FAFC),
      100: Color(0xFFEDF2F7),
      200: Color(0xFFE2E8F0),
      300: Color(0xFFCBD5E0),
      400: Color(0xFFA0AEC0),
      500: Color(_grayPrimaryValue),
      600: Color(0xFF4A5568),
      700: Color(0xFF2D3748),
      800: Color(0xFF1A202C),
      900: Color(0x0ff17192),
    },
  );

  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      50: Color(0xFFF0FFF4),
      100: Color(0xFFC6F6D5),
      200: Color(0xFF9AE6B4),
      300: Color(0xFF68D391),
      400: Color(0xFF48BB78),
      500: Color(_greenPrimaryValue),
      600: Color(0xFF25855A),
      700: Color(0xFF276749),
      800: Color(0xFF22543D),
      900: Color(0xFF1C4532),
    },
  );
  static const MaterialColor orange = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFAF0),
      100: Color(0xFFFEEBCB),
      200: Color(0xFFFBD38D),
      300: Color(0xFFF6AD55),
      400: Color(0xFFED8936),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFC05621),
      700: Color(0xFF9C4221),
      800: Color(0xFF7B341E),
      900: Color(0xFF652B19),
    },
  );

  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE6F1FF),
      100: Color(0xFFBBD9FF),
      200: Color(0xFF93C2FF),
      300: Color(0xFF6FABFF),
      400: Color(0xFF4F95FF),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF2567CC),
      700: Color(0xFF194F9F),
      800: Color(0xFF0F3770),
      900: Color(0xFF082C60),
    },
  );

  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF5F5),
      100: Color(0xFFFED7D7),
      200: Color(0xFFFEB2B2),
      300: Color(0xFFFC8181),
      400: Color(0xFFF56565),
      500: Color(_redPrimaryValue),
      600: Color(0xFFC53030),
      700: Color(0xFF9B2C2C),
      800: Color(0xFF822727),
      900: Color(0xFF63171B),
    },
  );

  static const MaterialColor yellow = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFFF0),
      100: Color(0xFFFEFCBF),
      200: Color(0xFFFAF089),
      300: Color(0xFFF6E05E),
      400: Color(0xFFECC94B),
      500: Color(_yellowPrimaryValue),
      600: Color(0xFFB7791F),
      700: Color(0xFF975A16),
      800: Color(0xFF744210),
      900: Color(0xFF5F370E),
    },
  );

  static const MaterialColor purple = MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
      50: Color(0xFFFAF5FF),
      100: Color(0xFFE9D8FD),
      200: Color(0xFFD6BCFA),
      300: Color(0xFFB794F4),
      400: Color(0xFF9F7AEA),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF6B46C1),
      700: Color(0xFF553C9A),
      800: Color(0xFF44337A),
      900: Color(0xFF322659),
    },
  );
}
