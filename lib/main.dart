import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/theme.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen.dart';
import 'package:flutter_blog_app/src/shared/di.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: AppTheme.darkMode,
      theme: AppTheme.dark,
      home: SignupScreen(),
    );
  }
}
