import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    const background = Color(0xFFF7F2E8);
    const surface = Color(0xFFFFFCF5);
    const text = Color(0xFF25211B);
    const accent = Color(0xFF315C72);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: Brightness.light,
        surface: surface,
      ),
      scaffoldBackgroundColor: background,
      textTheme: _textTheme(text),
    );
  }

  static ThemeData dark() {
    const background = Color(0xFF111827);
    const surface = Color(0xFF1F2937);
    const text = Color(0xFFF5EFE3);
    const accent = Color(0xFFD8B86A);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: Brightness.dark,
        surface: surface,
      ),
      scaffoldBackgroundColor: background,
      textTheme: _textTheme(text),
    );
  }

  static TextTheme _textTheme(Color color) {
    return TextTheme(
      headlineMedium: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: color.withValues(alpha: 0.78),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: color,
        fontFamily: 'Georgia',
        fontSize: 24,
        height: 1.65,
      ),
      bodyMedium: TextStyle(
        color: color.withValues(alpha: 0.78),
        fontSize: 14,
        height: 1.45,
      ),
    );
  }
}
