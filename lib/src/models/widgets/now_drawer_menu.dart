import 'package:flutter/cupertino.dart';

class NowDrawerMenu {
  const NowDrawerMenu({
    required this.title,
    required this.name,
    required this.url,
    required this.icon,
  });

  final String title;
  final String name;
  final String url;
  final IconData icon;
}
