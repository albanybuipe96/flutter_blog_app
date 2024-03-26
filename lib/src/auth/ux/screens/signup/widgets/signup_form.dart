part of 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> with FormValidator, NavGraph {
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
        ),
      );

  Widget get _signinPanel => Row(
        children: [
          Text(AuthResources.Strings.haveAccount),
          CustomButton.text(
            text: AuthResources.Strings.signin,
            style: const TextStyle(color: Colors.blue),
            onPressed: offToSignin,
          ),
        ],
      );

  Widget get _signupButton {
    final uiState = Get.find<SignupScreenState>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          uiState.loading.value = true;
          uiState.enabled.value = false;
        }
        if (state is AuthSuccess) {
          uiState.loading.value = false;
          uiState.enabled.value = true;
        }
      },
      builder: (context, state) {
        return Obx(
          () {
            return CustomButton(
              text: AuthResources.Strings.signup,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              loaderColor: Colors.white,
              onPressed: () {
                uiState.loading.value = true;
                uiState.enabled.value = false;
                uiState.signup(context);
              },
              loading: uiState.loading(),
              enabled: uiState.enabled(),
              width: double.infinity,
              height: 55,
            );
          },
        );
      },
    );
  }
}
