part of 'package:flutter_blog_app/src/auth/ux/screens/signin/signin_screen.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Get.find<SigninScreenState>();
    return Obx(
      () {
        return CustomButton.solid(
          text: AuthResources.Strings.signin,
          backgroundColor: Palette.borderColor,
          onPressed: state.signin,
          loading: state.loading(),
          enabled: state.enabled(),
          width: double.infinity,
          height: 55,
        );
      },
    );
  }
}
