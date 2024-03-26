import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/core/resources/resources.dart';
import 'package:flutter_blog_app/core/resources/theme.dart';
import 'package:flutter_blog_app/src/auth/ux/blocs/auth_bloc.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen.dart';
import 'package:flutter_blog_app/src/shared/di.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Di.init();
  runApp(
    const MyApp(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
        ],
        child: SignupScreen(),
      ),
    );
  }
}
