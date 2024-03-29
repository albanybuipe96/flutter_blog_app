import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/resources/dimens.dart';
import 'package:flutter_blog_app/core/ux/widgets/bordered_container.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.onChanged,
    this.onFocused,
    this.label = 'Label',
    this.maxLines = 1,
    this.validator,
    this.obscure = false,
    this.style,
    this.keyboardType,
    this.leading,
    this.trailing,
    this.fillColor = const Color(0xFFF4F4F4), // FFF4F4F4
    this.borderColor = const Color(0xFFECECEC),
    this.borderPadding,
    this.borderRadius = Dimens.nano,
    this.bordered = false,
    this.elevation = 0,
    this.controller,
    this.labelColor = Colors.grey,
  });

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onFocused;
  final String? label;
  final bool obscure;
  final int maxLines;
  final TextInputType? keyboardType;
  final Widget? leading;
  final Widget? trailing;
  final Color? fillColor;
  final TextEditingController? controller;
  final double borderRadius;
  final double elevation;
  final bool bordered;
  final Color? borderColor;
  final EdgeInsets? borderPadding;
  final Color? labelColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    if (bordered) {
      return BorderedContainer(
        // backgroundColor: fillColor,
        color: borderColor ?? Colors.grey.shade300,
        padding: borderPadding ?? const EdgeInsets.all(2),
        borderRadius: borderRadius,
        child: Material(
          elevation: elevation,
          color: fillColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: fillColor,
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            child: TextFormField(
              maxLines: maxLines,
              controller: controller,
              onChanged: onChanged,
              focusNode: FocusNode()..addListener(onFocused ?? () {}),
              validator: validator,
              obscureText: obscure,
              style: style,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: '$label',
                hintStyle: TextStyle(color: labelColor),
                prefixIcon: leading,
                suffixIcon: trailing,
                border: InputBorder.none,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Material(
        elevation: elevation,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: fillColor,
        child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            maxLines: maxLines,
            focusNode: FocusNode()..addListener(onFocused ?? () {}),
            validator: validator,
            obscureText: obscure,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: '$label',
              hintStyle: TextStyle(color: labelColor),
              prefixIcon: leading,
              suffixIcon: trailing,
              border: InputBorder.none,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: const BorderSide(color: Colors.red, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: const BorderSide(color: Colors.red, width: 0.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.5),
              ),
            ),
          ),
        ),
      );
    }
  }
}
