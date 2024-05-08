import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CustomToast  {


 const CustomToast();
  OverlaySupportEntry build( { required BuildContext context ,required text, required color}) {

    return  showSimpleNotification(
      context: context,

       Text(text,
       style: AppTextStyles.styleMedium18(context).copyWith(
         color: Colors.white
       ),),
      slideDismissDirection: DismissDirection.up,

      background: color,

    );
  }
}
