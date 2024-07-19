import 'package:flutter/material.dart';

import 'package:travanix/Features/on_boarding/presentation/views/widgets/on_boarding_body.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {

    return const SafeArea(
      child:  Scaffold(

        body: OnBoardingBody(),
      ),
    );
  }
}
