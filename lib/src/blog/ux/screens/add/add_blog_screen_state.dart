import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class AddBlogScreenState extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final loading = false.obs;
  final enabled = true.obs;
  final readOnly = true.obs;

  void post() {
    loading.value = true;
    enabled.value = false;
    Future.delayed(const Duration(milliseconds: 1000), () {
      loading.value = false;
      enabled.value = true;

      final text =
          jsonEncode(QuillConfig.quillController.document.toDelta().toJson());
      log('$text', name: '$runtimeType');
    });
  }

  void clearInputController() {
    titleController.clear();
    contentController.clear();
  }

  @override
  void onInit() {
    readDocument();
    titleController.addListener(() {});
    contentController.addListener(() {});
    super.onInit();
  }

  void readDocument() {
    final json = jsonDecode(jsonString);
    QuillConfig.quillController.document = Document.fromJson(
      json as List<dynamic>,
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
