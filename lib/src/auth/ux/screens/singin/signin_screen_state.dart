import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/ux/widgets/snackbars.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signin_usecase.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:get/get.dart';

class SigninScreenState extends GetxController with NavGraph {
  SigninScreenState({required SigninUsecase signinUsecase})
      : _signinUsecase = signinUsecase;
  final SigninUsecase _signinUsecase;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  final isPassword = true.obs;
  final loading = false.obs;
  final enabled = true.obs;

  void toggleIsPassword() {
    isPassword.value = isPassword.toggle()();
  }

  Future<void> signin() async {
    loading.value = true;
    enabled.value = false;
    if (signinFormKey.currentState!.validate()) {
      final response = await _signinUsecase(
        SigninParams(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      response.fold(
        (failure) {
          SnackBars.error(
            message: failure.message,
            execute: () {
              loading.value = false;
              enabled.value = true;
            },
          );
        },
        (user) {
          SnackBars.success(
            message: 'User, ${user.email}, signed in successfully.',
            execute: () {
              loading.value = false;
              enabled.value = true;

              offToHomeScreen();
            },
          );
        },
      );
    } else {
      loading.value = false;
      enabled.value = true;
    }
  }

  void gotoSignupScreen() {
    offToSignupScreen();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onInit() {
    emailController.addListener(() {});
    passwordController.addListener(() {});
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
