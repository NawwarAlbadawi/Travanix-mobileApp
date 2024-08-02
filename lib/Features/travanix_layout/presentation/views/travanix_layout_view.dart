
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/Features/travanix_layout/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:travanix/Features/travanix_layout/presentation/views/widgets/travanix_layout_view_body.dart';


class TravanixLayoutView extends StatelessWidget {
  const TravanixLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:Colors.white,
        statusBarIconBrightness: Brightness.dark
    ));
    return const Scaffold(
      backgroundColor: Colors.white,

        extendBody: true,
        bottomNavigationBar:  CustomNavBar(),
        body: TravanixLayoutViewBody()

    );
  }
}
