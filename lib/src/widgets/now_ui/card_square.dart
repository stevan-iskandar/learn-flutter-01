import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';

class CardSquare extends StatelessWidget {
  const CardSquare({
    Key? key,
    this.title = 'Placeholder Title',
    this.cta = '',
    this.img =
        'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
    this.onTap = defaultFunc,
  }) : super(key: key);

  final String title;
  final String cta;
  final String img;
  final VoidCallback onTap;

  static void defaultFunc() {
    debugPrint('the function works!');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: null,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3,
          shadowColor: NowUIColors.muted.withOpacity(0.22),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 9.0,
                    bottom: 10.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: NowUIColors.text,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        cta,
                        style: const TextStyle(
                          color: NowUIColors.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
