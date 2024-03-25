import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreenState extends GetxController {
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
    if (signinFormKey.currentState!.validate()) {
      loading.value = true;
      enabled.value = false;

      await Future.delayed(const Duration(seconds: 2), () {
        loading.value = false;
        enabled.value = true;
      });

      emailController.clear();
      passwordController.clear();
    }
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
