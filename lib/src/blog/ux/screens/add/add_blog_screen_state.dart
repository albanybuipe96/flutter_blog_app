import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_blog_app/core/utils/device_image_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddBlogScreenState extends GetxController with DeviceImagePicker {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final imageUrl = Rx<String?>(null);

  final categories = [
    'Business',
    'Technology',
    'Programming',
    'Science',
    'Politics',
    'Education',
  ];

  final categoryIndex = 0.obs;

  void onCategoryChanged(int index) {
    categoryIndex.value = index;
  }

  final loading = false.obs;
  final enabled = true.obs;
  final readOnly = true.obs;

  Future<void> pickImage() async {
    imageUrl.value = await pickImageFromGallery();
  }

  void post() {
    loading.value = true;
    enabled.value = false;
    Future.delayed(const Duration(milliseconds: 1000), () {
      loading.value = false;
      enabled.value = true;
    });
  }

  void clearInputController() {
    titleController.clear();
    contentController.clear();
  }

  @override
  void onInit() {
    titleController.addListener(() {
      log(titleController.text, name: '$runtimeType');
      log(contentController.text, name: '$runtimeType');
    });
    contentController.addListener(() {});
    super.onInit();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
