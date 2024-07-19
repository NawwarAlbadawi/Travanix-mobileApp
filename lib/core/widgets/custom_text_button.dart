import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,  this.textColor, required this.text, required this.onPressed, this.textStyles,
  });
  final String  text;
  final Color ? textColor;
  final Function () onPressed;
  final TextStyle ?textStyles;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,


      style: TextButton.styleFrom(
          shadowColor: Colors.black,


          foregroundColor: Colors.transparent,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
        padding: EdgeInsets.zero


      ),


      child: Text(text,
        style: textStyles ?? AppTextStyles.styleRegular14(context).copyWith(
            color: textColor ?? navyBlueColor.withOpacity(.7),

        ),),


    );
  }
}