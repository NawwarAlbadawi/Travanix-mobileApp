
import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';
class CustomFavoriteIconButton extends StatelessWidget {
  const CustomFavoriteIconButton({super.key, required this.color, required this.onPress});
  final Color color;
  final Function ()onPress;
  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: onPress, icon: Icon(IconlyBold.heart,color: color,));
  }
}
