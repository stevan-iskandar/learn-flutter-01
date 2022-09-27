import 'package:flutter/material.dart';

class BaseCenter extends StatelessWidget {
  const BaseCenter({
    Key? key,
    this.widthFactor,
    this.heightFactor,
    this.child,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final double? widthFactor;
  final double? heightFactor;
  final Widget? child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final center = Center(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: padding != EdgeInsets.zero
          ? Padding(
              padding: padding,
              child: child,
            )
          : child,
    );

    return margin != EdgeInsets.zero
        ? Padding(
            padding: margin,
            child: center,
          )
        : center;
  }
}
