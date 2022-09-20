import 'dart:developer';
import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';

class NowDrawerTile extends StatelessWidget {
  const NowDrawerTile({
    Key? key,
    this.title = 'Placeholder Title',
    this.icon,
    this.onTap = defaultFunc,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final VoidCallback onTap;
  final bool isSelected;

  static void defaultFunc() {
    log('the function works!');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? NowUIColors.black.withOpacity(0.07)
                  : Colors.transparent,
              offset: const Offset(0, 0.5),
              spreadRadius: 3,
              blurRadius: 10,
            )
          ],
          color: isSelected ? NowUIColors.white : NowUIColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(54)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected
                  ? NowUIColors.primary
                  : NowUIColors.white.withOpacity(0.6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  letterSpacing: .3,
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: isSelected
                      ? NowUIColors.primary
                      : NowUIColors.white.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
