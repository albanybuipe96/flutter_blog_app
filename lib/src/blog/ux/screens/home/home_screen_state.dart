import 'dart:convert';

import 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';
import 'package:flutter_blog_app/src/shared/nav_graph.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class HomeScreenState extends GetxController with NavGraph {
  void _readDocument(String source) {
    final json = jsonDecode(source);
    QuillConfig.quillController.document =
        Document.fromJson(json as List<dynamic>);
  }

  void readBlog(String source) {
    _readDocument(source);
    goToReadBlogScreen();
  }
}
