import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/dimens.dart';
import 'package:flutter_blog_app/core/ux/widgets/custom_button.dart';
import 'package:flutter_blog_app/core/ux/widgets/input_field.dart';
import 'package:flutter_blog_app/env/secrets.dart';
import 'package:flutter_blog_app/src/auth/platform/data/repositories/auth_repository_impl.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/remote/auth_remote_data_source.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signup_usecase.dart';
import 'package:flutter_blog_app/src/auth/resources/auth_resources.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen_state.dart';
import 'package:flutter_blog_app/src/auth/ux/shared/form_scaffold.dart';
import 'package:flutter_blog_app/src/auth/ux/shared/form_validator.dart';
import 'package:flutter_blog_app/src/shared/di.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'package:flutter_blog_app/src/auth/ux/screens/signup/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      padding: const EdgeInsets.all(Dimens.nano),
      body: _form,
    );
  }

  Widget get _form => SignupForm();
}
