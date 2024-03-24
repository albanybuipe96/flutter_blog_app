import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupScreenState extends GetxController {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isPassword = true.obs;
  final loading = false.obs;
  final enabled = true.obs;

  void toggleIsPassword() {
    isPassword.value = isPassword.toggle()();
  }

  void toggleEnabled() {
    enabled.value = enabled.toggle()();
  }

  void toggleLoading() {
    loading.value = loading.toggle()();
  }

  Future<void> signup() async {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return;
    }

    loading.value = true;
    enabled.value = false;

    await Future.delayed(const Duration(seconds: 2), () {
      loading.value = false;
      enabled.value = true;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
