import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';

enum InputType {
  text,
  password,
}

class NowInput extends StatelessWidget {
  const NowInput({
    Key? key,
    this.placeholder,
    this.suffixIcon,
    this.prefixIcon,
    this.inputType = InputType.text,
    this.onTap,
    this.onChanged,
    this.enabled = true,
    this.autofocus = false,
    this.borderColor = NowUIColors.border,
    this.controller,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  final String? placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputType inputType;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final bool enabled;
  final bool autofocus;
  final Color borderColor;
  final TextEditingController? controller;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final textField = TextField(
      cursorColor: NowUIColors.muted,
      onTap: onTap,
      onChanged: (String? value) => onChanged!(value),
      enabled: enabled,
      controller: controller,
      autofocus: autofocus,
      obscureText: inputType == InputType.password,
      style: const TextStyle(
        height: 0.55,
        fontSize: 13.0,
        color: NowUIColors.time,
      ),
      textAlignVertical: const TextAlignVertical(y: 0.6),
      decoration: InputDecoration(
        filled: true,
        fillColor: NowUIColors.white,
        hintStyle: const TextStyle(
          color: NowUIColors.time,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
            color: borderColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
            color: borderColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        hintText: placeholder,
      ),
    );

    return margin != EdgeInsets.zero
        ? Padding(
            padding: margin,
            child: textField,
          )
        : textField;
  }
}
