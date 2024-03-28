import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/core/ux/widgets/snackbars.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signup_usecase.dart';
import 'package:flutter_blog_app/src/auth/ux/blocs/auth_bloc.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:get/get.dart';

class SignupScreenState extends GetxController with NavGraph {
  SignupScreenState();

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

  Future<void> signup(BuildContext context) async {
    if (signupFormKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthSignup(
              username: usernameController.text.trim(),
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
    }
  }

  void signupListener(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      loading.value = true;
      enabled.value = false;
    }
    if (state is AuthSuccess) {
      SnackBars.success(
        message: 'User signed up successfully.',
        execute: () {
          loading.value = false;
          enabled.value = true;

          goToHomeScreen();
        },
      );
    }
    if (state is AuthFailure) {
      SnackBars.error(
        message: state.message,
        execute: () {
          loading.value = false;
          enabled.value = true;
        },
      );
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
