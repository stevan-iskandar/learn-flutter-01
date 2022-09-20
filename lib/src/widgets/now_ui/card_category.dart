import 'dart:developer';
import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key,
    this.title = 'Placeholder Title',
    this.img =
        'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
    this.onTap = defaultFunc,
  }) : super(key: key);

  final String title;
  final String img;
  final VoidCallback onTap;

  static void defaultFunc() {
    log('the function works!');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 252,
      width: null,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 0.4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: NowUIColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
