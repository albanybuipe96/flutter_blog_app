import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/core/resources/dimens.dart';
import 'package:flutter_blog_app/core/resources/resources.dart';
import 'package:flutter_blog_app/core/ux/widgets/custom_button.dart';
import 'package:flutter_blog_app/core/ux/widgets/input_field.dart';
import 'package:flutter_blog_app/src/auth/resources/auth_resources.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/singin/signin_screen_state.dart';
import 'package:flutter_blog_app/src/auth/ux/shared/form_scaffold.dart';
import 'package:flutter_blog_app/src/auth/ux/shared/form_validator.dart';
import 'package:flutter_blog_app/src/shared/di.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

part 'package:flutter_blog_app/src/auth/ux/screens/singin/widgets/signin_form.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final screenState = Di.injectSigninScreenState();

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      padding: const EdgeInsets.all(Dimens.nano),
      body: _form,
    );
  }

  Widget get _form => const SigninForm();
}
