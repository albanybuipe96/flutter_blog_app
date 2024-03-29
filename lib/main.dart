import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/src/shared/app.dart';
import 'package:flutter_blog_app/src/shared/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Di.init();
  runApp(App());
}
