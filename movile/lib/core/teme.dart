import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green, inputDecorationTheme: const InputDecorationTheme( border: OutlineInputBorder(),),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      ),
    ),
  );
}