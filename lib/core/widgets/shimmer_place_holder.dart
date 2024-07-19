
import 'package:flutter/material.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({
    super.key,
    required this.aspectRatio,
    required this.padding,
    required this.borderRadius,
  });

  final double aspectRatio;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}