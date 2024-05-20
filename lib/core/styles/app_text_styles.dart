
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';


abstract class AppTextStyles {
  static TextStyle styleRegular16(context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),

      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),

      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),

      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),

      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),

      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),

      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: getResponsiveFontSize(context, fontSize: 12),

      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),

      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleMedium24(BuildContext context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),

      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: getResponsiveFontSize(context, fontSize: 14),

      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      color: navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),

      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      color:navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 18),

      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      color:navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 18),

      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      color:navyBlueColor,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      
      fontWeight: FontWeight.w500,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width <= 600) {
    return width / 400;
  } else if (width <= 1000) {
    return width / 650;
  } else {
    return width / 1200;
  }
}
