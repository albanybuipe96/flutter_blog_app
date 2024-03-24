import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupScreenState extends GetxController {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isPassword = true.obs;

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void toggleIsPassword() {
    isPassword.value = isPassword.toggle()();
  }
}
