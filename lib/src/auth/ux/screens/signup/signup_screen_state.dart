import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/ux/widgets/snackbars.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signup_usecase.dart';
import 'package:get/get.dart';

class SignupScreenState extends GetxController {
  SignupScreenState({required SignupUseCase useCase}) : _useCase = useCase;

  final SignupUseCase _useCase;

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
    if (signupFormKey.currentState!.validate()) {
      loading.value = true;
      enabled.value = false;

      final result = await _useCase(
        SignupParams(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      result.fold((failure) {
        SnackBars.error(
          message: failure.message,
          execute: () {
            loading.value = false;
            enabled.value = true;
          },
        );
      }, (id) {
        SnackBars.success(
          message: id,
          execute: () {
            loading.value = false;
            enabled.value = true;
          },
        );
      });
    }
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
