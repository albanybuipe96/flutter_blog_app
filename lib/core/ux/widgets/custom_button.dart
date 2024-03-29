import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/resources.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.blue,
    this.borderRadius = Dimens.nano,
    this.width = 100,
    this.height = 45,
    this.elevation = 0,
    this.borderColor,
    this.loaderColor,
    this.style = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    this.enabled = true,
    this.loading = false,
    super.key,
  });

  factory CustomButton.outline({
    required String text,
    TextStyle? style = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    void Function()? onPressed,
    double borderRadius = Dimens.nano,
    Color? borderColor,
    Color? loaderColor = Colors.white,
    double? width = 120,
    double? height = 47,
    double? elevation = 0,
    bool enabled = true,
    bool loading = false,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      style: style,
      borderRadius: borderRadius,
      borderColor: borderColor,
      loaderColor: loaderColor,
      backgroundColor: null,
      height: height,
      width: width,
      elevation: elevation,
      enabled: enabled,
      loading: loading,
    );
  }

  factory CustomButton.solid({
    required String text,
    TextStyle? style = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    void Function()? onPressed,
    double borderRadius = Dimens.nano,
    Color? borderColor = Colors.transparent,
    Color? loaderColor = Colors.white,
    Color? backgroundColor = Colors.blue,
    double? width = 120,
    double? height = 47,
    double? elevation = 0,
    bool enabled = true,
    bool loading = false,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      style: style,
      borderRadius: borderRadius,
      borderColor: borderColor,
      loaderColor: loaderColor,
      backgroundColor: backgroundColor,
      height: height,
      width: width,
      elevation: elevation,
      enabled: enabled,
      loading: loading,
    );
  }

  factory CustomButton.text({
    required String text,
    TextStyle? style = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    void Function()? onPressed,
    double? width,
    double? height,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      style: style,
      borderRadius: 0,
      backgroundColor: null,
      borderColor: Colors.transparent,
      height: height,
      width: width,
    );
  }

  final String text;
  final TextStyle? style;
  final void Function()? onPressed;
  final double borderRadius;
  final Color? borderColor;
  final Color? loaderColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? elevation;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      color: backgroundColor,
      disabledColor: Colors.grey.shade400,
      minWidth: width,
      height: height,
      disabledElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        side: BorderSide(color: borderColor ?? Colors.black),
      ),
      onPressed: enabled ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.nano),
        child: loading
            ? SizedBox(
                height: height! * .5,
                width: height! * .5,
                child: CircularProgressIndicator(
                  color: loaderColor,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 5,
                ),
              )
            : Text(text, style: style),
      ),
    );
  }
}
