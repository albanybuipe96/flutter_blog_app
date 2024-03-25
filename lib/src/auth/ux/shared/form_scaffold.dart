import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/utils/utils.dart';

class FormScaffold extends StatelessWidget {
  const FormScaffold({
    required this.body,
    this.appBar,
    this.topBarHeight,
    this.backgroundColor,
    this.bottomNavBar,
    this.padding,
    super.key,
  });

  final Widget? appBar;
  final double? topBarHeight;
  final Widget body;
  final Widget? bottomNavBar;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Utils.hideStatusBar();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(topBarHeight ?? 55),
          child: appBar ?? _sizedBox,
        ),
        body: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: body,
        ),
        bottomNavigationBar:
            bottomNavBar != null ? BottomAppBar(child: bottomNavBar) : null,
      ),
    );
  }

  static const _width = 0.0;
  static const _height = 0.0;

  SizedBox get _sizedBox => const SizedBox(
        width: _width,
        height: _height,
      );
}
