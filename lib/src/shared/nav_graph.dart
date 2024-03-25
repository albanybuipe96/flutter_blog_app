import 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/singin/signin_screen.dart';
import 'package:get/get.dart';

mixin class NavGraph {
  void goToSignin() {
    Get.to<void>(SigninScreen.new);
  }

  void offToSignin() {
    Get.off<void>(SigninScreen.new);
  }

  void goToSignup() {
    Get.to<void>(SignupScreen.new);
  }

  void offToSignup() {
    Get.off<void>(SignupScreen.new);
  }
}
