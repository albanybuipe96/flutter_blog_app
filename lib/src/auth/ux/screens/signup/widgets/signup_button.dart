

part of 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Get.find<SignupScreenState>();
    return Obx(
          () {
        return CustomButton.solid(
          text: AuthResources.Strings.signup,
          backgroundColor: Palette.borderColor,
          onPressed: state.signup,
          loading: state.loading(),
          enabled: state.enabled(),
          width: double.infinity,
          height: 55,
        );
      },
    );
  }
}

