import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // Light theme configuration
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // Define other theme properties
    // ...
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // Dark theme configuration
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    // Define other theme properties
    // ...
  );
}
