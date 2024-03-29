import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/resources.dart';
import 'package:flutter_blog_app/core/ux/widgets/custom_button.dart';
import 'package:flutter_blog_app/core/ux/widgets/input_field.dart';
import 'package:flutter_blog_app/src/blog/resources/blog_resources.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen_state.dart';
import 'package:flutter_blog_app/src/shared/di.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

part 'package:flutter_blog_app/src/blog/ux/screens/shared/quill_form.dart';

part 'package:flutter_blog_app/src/blog/ux/screens/add/widgets/image_uploader.dart';

part 'package:flutter_blog_app/src/blog/ux/screens/add/widgets/content_form.dart';
part 'package:flutter_blog_app/src/blog/ux/screens/add/widgets/category_slider.dart';

class AddBlogScreen extends StatelessWidget {
  AddBlogScreen({super.key});

  final _ = Di.injectAddBlogScreenState();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title,
        actions: _actions,
      ),
      body: const SingleChildScrollView(
        child: ContentForm(),
      ),
      bottomNavigationBar: _bottomAppBar,
    );
  }

  Widget get _title => Text(BlogResources.Strings.newBlog);

  List<Widget> get _actions {
    final state = Get.find<AddBlogScreenState>();
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(EvaIcons.saveOutline),
      ),
    ];
  }

  Widget get _bottomAppBar {
    final state = Get.find<AddBlogScreenState>();
    return BottomAppBar(
      color: Colors.transparent,
      child: Obx(
        () => CustomButton.solid(
          elevation: 0,
          text: BlogResources.Strings.post,
          backgroundColor: Palette.borderColor,
          onPressed: state.post,
          enabled: state.enabled(),
          loading: state.loading(),
        ),
      ),
    );
  }
}
