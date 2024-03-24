import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/dimens.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    required this.child,
    this.color = Colors.grey,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(Dimens.nano),
    this.borderRadius = Dimens.nano,
    super.key,
  });

  final Widget child;
  final Color color;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: child,
    );
  }
}
