import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CustomToast  {

final String text;
final Color color;

 const CustomToast({required this.text, required this.color});
  OverlaySupportEntry build(BuildContext context) {
    return  showSimpleNotification(

       Text(text,
       style: AppTextStyles.styleMedium18(context),),
      position: NotificationPosition.top,
      slideDismiss: true,
      background: color,
    );
  }
}
