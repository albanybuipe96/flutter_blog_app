import 'package:flutter/material.dart';
import 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';

class ReadBlogScreen extends StatelessWidget {
  const ReadBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: QuillForm(readOnly: true),
      ),
    );
  }
}
