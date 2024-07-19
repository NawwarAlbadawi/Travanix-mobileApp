import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:travanix/Features/home/presentation/views/widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:Colors.white,
        statusBarIconBrightness: Brightness.dark
    ));
    return  const Scaffold(
      body: HomeViewBody(),
    );

  }
}
