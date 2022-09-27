import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';

class NowTableCellSettings extends StatelessWidget {
  const NowTableCellSettings({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: const TextStyle(color: NowUIColors.text),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: NowUIColors.text,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
