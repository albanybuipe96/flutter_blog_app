import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreenState extends GetxController {
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

      await Future.delayed(const Duration(seconds: 2), () {
        loading.value = false;
        enabled.value = true;
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
