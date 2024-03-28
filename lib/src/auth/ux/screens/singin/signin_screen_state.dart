import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/core/ux/widgets/snackbars.dart';
import 'package:flutter_blog_app/src/auth/ux/blocs/auth_bloc.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:get/get.dart';

class SigninScreenState extends GetxController with NavGraph {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  final isPassword = true.obs;
  final loading = false.obs;
  final enabled = true.obs;

  void toggleIsPassword() {
    isPassword.value = isPassword.toggle()();
  }

  Future<void> signin(BuildContext context) async {
    if (signinFormKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthSignin(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );

      // emailController.clear();
      // passwordController.clear();
    }
  }

  void signinListener(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      loading.value = true;
      enabled.value = false;
    }
    if (state is AuthSuccess) {
      SnackBars.success(
        message: 'User, ${state.user.email}, signed in successfully.',
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
