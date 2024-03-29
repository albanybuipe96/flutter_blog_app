import 'package:flutter_blog_app/src/auth/ux/screens/signin/signin_screen.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/home/home_screen.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/read/read_blog_screen.dart';
import 'package:get/get.dart';

mixin class NavGraph {
  void goToSigninScreen() {
    Get.to<void>(SigninScreen.new);
  }

  void offToSigninScreen() {
    Get.off<void>(SigninScreen.new);
  }

  void goToSignupScreen() {
    Get.to<void>(SignupScreen.new);
  }

  void offToSignupScreen() {
    Get.off<void>(SignupScreen.new);
  }

  void goToHomeScreen() {
    Get.to<void>(HomeScreen.new);
  }

  void offToHomeScreen() {
    Get.off<void>(HomeScreen.new);
  }

  void goToAddBlogScreen() {
    Get.to<void>(AddBlogScreen.new);
  }

  void offToAddBlogScreen() {
    Get.off<void>(AddBlogScreen.new);
  }

  void goToReadBlogScreen() {
    Get.to<void>(ReadBlogScreen.new);
  }

  void offToReadBlogScreen() {
    Get.off<void>(ReadBlogScreen.new);
  }
}
