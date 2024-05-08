import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/Features/on_boarding/presentation/views/widgets/on_boarding_body.dart';
import 'package:travanix/core/styles/app_colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:Colors.white,
        statusBarIconBrightness: Brightness.dark
    ));
    return const SafeArea(
      child:  Scaffold(

        body: OnBoardingBody(),
      ),
    );
  }
}
