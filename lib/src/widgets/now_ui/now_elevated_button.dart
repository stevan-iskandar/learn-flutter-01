import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';

class NowElevatedButton extends StatelessWidget {
  const NowElevatedButton({
    Key? key,
    this.text = '',
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: NowUIColors.defaultColor,
          onPrimary: NowUIColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 12,
            bottom: 12,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
