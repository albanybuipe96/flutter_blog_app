import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/common/auth/current_user_state.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen_state.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/home/home_screen_state.dart';
import 'package:flutter_blog_app/src/shared/di.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget with NavGraph {
  HomeScreen({super.key});

  final _ = Di.injectHomeScreenState();
  final __ = Di.injectAddBlogScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title,
        actions: _actions,
      ),
    );
  }

  Widget get _title => const Text('Nexus Blogs');

  List<Widget> get _actions {
    final currentUserState = Get.find<CurrentUserState>();
    final homeScreenState = Get.find<HomeScreenState>();
    return [
      IconButton(
        onPressed: goToAddBlogScreen,
        icon: const Icon(EvaIcons.plusCircleOutline),
      ),
      IconButton(
        onPressed: () => homeScreenState.readBlog(jsonString),
        icon: const Icon(EvaIcons.plusSquareOutline),
      ),
      IconButton(
        onPressed: () => currentUserState.signout(
          navigateTo: offToSigninScreen,
        ),
        icon: const Icon(EvaIcons.logOutOutline),
      ),
    ];
  }
}
