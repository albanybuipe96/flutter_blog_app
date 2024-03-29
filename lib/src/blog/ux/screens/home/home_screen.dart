import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/common/auth/current_user_state.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget with NavGraph {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title,
        actions: _actions,
      ),
    );
  }

  Widget get _title => const Text('Home Screen');

  List<Widget> get _actions {
    final currentUserState = Get.find<CurrentUserState>();
    return [
      IconButton(
        onPressed: () => currentUserState.signout(
          navigateTo: offToSigninScreen,
        ),
        icon: const Icon(EvaIcons.logOutOutline),
      ),
    ];
  }
}
