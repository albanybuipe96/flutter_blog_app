import 'package:flutter_blog_app/src/auth/resources/auth_resources.dart';
import 'package:get/get.dart';

mixin class FormValidator {
  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return AuthResources.Strings.invalidUsername;
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return AuthResources.Strings.emptyEmailField;
    }
    if (!value.isEmail) {
      return AuthResources.Strings.invalidEmail;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return AuthResources.Strings.emptyPasswordField;
    }
    return null;
  }
}
