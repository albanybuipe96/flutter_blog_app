part of 'package:flutter_blog_app/src/auth/ux/screens/signin/signin_screen.dart';

class SigninForm extends StatelessWidget with FormValidator {
  SigninForm({super.key});

  final state = Get.find<SigninScreenState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: state.signinFormKey,
        child: Column(
          children: [
            const Gap(Dimens.mega + Dimens.macro),
            _signinTitle,
            const Gap(Dimens.micro),
            _emailField,
            const Gap(Dimens.micro),
            _passwordField,
            const Gap(Dimens.femto),
            _signupPanel,
            const Gap(Dimens.nano),
            _signinButton,
          ],
        ),
      ),
    );
  }

  Widget get _signinTitle => Text(
        AuthResources.Strings.signin,
        style: const TextStyle(
          fontSize: Dimens.meso,
          fontWeight: FontWeight.bold,
        ),
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

  Widget get _signupPanel => Row(
        children: [
          Text(AuthResources.Strings.havNoAccount),
          CustomButton.text(
            text: AuthResources.Strings.signup,
            style: AuthResources.Styles.authPanelButtonStyle,
            onPressed: state.gotoSignupScreen,
          ),
        ],
      );

  Widget get _signinButton => const SigninButton();
}


