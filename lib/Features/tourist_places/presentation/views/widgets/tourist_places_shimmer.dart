import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/shimmer_list.dart';
import '../../../../../core/widgets/shimmer_place_holder.dart';
class TouristPlacesShimmer extends StatelessWidget {
  const TouristPlacesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ShimmerList(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShimmerPlaceholder(
            aspectRatio: 2.5,
            padding: const  EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(basicRadius),
          ),
        ),
      ),
    );
  }
}
