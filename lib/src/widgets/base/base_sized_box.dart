import 'package:flutter/material.dart';

class BaseSizedBox extends StatelessWidget {
  const BaseSizedBox({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: padding != EdgeInsets.zero
          ? Padding(
              padding: padding,
              child: child,
            )
          : child,
    );
  }
}
