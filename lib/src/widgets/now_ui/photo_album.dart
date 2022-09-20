import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';

class PhotoAlbum extends StatelessWidget {
  const PhotoAlbum({
    Key? key,
    required this.imgArray,
  }) : super(key: key);

  final List<String> imgArray;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Album',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(color: NowUIColors.primary, fontSize: 12.0),
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: imgArray
                .map(
                  (item) => Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
