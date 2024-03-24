import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ErrorType { form, image, auth }

class SnackBars {
  static void error({ErrorType type = ErrorType.form, String? message}) {
    switch (type) {
      case ErrorType.form:
        Get.snackbar(
          'Form validation error(s)',
          message ?? 'Some fields marked as required have not been filled.',
          duration: const Duration(seconds: 2),
        );
      case ErrorType.image:
        Get.snackbar(
          'Form validation error(s)',
          'Pick a profile image to continue.',
          duration: const Duration(seconds: 2),
        );
      case ErrorType.auth:
        Get.snackbar('Authentication Error', '$message');
    }
  }

  static void success({String? message, void Function()? execute}) {
    Get.snackbar(
      'Success',
      message ?? 'Your account has been created successfully.',
      icon: const Icon(Icons.done_all_outlined),
      duration: const Duration(seconds: 2),
    );

    execute?.call();
  }
}
