
import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

import '../styles/app_colors.dart';

InputDecoration buildInputDecoration(BuildContext context, TextEditingController controller,Function  () onPress) {
  return InputDecoration(
      focusedBorder:const  UnderlineInputBorder(
          borderSide: BorderSide(color: basicColor)
      ) ,
      suffixIcon: IconButton(
        icon: const   Icon(Icons.send,
          color: basicColor,),
        onPressed:onPress ,
      ),

      hintText: 'Enter your review',
    hintStyle: AppTextStyles.styleMedium14(context).copyWith(
      color: greyColor
    )
     
  );
}