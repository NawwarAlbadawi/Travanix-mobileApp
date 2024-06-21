
import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key, required this.onPressed,  this.radius, required this.text, this.color, this.height, this.width});
  final Function () onPressed;
  final double  ? radius;
  final String text;
  final Color?color;
  final double ? height;
  final double ? width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed:onPressed,
      height:height,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius != null?radius!:30),),
      color: color??basicColor,
      child:  Text(text,
      style: AppTextStyles.styleSemiBold20(context).copyWith(
        color: Colors.white
      )),



    );
  }
}
