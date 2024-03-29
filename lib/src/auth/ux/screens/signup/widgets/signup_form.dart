part of 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen.dart';

class SignupForm extends StatelessWidget with FormValidator {
  SignupForm({super.key});

  final state = Get.find<SignupScreenState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: state.signupFormKey,
        child: Column(
          children: [
            const Gap(Dimens.mega),
            _signupTitle,
            const Gap(Dimens.micro),
            _usernameField,
            const Gap(Dimens.micro),
            _emailField,
            const Gap(Dimens.micro),
            _passwordField,
            const Gap(Dimens.femto),
            _signinPanel,
            const Gap(Dimens.nano),
            _signupButton,
          ],
        ),
      ),
    );
  }

  Widget get _signupTitle => Text(
        AuthResources.Strings.signup,
        style: const TextStyle(
          fontSize: Dimens.meso,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget get _usernameField => InputField(
        controller: state.usernameController,
        validator: nameValidator,
        fillColor: Colors.transparent,
        label: AuthResources.Strings.username,
        leading: const Icon(EvaIcons.personOutline),
        style: const TextStyle(color: Colors.white),
        bordered: true,
        borderColor: Palette.borderColor,
      );

  Widget get _emailField => InputField(
        controller: state.emailController,
        validator: emailValidator,
        fillColor: Colors.transparent,
        label: AuthResources.Strings.email,
        keyboardType: TextInputType.emailAddress,
        leading: const Icon(EvaIcons.emailOutline),
        style: const TextStyle(color: Colors.white),
        bordered: true,
        borderColor: Palette.borderColor,
      );

  Widget get _passwordField => Obx(
        () => InputField(
          controller: state.passwordController,
          validator: passwordValidator,
          label: AuthResources.Strings.password,
          leading: const Icon(EvaIcons.lockOutline),
          obscure: state.isPassword(),
          trailing: IconButton(
            onPressed: state.toggleIsPassword,
            icon: state.isPassword()
                ? const Icon(EvaIcons.eyeOutline, color: Colors.white)
                : const Icon(EvaIcons.eyeOffOutline, color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
          fillColor: Colors.transparent,
          bordered: true,
          borderColor: Palette.borderColor,
        ),
      );

  Widget get _signinPanel => Row(
        children: [
          Text(AuthResources.Strings.haveAccount),
          CustomButton.text(
            text: AuthResources.Strings.signin,
            style: AuthResources.Styles.authPanelButtonStyle,
            onPressed: state.gotoSigninScreen,
          ),
        ],
      );

  Widget get _signupButton => const SignupButton();
}
