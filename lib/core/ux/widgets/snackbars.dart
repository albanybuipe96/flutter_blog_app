import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ErrorType { form, image, auth }

class SnackBars {
  static void error({
    ErrorType type = ErrorType.form,
    String? message,
    void Function()? execute,
  }) {
    switch (type) {
      case ErrorType.form:
        Get.snackbar(
          'Form validation error(s)',
          message ?? 'Some fields marked as required have not been filled.',
          duration: const Duration(seconds: 5),
        );
      case ErrorType.image:
        Get.snackbar(
          'Form validation error(s)',
          'Pick a profile image to continue.',
          duration: const Duration(seconds: 5),
        );
      case ErrorType.auth:
        Get.snackbar('Authentication Error', '$message');
    }

    execute?.call();
  }

  static void success({String? message, void Function()? execute}) {
    Get.snackbar(
      'Success',
      message ?? 'Your account has been created successfully.',
      icon: const Icon(Icons.done_all_outlined),
      duration: const Duration(seconds: 5),
    );

    execute?.call();
  }
}
