import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';

class NowIconButton extends StatelessWidget {
  const NowIconButton({
    Key? key,
    required this.icon,
    this.fillColor = NowUIColors.primary,
    this.color = NowUIColors.white,
    this.onPressed = defaultFunction,
  }) : super(key: key);

  final IconData icon;
  final Color fillColor;
  final Color color;
  final VoidCallback onPressed;

  static void defaultFunction() {}

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 4.0,
      fillColor: fillColor,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 16.0,
        color: color,
      ),
    );
  }
}
