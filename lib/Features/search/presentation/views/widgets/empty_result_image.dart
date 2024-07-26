import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
class EmptyResultImage extends StatelessWidget {
  const EmptyResultImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Image.asset(Assets.imagesImageNotFond));
  }
}
