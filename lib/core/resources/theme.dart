import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/palette.dart';

class AppTheme {
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.backgroundColor,
    indicatorColor: Colors.redAccent,
  );
  static const darkMode = ThemeMode.dark;
}
