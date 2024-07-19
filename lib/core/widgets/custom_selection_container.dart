
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class CustomSelectionContainer extends StatelessWidget {
  const CustomSelectionContainer({
    super.key,
    required this.borderRadius, required this.icon, required this.onPress,
  });

  final BorderRadius borderRadius;
  final IconData icon;
  final Function() onPress;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: basicColor,
        borderRadius:borderRadius,

      ),
      child: IconButton(
        icon:  Icon(icon,
          color: Colors.white,),
        onPressed: onPress,
      ),
    );
  }
}