import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/ux/widgets/snackbars.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signup_usecase.dart';
import 'package:flutter_blog_app/src/shared/di.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:get/get.dart';

class SignupScreenState extends GetxController with NavGraph {
  SignupScreenState({required SignupUsecase signupUsecase})
      : _signupUsecase = signupUsecase;

  final SignupUsecase _signupUsecase;

  final currentUserState = Di.injectCurrentUserState();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final isPassword = true.obs;
  final loading = false.obs;
  final enabled = true.obs;

  void toggleIsPassword() {
    isPassword.value = isPassword.toggle()();
  }

  Future<void> signup() async {
    loading.value = true;
    enabled.value = false;
    // currentUserState.
    if (signupFormKey.currentState!.validate()) {
      final response = await _signupUsecase(
        SignupParams(
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      response.fold((failure) {
        SnackBars.error(
          message: failure.message,
          execute: () {
            loading.value = false;
            enabled.value = true;
          },
        );
      }, (user) {
        SnackBars.success(
          message: 'User, ${user.email} signed up successfully.',
          execute: () {
            loading.value = false;
            enabled.value = true;
            goToHomeScreen();
          },
        );
      });
    } else {
      loading.value = false;
      enabled.value = true;
    }
  }

  void gotoSigninScreen() {
    offToSigninScreen();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onInit() {
    usernameController.addListener(() {});
    emailController.addListener(() {});
    passwordController.addListener(() {});
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
