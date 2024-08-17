import 'package:flutter/material.dart';

const color = Colors.cyan;

class AppTheme {
  ThemeData getTheme() => ThemeData(colorSchemeSeed: color);

  ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: color,
      );
}
