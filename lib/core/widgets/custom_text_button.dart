import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,  this.textColor, required this.text,
  });
  final String  text;
  final Color ? textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},

      style: TextButton.styleFrom(
          shadowColor: Colors.black,

          foregroundColor: Colors.transparent,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
        padding: EdgeInsets.zero


      ),


      child: Text(text,
        style: AppTextStyles.styleRegular14(context).copyWith(
            color: textColor ?? navyBlueColor.withOpacity(.7),
          shadows: [
            const BoxShadow(
              offset: Offset(0,1),
              color: greyColor
            )
          ]
        ),),


    );
  }
}