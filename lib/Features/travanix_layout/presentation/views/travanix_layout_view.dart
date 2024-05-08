
import 'package:flutter/material.dart';
import 'package:travanix/Features/travanix_layout/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:travanix/Features/travanix_layout/presentation/views/widgets/travanix_layout_view_body.dart';


class TravanixLayoutView extends StatelessWidget {
  const TravanixLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        extendBody: true,
        bottomNavigationBar:  CustomNavBar(),
        body: TravanixLayoutViewBody()

    );
  }
}
