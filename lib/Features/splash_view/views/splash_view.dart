import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/Features/splash_view/widgets/splash_view_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:basicColor,
        statusBarIconBrightness: Brightness.dark
    ));
    return const Scaffold(

      backgroundColor: basicColor,
      body: SplashViewBody(),
    );
  }
}
