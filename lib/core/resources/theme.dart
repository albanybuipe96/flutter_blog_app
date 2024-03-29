import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/dimens.dart';
import 'package:flutter_blog_app/core/resources/palette.dart';

class AppTheme {
  static const _borderRadius = Dimens.nano;
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.backgroundColor,
    indicatorColor: Colors.redAccent,
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        borderSide: BorderSide(color: Colors.red, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        borderSide: BorderSide(color: Colors.transparent, width: 0.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        borderSide: BorderSide(color: Colors.red, width: 0.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        borderSide: BorderSide(color: Colors.transparent, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        borderSide: BorderSide(color: Colors.transparent, width: 0.5),
      ),
    ),
  );
  static const darkMode = ThemeMode.dark;
}
