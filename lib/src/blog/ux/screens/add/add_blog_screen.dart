import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/dimens.dart';
import 'package:flutter_blog_app/core/ux/widgets/custom_button.dart';
import 'package:flutter_blog_app/src/blog/resources/blog_resources.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen_state.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

part 'package:flutter_blog_app/src/blog/ux/screens/add/quill_form.dart';

class AddBlogScreen extends StatelessWidget {
  const AddBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title,
        actions: _actions,
      ),
      body: const QuillForm(readOnly: false,),
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
      child: Obx(() {
        return CustomButton.solid(
          text: BlogResources.Strings.post,
          onPressed: state.post,
          enabled: state.enabled(),
          loading: state.loading(),
        );
      }),
    );
  }
}
