import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/common/auth/current_user_state.dart';
import 'package:flutter_blog_app/core/resources/resources.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/signin/signin_screen.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/home/home_screen.dart';
import 'package:flutter_blog_app/src/shared/di.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  App({super.key});

  final currentUserState = Get.put(AppState());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: _home,
    );
  }

  Widget get _home {
    final appState = Get.find<AppState>();
    return Obx(
      () {
        return appState.isUserLoggedIn() ? const HomeScreen() : SigninScreen();
      },
    );
  }
}

class AppState extends GetxController {
  final currentUserState = Get.put(
    CurrentUserState(
      currentUserUsecase: serviceLocator(),
      signoutUsecase: serviceLocator(),
    ),
  );

  bool isUserLoggedIn() => currentUserState.isUserLoggedIn();
}
