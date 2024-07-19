
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/widgets/shimmer_place_holder.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key, required this.child});
  final Widget  child;

  static const List<CategoryShimmer> items = [
    CategoryShimmer(),
    CategoryShimmer(),
    CategoryShimmer(),
    CategoryShimmer(),
    CategoryShimmer(),
    CategoryShimmer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: greyColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(8,
              (index)=>child),
        ),
      ),
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerPlaceholder(
      aspectRatio: 2 / 1,
      padding:
      const EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 8),
      borderRadius: BorderRadius.circular(30.0),
    );
  }
}